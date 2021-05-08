using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.UI;

namespace RicFun
{

    public partial class confirmemail : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            string email2 = Request.QueryString["email"].ToString();
            string code2 = Request.QueryString["code"].ToString();
            Txtemail.Text = email2;
        }

        public string Generate(string password, int iterations = 1000)
        {
            //generate a random salt for hashing
            var salt = new byte[24];
            new RNGCryptoServiceProvider().GetBytes(salt);
            //hash password given salt and iterations (default to 1000)
            //iterations provide difficulty when cracking
            var pbkdf2 = new Rfc2898DeriveBytes(password, salt, iterations);
            byte[] hash = pbkdf2.GetBytes(24);
            //return delimited string with salt | #iterations | hash
            return Convert.ToBase64String(salt) + "|" + iterations + "|" +
                Convert.ToBase64String(hash);
        }
        protected void Btcriaruser_Click1(object sender, EventArgs e)
        {
            try
            {
                //string email = Request.QueryString["email"].ToString();
                string code = Request.QueryString["code"].ToString();
                string checkuser, checklogin;
                //string connetionString = Server.MapPath("/App_Data/Cosmosfun.mdf;Integrated Security=True");                
                int temp, login;
                string conString = ConfigurationManager.ConnectionStrings
                ["CosmosfunConnectionString"].ConnectionString;
                con = new SqlConnection(conString);
                checkuser = "Select count(*) from Utilizadores where Confirmail ='" + code + "'";
                checklogin = "Select count(*) from Utilizadores where login='" + Txtusername.Text + "'";
                SqlCommand mycommand1 = new SqlCommand(checkuser, con);
                SqlCommand mycom = new SqlCommand(checklogin, con);
                con.Open();
                temp = Convert.ToInt32(mycommand1.ExecuteScalar().ToString());
                login = Convert.ToInt32(mycom.ExecuteScalar().ToString());
                if (temp != 1)
                {
                    con.Close();
                    Response.Write("<script>alert('Esse link esta errado registe novamente')</script>");
                    mycommand1.Dispose();
                }
                else if (login == 1)
                {
                    con.Close();
                    Response.Write("<script>alert('Esse Username ja existe escolha outro')</script>");
                    mycom.Dispose();
                }
                else if (Txtpass.Text.Equals(Txtpass2.Text) && CheckBox1.Checked)
                {
                    string password = Txtpass2.Text;                   
                    con.Close();
                    SqlCommand mycommand = new SqlCommand("Update Utilizadores set nome=@a1, login=@a2, pass=@a3, email=@a4 where confirmail ='" + code + "'", con);
                    mycommand.Parameters.Add("a1", SqlDbType.VarChar, 50).Value = Txtnome.Text;
                    mycommand.Parameters.Add("a2", SqlDbType.VarChar, 50).Value = Txtusername.Text;
                    mycommand.Parameters.Add("a3", SqlDbType.VarChar, 100).Value = Generate(password);
                    mycommand.Parameters.Add("a4", SqlDbType.VarChar, 50).Value = Txtemail.Text;
                    //mycommand.Parameters.Add("a5", SqlDbType.VarChar, 100).Value = salt;
                    con.Open();
                    mycommand.ExecuteNonQuery();
                    mycommand.Dispose();
                    con.Close();
                    Txtpass2.Text = "";
                    Txtpass.Text = "";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Registo", "alert('Registo efectuado com sucesso, Ja pode fazer login!');window.location ='default.aspx';", true);
                }
                /* else if(mycommand.ExecuteNonQuery() == 1)
                      {                  
                      Response.Write("<script>alert('Utilizador criado com sucesso!');</script>");                    
                      Server.Transfer("Areacliente.aspx");
                      }*/
                else
                {
                    con.Close();
                    mycommand1.Dispose();
                    Response.Write("<script>alert('Password não esta igual ou ponha um visto para aceitar as condições')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.Replace("\'", " ") + "')</script>");
            }
        }
    }
}