using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

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
            using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "loginUserSystem";
                cmd.Parameters.AddWithValue("@userPerson", txtUser.Text.ToLower().Trim());
                cmd.Parameters.AddWithValue("@pass", EncrypterPassword(txtPass.Text));
                cmd.Connection = conexion;
                conexion.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["usuario"] = dr.GetString(0);
                        Session["rol"] = dr.GetString(1);
                    }
                }


            }

            if (Session["usuario"] == null)
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