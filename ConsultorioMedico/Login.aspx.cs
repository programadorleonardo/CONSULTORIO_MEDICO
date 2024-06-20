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
            try
            {
                using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedicoNube"].ConnectionString.ToString()))
                {
                    string query = "SELECT * FROM login WHERE usuario='" + txtUser.Text.ToLower().Trim() + "' AND idPublic='" + EncrypterPassword(txtPass.Text) + "';";
                    MySqlCommand cmd = new MySqlCommand(query, conexion);
                    conexion.Open();
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["rolUsuario"] = dr["permissionType"].ToString();
                            Session["nameUsuario"] = dr["usuario"].ToString().ToUpper();
                        }
                    }


                }

                if (Session["nameUsuario"] == null)
                {
                    string script = "$(function() { showModalExito('Error','Usuario o contraseña incorrecta!'); }); ";
                    ClientScript.RegisterClientScriptBlock(GetType(), "Mensaje", script, true);

                }
                else
                {

                    Response.Redirect("Dashboard.aspx");
                }
            }
            catch (Exception)
            {

                string script = "$(function() { showModalExito('Error'); });";
                ClientScript.RegisterClientScriptBlock(GetType(), "Mensaje", script, true);
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