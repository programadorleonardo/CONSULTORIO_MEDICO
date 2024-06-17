using Microsoft.SqlServer.Server;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class ListarPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[]{
                new DataColumn("idPatientStudy",typeof(int)),
                new DataColumn("namePatient",typeof(string)),
                new DataColumn("identification",typeof(string)),
                new DataColumn("dateStudy",typeof(string)),
                });
            string query = "SELECT * FROM patientstudy";
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

        public List<string> GetPacientes()
        {
            string query = "SELECT id,MAX(CASE WHEN tagGroup=16 AND tagElement=16 THEN value ELSE NULL END) AS Nombre,MAX(CASE WHEN tagGroup=16 AND tagElement=32 THEN value ELSE NULL END) AS Identificacion,MAX(CASE WHEN tagGroup=8 AND tagElement=32 THEN value ELSE NULL END) AS FechaEstudio,MAX(CASE WHEN tagGroup=8 AND tagElement=4144 THEN value ELSE NULL END) AS Estudio,MAX(CASE WHEN tagGroup=8 AND tagElement=33 THEN value ELSE NULL END) AS otraFechaEstudio,MAX(CASE WHEN tagGroup=8 AND tagElement=96 THEN value ELSE NULL END) AS tipoEstudio FROM maindicomtags GROUP BY id";
            List<string> data = new List<string>();
            using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["dispositivomedicodev"].ConnectionString.ToString()))
            {
                conexion.Open();
                MySqlCommand cmd = new MySqlCommand(query, conexion);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    string nombre = "";
                    string identificacion = "";
                    string fechaEstudio = "";
                    string nombreEstudio = "";
                    string tipoEstudio = "";

                    string fecha = "";
                    string id = "";
                    string año = "";
                    string mes = "";
                    string dia = "";
                    while (dr.Read())
                    {

                        if (!System.String.IsNullOrEmpty(dr["nombre"].ToString()))
                        {
                            if (!data.Contains(dr["nombre"].ToString()))
                            {
                                nombre = dr["nombre"].ToString().ToUpper();
                            }
                        }
                        if (!System.String.IsNullOrEmpty(dr["identificacion"].ToString()))
                        {
                            if (!data.Contains(dr["identificacion"].ToString()))
                            {
                                identificacion = dr["identificacion"].ToString();
                            }
                        }
                        if (!System.String.IsNullOrEmpty(dr["FechaEstudio"].ToString()))
                        {
                            if (!data.Contains(dr["FechaEstudio"].ToString()))
                            {
                                fecha = dr["FechaEstudio"].ToString();
                                año = fecha.Substring(0, 4);
                                mes = fecha.Substring(4, 2);
                                dia = fecha.Substring(6, 2);
                                fechaEstudio = Convert.ToDateTime(año + "-" + mes + "-" + dia).ToString("yyyy-MM-dd");
                            }
                        }
                        if (!System.String.IsNullOrEmpty(dr["Estudio"].ToString()))
                        {
                            if (!data.Contains(dr["Estudio"].ToString()))
                            {
                                nombreEstudio = dr["Estudio"].ToString().ToUpper();
                            }
                        }
                        if (!System.String.IsNullOrEmpty(dr["otraFechaEstudio"].ToString()))
                        {
                            if (!data.Contains(dr["otraFechaEstudio"].ToString()))
                            {
                                fecha = dr["otraFechaEstudio"].ToString();
                                año = fecha.Substring(0, 4);
                                mes = fecha.Substring(4, 2);
                                dia = fecha.Substring(6, 2);
                                fechaEstudio = Convert.ToDateTime(año + "-" + mes + "-" + dia).ToString("yyyy-MM-dd");

                            }
                        }
                        if (!System.String.IsNullOrEmpty(dr["tipoEstudio"].ToString()))
                        {
                            if (!data.Contains(dr["tipoEstudio"].ToString()))
                            {
                                tipoEstudio = dr["tipoEstudio"].ToString().ToUpper();

                            }
                        }
                        if (!System.String.IsNullOrEmpty(nombre) && !System.String.IsNullOrEmpty(identificacion) && !System.String.IsNullOrEmpty(fechaEstudio) && !System.String.IsNullOrEmpty(nombreEstudio) && !System.String.IsNullOrEmpty(tipoEstudio))
                        {
                            data.Add($"INSERT INTO patientstudy(namePatient,identification,dateStudy,nameStudy,typeStudy)VALUES('{nombre}','{identificacion}','{fechaEstudio}','{nombreEstudio}','{tipoEstudio}');");
                            nombre = "";
                            identificacion = "";
                            fechaEstudio = "";
                            nombreEstudio = "";
                            tipoEstudio = "";
                        }
                    }
                }
            }
            return data;
        }
        private void GetDBPacientes(List<string> data)
        {
            foreach (string query in data)
            {

                using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
                {
                    conexion.Open();
                    MySqlCommand cmd = new MySqlCommand(query, conexion);
                    cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("ListarPacientes.aspx");
        }

        protected void btnUpdateStudyPatientList_Click(object sender, EventArgs e)
        {
            GetDBPacientes(GetPacientes());
        }
    }
}