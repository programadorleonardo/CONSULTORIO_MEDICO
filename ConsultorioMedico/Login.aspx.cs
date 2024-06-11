using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace ConsultorioMedico
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Contents.Clear();
        }

        protected void btnStartSession(object sender, EventArgs e)
        {
            using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {
                string query = "SELECT * FROM login WHERE usuario='" + txtUser.Text.ToLower().Trim() + "' AND idPublic='" + EncrypterPassword(txtPass.Text) + "';";
                MySqlCommand cmd = new MySqlCommand(query,conexion);
                conexion.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["rolUsuario"] = dr["permissionType"].ToString();
                        Session["nameUsuario"]= dr["usuario"].ToString();
                    }
                }


            }

            if (Session["nameUsuario"] == null)
            {
                lblMessageBox.Visible = true;
                lblMessageBox.Text = "Usuario o contraseña equivocada";

            }
            else
            {

                Response.Redirect("Dashboard.aspx");
            }


        }

        public static string EncrypterPassword(string password)
        {
            SHA256 sha256 = SHA256.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null; ;
            StringBuilder sb = new StringBuilder();
            stream = sha256.ComputeHash(encoding.GetBytes(password));
            for (int i = 0; i < stream.Length; i++)
            {
                sb.AppendFormat("{0:x2}", stream[i]);
            }
            return sb.ToString();
        }
    }
}