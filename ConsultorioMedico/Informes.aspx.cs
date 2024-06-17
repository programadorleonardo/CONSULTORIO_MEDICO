using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class Informes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInformDate_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[]{
                new DataColumn("idPatientStudy",typeof(int)),
                new DataColumn("namePatient",typeof(string)),
                new DataColumn("identification",typeof(string)),
                new DataColumn("dateStudy",typeof(string)),
                });
            string query = "SELECT * FROM patientstudy WHERE dateStudy>='"+txtDateBegin.Text+ "' AND dateStudy<='"+txtDateEnd.Text+"'";
            using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {
                conexion.Open();
                MySqlCommand cmd = new MySqlCommand(query, conexion);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        dt.Rows.Add(
                            Convert.ToInt32(dr["idPatientStudy"]),
                            dr["namePatient"].ToString(),
                            dr["identification"].ToString(),
                            dr["dateStudy"].ToString()
                            );
                    }
                    dr.Close();
                }
            }
            GridViewDataPatientStudy.DataSource = dt;
            GridViewDataPatientStudy.DataBind();
        }
    }
}