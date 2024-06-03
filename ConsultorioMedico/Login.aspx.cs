using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class Login : System.Web.UI.Page
    {
         string userDefault = "lebab@hotmail.com";
         string passDefault = "123456789";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Contents.Clear();
        }

        protected void btnStartSession(object sender, EventArgs e)
        {

            if (userDefault == txtUser.Text.ToLower() && passDefault == txtPass.Text)
            {
                Session["usuarioLogeado"] = userDefault;
                Response.Redirect("ConsultaPaciente.aspx");
             
            }
            else
            {
                Response.Redirect("Login.aspx");
            }


        }
    }
}