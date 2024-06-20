using MySqlConnector;
using System;
using System.Configuration;
using System.Data;
using System.Web;
using IronPdf;
using BitMiracle.Docotic.Pdf.HtmlToPdf;
using System.Data.SqlTypes;
using System.Threading.Tasks;

namespace ConsultorioMedico
{
    public partial class Informes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInformDate_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[]{
                new DataColumn("idPatientStudy",typeof(int)),
                new DataColumn("namePatient",typeof(string)),
                new DataColumn("identification",typeof(string)),
                new DataColumn("dateStudy",typeof(string)),
                });
                string query = "SELECT * FROM patientstudy WHERE dateStudy>='" + txtDateBegin.Text + "' AND dateStudy<='" + txtDateEnd.Text + "'";
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
            catch (Exception ex)
            {
                string script = "$(function() { showModalExito('Error','" + ex + "'); }); ";
                ClientScript.RegisterClientScriptBlock(GetType(), "Mensaje", script, true);
            }

        }

        protected void btnDownloadPdf_Click(object sender, EventArgs e)
        {
            string urlActual = HttpContext.Current.Request.Url.AbsoluteUri;
            convertUrlToPdfAsync(urlActual, "Informe.pdf");

        }
        static async Task convertUrlToPdfAsync(string urlString, string pdfFileName)
        {
            using (var converter = await HtmlConverter.CreateAsync())
            {
                using (var pdf = await converter.CreatePdfAsync(new Uri(urlString)))
                    pdf.Save(pdfFileName);
            }
        }
    }
}