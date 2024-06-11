using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {
                string query = "SELECT * FROM listUserSystem WHERE idUserSystem=" + id + "";
                MySqlCommand cmd = new MySqlCommand(query, conexion);
                conexion.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblNombres.Text = dr["namesUser"].ToString();
                        lblApellidos.Text = dr["lastNamesUser"].ToString();
                        lblNameUser.Text = dr["username"].ToString();
                        lblRol.Text = dr["permissionType"].ToString();
                        lblEmail.Text = dr["emailUser"].ToString();
                        lblTelefono.Text = dr["phoneUser"].ToString();
                    }
                }
            }
        }
    }
}