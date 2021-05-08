using System;
using System.Web.UI;

namespace RicFun
{
    public partial class Calcular : Page
    {

        double bolsa = 0;
        double alimen = 0;
        double transp;
        double total = 0;
        double ndias;
        double nfaltas;
        double horas;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*lbtotal.Text = "0";
            cbdias.Text = "1";
            cdfaltas.Text = "0";            
            lbalimen.Text = "0";
            txthoras.Text = "6";
            lbbolsa.Text = "0";
            txttransp.Text = "0";*/
            if (string.IsNullOrEmpty((string)Session["Uselog"]))
            {
                Response.Redirect("Indice.aspx?");
            }
            else
            {
                Label4.Text = (string)Session["Uselog"];
            }
            if (string.IsNullOrEmpty((string)Session["Uselog2"]))
            {
                Response.Redirect("Indice.aspx?");
            }
            else
            {
                Label3.Text = (string)Session["Uselog2"];
            }
        }


        protected void btcalcular_Click(object sender, EventArgs e)
        {
            if (txttransp.Text == "")
            {
                txttransp.Text = "0";
            }
            if (txthoras.Text == "")
            {
                txthoras.Text = "6";
            }
            ndias = (float)Convert.ToDecimal(cbdias.SelectedValue);
            nfaltas = (float)Convert.ToDecimal(cdfaltas.SelectedValue);
            horas = (float)Convert.ToDecimal(txthoras.Text);
            bolsa = (ndias - nfaltas) * horas * 1.67;
            alimen = (ndias - nfaltas) * 4.77;
            transp = (float)Convert.ToDecimal(txttransp.Text);
            if (chkbolsa.Checked)
            {
                total = bolsa + transp + alimen;
                lbbolsa.Text = string.Format("{0:0.##}", bolsa) + "€";
                lbalimen.Text = string.Format("{0:0.##}", alimen) + "€";
                lbtotal.Text = string.Format("{0:0.##}", total) + "€";
            }
            else
            {
                lbbolsa.Text = "";
                total = transp + alimen;
                lbalimen.Text = string.Format("{0:0.##}", alimen) + "€";
                lbtotal.Text = string.Format("{0:0.##}", total) + "€";
            }
            /* string display = "Message Pop-up!";
             ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);*/
        }

        protected void btlimpar_Click(object sender, EventArgs e)
        {
            lbbolsa.Text = "0";
            lbalimen.Text = "0";
            txttransp.Text = "0";
            //txttransp.text.clear()
            lbtotal.Text = "0";
            txthoras.Text = "6";
        }

        protected void chkbolsa_CheckedChanged(object sender, EventArgs e)
        {
            if (chkbolsa.Checked)
            {
                chkbolsa.Text = "Bolsa:";
            }
            else
            {
                chkbolsa.Text = "Sem Bolsa";
                lbbolsa.Text = "";
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