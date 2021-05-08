using System;

namespace RicFun
{
    public partial class Areaadmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["Uselog"]))
            {
                Response.Redirect("default.aspx?");
            }
            else if (Label1.Text == (string)Session["Uselog"])
            {
                Label1.Text = (string)Session["Uselog"];
            }
            else
            {
                Response.Redirect("default.aspx?");
            }

            if (string.IsNullOrEmpty((string)Session["Uselog2"]))
            {
                Response.Redirect("default.aspx?");
            }
            else if (Label2.Text == (string)Session["Uselog2"])
            {
                Label2.Text = (string)Session["Uselog2"];
            }
            else
            {
                Response.Redirect("default.aspx?");
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