using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class NuevoUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {
                string query = "SELECT * FROM listpermissionAdmin;";
                string permiso =Session["rolUsuario"].ToString();
                if (permiso == "superadministrador")
                {
                    query = "SELECT * FROM listpermission";
                }
                conexion.Open();
                MySqlCommand cmd = new MySqlCommand(query, conexion);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (IsPostBack == false)
                {
                    txtRolUser.DataSource = ds;
                    txtRolUser.DataTextField = "permissionType";
                    txtRolUser.DataValueField = "idPermission";
                    txtRolUser.DataBind();
                    txtRolUser.Items.Insert(0, new ListItem("- Selecionar -", "0"));
                }

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

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            string names = txtNombres.Text.ToLower();
            string lastnames = txtApellidos.Text.ToLower();
            string nameUser = txtNombreUsuario.Text.ToLower();
            string passwordUser = EncrypterPassword(txtPasswordUser.Text);
            string emailUser = txtEmailUser.Text.ToLower().Trim();
            string phoneUser = txtTelefonoUser.Text.ToLower().Trim();
            int rolUser = Convert.ToInt32(txtRolUser.SelectedItem.Value.Trim());
            using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "insertUserSystem";
                cmd.Parameters.AddWithValue("@namePerson", names);
                cmd.Parameters.AddWithValue("@lastnamePerson", lastnames);
                cmd.Parameters.AddWithValue("@userPerson", nameUser);
                cmd.Parameters.AddWithValue("@pass", passwordUser);
                cmd.Parameters.AddWithValue("@emailPerson", emailUser);
                cmd.Parameters.AddWithValue("@phonePerson", phoneUser);
                cmd.Parameters.AddWithValue("@rol", rolUser);
                cmd.Connection = conexion;
                conexion.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("ListarUsuarios.aspx");
            }
        }
    }
}