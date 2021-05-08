using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;

namespace RicFun
{
    public partial class Esqueceupass : System.Web.UI.Page
    {

        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            try
            {
                // Session["email"] = txtemail.Text;               
                con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CosmosfunConnectionString"].ConnectionString;
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Utilizadores where email='" + txtemail.Text + "'", con);
                SqlDataReader dataReader;
                dataReader = cmd.ExecuteReader();
                //cmd.SelectCommand.Parameters.AddWithValue("@email", txtemail.Text);
                //adp.SelectCommand.Parameters.AddWithValue("@pass", txtcode.Text);

                if (dataReader.HasRows)
                {
                    string email, code;
                    dataReader.Read();
                    email = dataReader["email"].ToString();
                    code = dataReader["confirmail"].ToString();
                    /* SqlCommand cmd = new SqlCommand("Update Utilizadores set password_change_status=1 where email='" + txtemail.Text + "'", con);
                     cmd.ExecuteNonQuery();*/
                    MailMessage mail = new MailMessage("passreset@mail.com", email, "Fazer Reset a sua Password",
                        "Clique no link para fazer reset a sua Password:  <a href=http://cosmos.somee.com/Fazerresetpass.aspx?user=&email=" + email + "&code=" + code + ">Clique aqui</a>");
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                    smtpClient.Credentials = new System.Net.NetworkCredential()
                    {
                        UserName = "passresetmail.com",
                        Password = "hwgeelf"
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
                    /* MailMessage message = new MailMessage("passreset@mail.com", txtemail.Text.Trim(), "Reset Your Password", sb.ToString());
                     SmtpClient smtp = new SmtpClient();
                     smtp.Host = "smtp.gmail.com";
                     smtp.Port = 587;
                     smtp.Credentials = new System.Net.NetworkCredential("email", "pass");
                     smtp.EnableSsl = true;
                     message.IsBodyHtml = true;*/
                    smtpClient.Send(mail);
                    //lbresult.Text = "Foi enviado para o seu email um link para fazer reset a sua password, por favor verifique.";
                    con.Close();
                    cmd.Dispose();
                    dataReader.Close();
                    txtemail.Text = "";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Registo", "alert('Foi enviado para o seu email um link para fazer reset a sua password, por favor verifique.');window.location ='default.aspx';", true);
                }
                else
                {
                    con.Close();
                    cmd.Dispose();
                    lbresult.Text = "Insira um email valido!";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.Replace("\'", " ") + "')</script>");
            }
        }


        /* private string GetUserEmail(string Email)
         {
             SqlCommand cmd = new SqlCommand("select email from Utilizadores WHERE email=@email", con);
             cmd.Parameters.AddWithValue("@email", txtemail.Text);
             string username = cmd.ExecuteScalar().ToString();
             return username;
         }
       StringBuilder sbody = new StringBuilder();
         here i am sendind a image as logo with the path http://usingaspdotnet.blogspot.com
        sbody.Append("<a href=http://usingaspdotnet.blogspot.com><img src=http://a1.twimg.com/profile_images/1427057726/asp_image.jpg/></a></br>");
                 here i am sending a link to the user's mail address with the three values email,code,uname
                 these three values i am sending  this link with the values using querystring method.
                sbody.Append("<a href=http://usingasp.net/reset_pwd.aspx?email=" + txt_email.Text);
                sbody.Append("&code=" + code + "&uname=" + txt_uname.Text + ">Click here to change your password</a>");
                in the below line i am sending mail with the link to the user.
                in this line i am passing four parameters 1st sender's mail address ,2nd receiever mail address, 3rd Subject,4th sbody.ToString() there will be complete link
                inside the sbody
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("sender’s email address", dt.Rows[0]["email"].ToString(), "Reset Your Password", sbody.ToString());
        mail.CC.Add("any other email address if u want for cc");
                in the below  i am declaring the receiever email address and password
                System.Net.NetworkCredential mailAuthenticaion = new System.Net.NetworkCredential("sender’s email address ", "password");
        in the below  i am declaring the smtp address of gmail and port number of the gmail
        System.Net.Mail.SmtpClient mailclient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
        mailclient.EnableSsl = true;
                mailclient.Credentials = mailAuthenticaion;
                here am setting the property IsBodyHtml true because i am using html tags inside the mail's code
                mail.IsBodyHtml = true;
                mailclient.Send(mail);*/
    }
}
