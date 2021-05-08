using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.UI;

namespace RicFun
{
    public partial class Fazerresetpass : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        SqlCommand mycommand;

        protected void Page_Load(object sender, EventArgs e)
        {
            string email2 = Request.QueryString["email"].ToString();
            string code2 = Request.QueryString["code"].ToString();
        }

        /*public const int SaltByteSize = 24;
        public const int HashByteSize = 20; // to match the size of the PBKDF2-HMAC-SHA-1 hash 
        public const int Pbkdf2Iterations = 1000;
        public static string HashPassword(string password)
        {
            var cryptoProvider = new RNGCryptoServiceProvider();
            byte[] salt = new byte[SaltByteSize];
            cryptoProvider.GetBytes(salt);

            var hash = GetPbkdf2Bytes(password, salt, Pbkdf2Iterations, HashByteSize);
            return Pbkdf2Iterations + ":" +
                   Convert.ToBase64String(salt) + ":" +
                   Convert.ToBase64String(hash);
        }
        private static byte[] GetPbkdf2Bytes(string password, byte[] salt, int iterations, int outputBytes)
        {
            var pbkdf2 = new Rfc2898DeriveBytes(password, salt);
            pbkdf2.IterationCount = iterations;
            return pbkdf2.GetBytes(outputBytes);
        }
         */
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

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string email = Request.QueryString["email"].ToString();
            string code = Request.QueryString["code"].ToString();
            //string email = Session["email"].ToString();
            string checkuser;
            //string connetionString = Server.MapPath("/App_Data/Cosmosfun.mdf;Integrated Security=True");                
            int temp;
            string conString = ConfigurationManager.ConnectionStrings
            ["CosmosfunConnectionString"].ConnectionString;
            con = new SqlConnection(conString);
            checkuser = "Select count(*) from Utilizadores where Confirmail ='" + code + "'";
            mycommand = new SqlCommand(checkuser, con);
            con.Open();
            temp = Convert.ToInt32(mycommand.ExecuteScalar().ToString());
            if (temp != 1)
            {
                con.Close();
                Response.Write("<script>alert('Esse link esta errado peça novamente a recuperação da password')</script>");
                mycommand.Dispose();
            }
            else
            {
                string password = txtpwd.Text;                
                SqlCommand cmd = new SqlCommand("Update Utilizadores set pass=@a1 where email=@a2", con);
                cmd.Parameters.Add("a1", SqlDbType.VarChar, 100).Value = Generate(password);
                cmd.Parameters.Add("a2", SqlDbType.VarChar, 50).Value = email;
                cmd.ExecuteNonQuery();
                con.Close();
                cmd.Dispose();
                //Response.Write("<script>alert ('A sua password foi alterada com sucesso')</script>");
                txtpwd.Text = "";
                txtcofrmpwd.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "Registo", "alert('A sua password foi alterada com sucesso');window.location ='default.aspx';", true);
            }
        }
    }
}