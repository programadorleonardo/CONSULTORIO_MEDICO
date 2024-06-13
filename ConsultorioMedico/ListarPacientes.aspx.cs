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
            string query = "SELECT * FROM maindicomtags;";
            List<string> data = new List<string>();
            using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["dispositivomedicodev"].ConnectionString.ToString()))
            {
                conexion.Open();
                MySqlCommand cmd = new MySqlCommand(query, conexion);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    string nombre = "", identificacion = "", fechaEstudio = "", id = "", año = "", mes = "", dia = "";
                    while (dr.Read())
                    {
                        //Nombre paciente
                        if (Convert.ToInt32(dr["tagGroup"]) == 16 && Convert.ToInt32(dr["tagElement"]) == 16)
                        {
                            nombre = dr["value"].ToString().ToUpper();
                        }

                        //Identificaion paciente
                        if (Convert.ToInt32(dr["tagGroup"]) == 16 && Convert.ToInt32(dr["tagElement"]) == 32)
                        {
                            identificacion = dr["value"].ToString();
                        }
                        //Fecha de estudio
                        if ((Convert.ToInt32(dr["tagGroup"]) == 8) && (Convert.ToInt32(dr["tagElement"]) == 32))
                        {

                            if (!data.Contains(nombre))
                            {
                                if (!data.Contains(identificacion))
                                {
                                    id = dr["id"].ToString();
                                    fechaEstudio = dr["value"].ToString();
                                    año = fechaEstudio.Substring(0, 4);
                                    mes = fechaEstudio.Substring(4, 2);
                                    dia = fechaEstudio.Substring(6, 2);
                                    string fecha = Convert.ToDateTime(dia + "/" + mes + "/" + año).ToString("yyyy-MM-dd");
                                    string insert = $"INSERT INTO patientstudy(idStudy,namePatient,identification,dateStudy)VALUES('{id}','{nombre}','{identificacion}','{fecha}');";
                                    data.Add(insert);
                                }
                            }

                        }

                        //Otra fecha de estudio
                        if ((Convert.ToInt32(dr["tagGroup"]) == 8) && (Convert.ToInt32(dr["tagElement"]) == 33))
                        {
                            if (data.Contains(identificacion))
                            {
                                if (!data.Contains(dr["value"].ToString()))
                                {
                                    id = dr["id"].ToString();
                                    fechaEstudio = dr["value"].ToString();
                                    año = fechaEstudio.Substring(0, 4);
                                    mes = fechaEstudio.Substring(4, 2);
                                    dia = fechaEstudio.Substring(6, 2);
                                    string fecha = Convert.ToDateTime(dia + "/" + mes + "/" + año).ToString("yyyy-MM-dd");
                                    string insert = $"INSERT INTO patientstudy(idStudy,namePatient,identification,dateStudy)VALUES('{id}','{nombre}','{identificacion}','{fecha}');";
                                    data.Add(insert);
                                }
                            }
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