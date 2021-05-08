using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web.UI;

namespace RicFun
{

    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con;


        protected void Btenviamail_Click1(object sender, EventArgs e)
        {
            try
            {
                string checkuser;
                //string connetionString = Server.MapPath("/App_Data/Cosmosfun.mdf;Integrated Security=True");                
                int temp;
                string conString = ConfigurationManager.ConnectionStrings
                ["CosmosfunConnectionString"].ConnectionString;
                con = new SqlConnection(conString);
                checkuser = "Select count(*) from Utilizadores where email='" + Txtemail.Text + "'";
                SqlCommand cmd = new SqlCommand(checkuser, con);
                con.Open();
                temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    con.Close();
                    Response.Write("<script>alert('Esse Utilizador já existe')</script>");
                    cmd.Dispose();
                }
                else
                {
                    cmd.Dispose();
                    //string code = Membership.GeneratePassword(49, 1);
                    string code;
                    code = RandomString(49);
                    SqlCommand mycommand = new SqlCommand("insert into Utilizadores(login,pass,email,confirmail) values (@a1,@a2,@a3,@a4)", con);
                    mycommand.Parameters.Add("a1", SqlDbType.VarChar, 50).Value = code;
                    mycommand.Parameters.Add("a2", SqlDbType.VarChar, 100).Value = code;
                    mycommand.Parameters.Add("a3", SqlDbType.VarChar, 50).Value = code;
                    mycommand.Parameters.Add("a4", SqlDbType.VarChar, 50).Value = code;
                    //mycommand.Parameters.Add("a5", SqlDbType.VarChar, 100).Value = code;
                    mycommand.ExecuteNonQuery();
                    mycommand.Dispose();
                    con.Close();
                    // localhost:44357
                    MailMessage mail = new MailMessage("passreset@mail.com", Txtemail.Text.Trim(), "Criar Novo Utilizador",
                        "Clique no link para criar um novo utilizador:  <a href=http://cosmos.somee.com/Confirmemail.aspx?user=&email=" + Txtemail.Text + "&code=" + code + ">Clique aqui</a>");
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                    smtpClient.Credentials = new System.Net.NetworkCredential()
                    {
                        UserName = "passreset@mail.com",
                        Password = "12344"
                    };
                    mail.IsBodyHtml = true;
                    smtpClient.EnableSsl = true;
                    System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate (object s,
                            System.Security.Cryptography.X509Certificates.X509Certificate certificate,
                            System.Security.Cryptography.X509Certificates.X509Chain chain,
                            System.Net.Security.SslPolicyErrors sslPolicyErrors)
                    {
                        return true;
                    };
                    smtpClient.Send(mail);
                    Txtemail.Text = "";
                    Response.Write("<script>alert('Foi enviado um email com um link para a sua caixa de correio, confirme clicando nesse link para poder criar um novo utilizador')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.Replace("\'", " ") + "')</script>");
            }
        }
        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public new bool IsValid(string testPassword, string origDelimHash)
        {
            //extract original values from delimited hash text
            var origHashedParts = origDelimHash.Split('|');
            var origSalt = Convert.FromBase64String(origHashedParts[0]);
            var origIterations = int.Parse(origHashedParts[1]);
            var origHash = origHashedParts[2];

            //generate hash from test password and original salt and iterations
            var pbkdf2 = new Rfc2898DeriveBytes(testPassword, origSalt, origIterations);
            byte[] testHash = pbkdf2.GetBytes(24);

            //if hash values match then return success
            if (Convert.ToBase64String(testHash) == origHash)
                return true;

            //no match return false
            return false;

        }

        protected void Btlogin_Click(object sender, EventArgs e)
        {
            try
            {
                //Session["username"] = txtuserlogin.Text;
                //HttpContext.Current.Session["UserSession"] = txtuserlogin.Text;               
                string admin = txtuserlogin.Text;
                con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CosmosfunConnectionString"].ConnectionString;
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Utilizadores where login='" + txtuserlogin.Text + "'", con);
                //SqlDataReader dataReader;
                //dataReader = cmd.ExecuteReader();                                             
                string passinsert = txtpasslogin.Text;
                using (var dataReader = cmd.ExecuteReader())
                {
                    dataReader.Read();
                    //string savedHash = dataReader.GetString(4);                
                    string savedHash = dataReader["pass"].ToString();
                    IsValid(passinsert, savedHash);
                    if (IsValid(passinsert, savedHash) == true && admin == "ricmac")
                    {
                        string id, email, usersess, codemail;
                        //dataReader.Read();
                        id = dataReader["Id"].ToString();
                        email = dataReader["email"].ToString();
                        usersess = dataReader["login"].ToString();
                        codemail = dataReader["confirmail"].ToString();
                        //FormsAuthentication.SetAuthCookie(usersess, true);
                        Session["Uselog"] = codemail;
                        Session["Uselog2"] = usersess;
                        con.Close();
                        cmd.Dispose();
                        dataReader.Close();
                        txtpasslogin.Text = "";
                        //Response.AddHeader("REFRESH", "2;URL=Areacliente.aspx");                                        
                        //Response.Redirect(string.Format("Areaadmin.aspx?x={0}", usersess));
                        Response.Redirect("Areaadmin.aspx?");
                        /* HttpCookie myCookie = new HttpCookie("UserSessao");
                         //myCookie = Request.Cookies["CookName"];
                         myCookie.Values["login"] = txtuserlogin.Text;                  
                         myCookie.Values["sessaoid"] = HttpContext.Current.Session.SessionID;
                         myCookie.Expires = DateTime.Now.AddHours(1);
                         Response.Cookies.Add(myCookie);*/
                    }
                    else if (IsValid(passinsert, savedHash) == true)
                    {
                        string id, email, usersess;
                        //dataReader.Read();
                        id = dataReader["Id"].ToString();
                        email = dataReader["email"].ToString();
                        usersess = dataReader["login"].ToString();
                        Session["Uselog"] = Session.SessionID;
                        Session["Uselog2"] = usersess;
                        con.Close();
                        cmd.Dispose();
                        dataReader.Close();
                        txtpasslogin.Text = "";
                        //Response.AddHeader("REFRESH", "2;URL=Areaadmin.aspx");
                        Response.Redirect("Areacliente.aspx?");
                        /*HttpCookie myCookie = new HttpCookie("UserSessao");                    
                        myCookie.Values["login"] = txtuserlogin.Text;                    
                        myCookie.Values["sessionid"] = HttpContext.Current.Session.SessionID;
                        myCookie.Expires = DateTime.Now.AddHours(1);
                        Response.Cookies.Add(myCookie);*/
                    }
                    else if (IsValid(passinsert, savedHash) == false)
                    {
                        con.Close();
                        cmd.Dispose();
                        dataReader.Close();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Registo", "alert('Username ou password errados');window.location ='default.aspx';", true);
                    }
                    else
                    {
                        con.Close();
                        cmd.Dispose();
                        dataReader.Close();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Registo", "alert('Username ou password errados');window.location ='default.aspx';", true);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.Replace("\'", " ") + "')</script>");
            }
        }
    }
}
