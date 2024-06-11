using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class Base : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                labelInformes.Visible = false;
                labelUsuarios.Visible = false;
                labelConfig.Visible = false;
                labelPacientes.Visible = false;
                if (Session["nameUsuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblusername.Text = Session["nameUsuario"].ToString();
                }

                if (Session["rolUsuario"].Equals("superusuario"))
                {
                    labelInformes.Visible = true;
                    labelUsuarios.Visible = true;
                    labelConfig.Visible = true;
                    labelPacientes.Visible = true;
                }
                if (Session["rolUsuario"].Equals("administrador"))
                {
                    labelInformes.Visible = true;
                    labelUsuarios.Visible = true;
                    labelConfig.Visible = true;
                    labelPacientes.Visible = true;
                }
                if (Session["rolUsuario"].Equals("medico"))
                {
                    labelInformes.Visible = true;
                    labelPacientes.Visible = true;
                }
                if (Session["rolUsuario"].Equals("asistente"))
                {
                    labelInformes.Visible = true;
                    labelUsuarios.Visible = true;
                }
            }
        }

        protected void btnSendWhatsapp(object sender, EventArgs e)
        {
        Response.Redirect("https://api.whatsapp.com/send?phone=573024174126");
        }
    }
}