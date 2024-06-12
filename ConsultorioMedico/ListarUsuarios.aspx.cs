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

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[]{
                new DataColumn("idUserSystem",typeof(int)),
                new DataColumn("username",typeof(string)),
                new DataColumn("permissionType",typeof(string)),
                });
            string query = "SELECT * FROM listUserSystem";
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {

                con.Open();
                MySqlCommand cmd = new MySqlCommand(query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        dt.Rows.Add(
                            Convert.ToInt32(dr["idUserSystem"]),
                            dr["username"].ToString(),
                            dr["permissionType"].ToString()
                            );                        
                    }
                    dr.Close();
                }
            }
            GridViewDataUser.DataSource = dt;
            GridViewDataUser.DataBind();
        }
    }
}