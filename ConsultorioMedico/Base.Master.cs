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
                if (Session["usuarioLogeado"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblusername.Text = Session["usuarioLogeado"].ToString();
                }
            }
        }

        protected void btnSendWhatsapp(object sender, EventArgs e)
        {
        Response.Redirect("https://api.whatsapp.com/send?phone=573024174126");
        }
    }
}