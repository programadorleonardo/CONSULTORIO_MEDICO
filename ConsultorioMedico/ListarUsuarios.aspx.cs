using MySql.Data.MySqlClient;
using Mysqlx.Resultset;
using MySqlX.XDevAPI;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class ListarUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[]{
                new DataColumn("idUserSystem",typeof(int)),
                new DataColumn("username",typeof(string)),
                new DataColumn("permissionType",typeof(string)),
                });
                string query = "SELECT * FROM listusersystem";
                using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedicoNube"].ConnectionString.ToString()))
                {
                    conexion.Open();
                    MySqlCommand cmd = new MySqlCommand(query, conexion);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            dt.Rows.Add(
                                Convert.ToInt32(dr["idUserSystem"]),
                                dr["username"].ToString().ToUpper(),
                                dr["permissionType"].ToString().ToUpper()
                                );
                        }
                        dr.Close();
                    }
                }
                GridViewDataUserSystem.DataSource = dt;
                GridViewDataUserSystem.DataBind();
            }
            catch (Exception ex)
            {
                string script = "$(function() { showModalExito('Error','" + ex + "'); });";
                ClientScript.RegisterClientScriptBlock(GetType(), "Mensaje", script, true);
            }


        }

        protected void btnAddUserSystem_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoUsuario.aspx");
        }
    }
}