using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;

namespace RicFun
{
    public partial class Enviarmensag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["Uselog"]))
            {
                Response.Redirect("default.aspx?");
            }
            else
            {
                Label4.Text = (string)Session["Uselog"];
            }
            if (string.IsNullOrEmpty((string)Session["Uselog2"]))
            {
                Response.Redirect("default.aspx?");
            }
            else
            {
                Label3.Text = (string)Session["Uselog2"];
            }
        }

        protected void Btregistar_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings
                            ["CosmosfunConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            SqlCommand mycommand = new SqlCommand("insert into Mensagem(login,assunto,dataref,mensagem) values (@a1,@a2,@a3,@a4)", con);
            con.Open();
            mycommand.Parameters.Add("a1", SqlDbType.VarChar, 50).Value = Label3.Text;
            mycommand.Parameters.Add("a2", SqlDbType.VarChar, 50).Value = Rdassunto.Text;
            mycommand.Parameters.Add("a3", SqlDbType.VarChar, 50).Value = Txtdata.Text;
            mycommand.Parameters.Add("a4", SqlDbType.VarChar, 500).Value = Txtmensagem.Text;
            mycommand.ExecuteNonQuery();
            con.Close();
            mycommand.Dispose();
            string mensage = Txtmensagem.Text;
            MailMessage mail = new MailMessage("passreset@mail.com", "email@mail.com", "Utilizador",
                       "Um user enviou lhe a seguinte mensagem: " + mensage);
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "passreset@gmail.com",
                Password = "hwgeeef"
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
            ScriptManager.RegisterStartupScript(this, GetType(), "Mensagem", "alert('Mensagem enviada com sucesso');window.location ='Areacliente.aspx';", true);
        }

        protected void Btlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session["Uselog"] = "";
            Session["Uselog2"] = "";
            Response.Redirect("default.aspx?");
        }
    }
}
