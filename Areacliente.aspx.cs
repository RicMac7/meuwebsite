using System;

namespace RicFun
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["Uselog"]))
            {
                Response.Redirect("default.aspx?");
            }
            else
            {
                Label1.Text = (string)Session["Uselog"];
            }
            if (string.IsNullOrEmpty((string)Session["Uselog2"]))
            {
                Response.Redirect("default.aspx?");
            }
            else
            {
                Label2.Text = (string)Session["Uselog2"];
            }
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