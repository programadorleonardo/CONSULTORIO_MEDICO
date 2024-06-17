﻿using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class Paciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnViewPDF.Enabled = false;
            string url = "";
            int id = Convert.ToInt32(Request.QueryString["id"]);
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {
                con.Open();
                string queryTypeId = "SELECT * FROM listTypeIdentification";
                string queryHealthRegime = "SELECT * FROM listHealthRegime";
                string queryEPS = "SELECT * FROM listEPS";
                string queryDataPatient = "SELECT * FROM patientstudy WHERE idPatientStudy=" + id + "";
                string queryStatepatientstudy = "SELECT * FROM statepatientstudy";

                MySqlCommand cmdTypeId = new MySqlCommand(queryTypeId, con);
                MySqlDataAdapter daTypeId = new MySqlDataAdapter(cmdTypeId);
                DataSet dsTypeId = new DataSet();
                daTypeId.Fill(dsTypeId);
                txtTypeIdPatient.DataSource = dsTypeId;
                txtTypeIdPatient.DataTextField = "typeDocument";
                txtTypeIdPatient.DataValueField = "idTypeIdDoc";
                txtTypeIdPatient.DataBind();
                txtTypeIdPatient.Items.Insert(0, new ListItem("- Selecionar -", "0"));

                MySqlCommand cmdHealthRegime = new MySqlCommand(queryHealthRegime, con);
                MySqlDataAdapter daHealthRegime = new MySqlDataAdapter(cmdHealthRegime);
                DataSet dsHealthRegime = new DataSet();
                daHealthRegime.Fill(dsHealthRegime);
                txtRegimenPatient.DataSource = dsHealthRegime;
                txtRegimenPatient.DataTextField = "regime";
                txtRegimenPatient.DataValueField = "idhealthregimen";
                txtRegimenPatient.DataBind();
                txtRegimenPatient.Items.Insert(0, new ListItem("- Selecionar -", "0"));

                MySqlCommand cmdEPS = new MySqlCommand(queryEPS, con);
                MySqlDataAdapter daEPS = new MySqlDataAdapter(cmdEPS);
                DataSet dsEPS = new DataSet();
                daEPS.Fill(dsEPS);
                txtEpsPatient.DataSource = dsEPS;
                txtEpsPatient.DataTextField = "epsname";
                txtEpsPatient.DataValueField = "ideps";
                txtEpsPatient.DataBind();
                txtEpsPatient.Items.Insert(0, new ListItem("- Selecionar -", "0"));

                MySqlCommand cmdStatepatientstudy = new MySqlCommand(queryStatepatientstudy, con);
                MySqlDataAdapter daStatepatientstudy = new MySqlDataAdapter(cmdStatepatientstudy);
                DataSet dsStatepatientstudy = new DataSet();
                daStatepatientstudy.Fill(dsStatepatientstudy);
                lblStateStudy.DataSource = dsStatepatientstudy;
                lblStateStudy.DataTextField = "stateType";
                lblStateStudy.DataValueField = "idStatePatientStudy";
                lblStateStudy.DataBind();
                lblStateStudy.Items.Insert(0, new ListItem("- Selecionar -", "0"));


                MySqlCommand cmdDataPatient = new MySqlCommand(queryDataPatient, con);
                MySqlDataReader dr = cmdDataPatient.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblNombreCompleto.Text = dr["namePatient"].ToString().ToUpper();
                        lblIdentificacion.Text = dr["identification"].ToString().ToUpper();
                        lblDateStudy.Text = dr["dateStudy"].ToString().ToUpper();
                        lblNameStudy.Text = dr["nameStudy"].ToString().ToUpper();
                        lblTypeStudy.Text = dr["typeStudy"].ToString().ToUpper();
                        url = dr["rutePdfStudy"].ToString();
                        btnViewPDF.PostBackUrl = "ViewPDF.aspx?url=" +url;

                    }
                    if (!String.IsNullOrEmpty(url))
                    {
                        btnViewPDF.Enabled = true;
                    }
                }
            }

        }

        protected void btnUpdateData_Click(object sender, EventArgs e)
        {

            try
            {
                string rutePdf = Server.MapPath("~/PDF");
                if (!Directory.Exists(rutePdf))
                {
                    Directory.CreateDirectory(rutePdf);
                }
                if (FileUploadPDF.HasFile)
                {
                    //Verificamos las extension del archivo
                    string ext = Path.GetExtension(FileUploadPDF.FileName);
                    ext = ext.Substring(ext.LastIndexOf(".") + 1).ToLower();
                    string[] formatos = new string[] { "pdf" };
                    if (Array.IndexOf(formatos, ext) < 0)
                    {
                        Response.Write("Formato de archivo invalido");
                    }
                    else
                    {
                        GuardarArchivo(FileUploadPDF.PostedFile);
                    }
                }

            }
            catch (Exception ex)
            {

                Response.Redirect(ex.Message);
            }
        }

        private void GuardarArchivo(HttpPostedFile file)
        {
            string rutePdf = Server.MapPath("~/PDF");
            if (!Directory.Exists(rutePdf))
            {
                Directory.CreateDirectory(rutePdf);
            }
            string archivo = String.Format("{0}\\{1}", rutePdf, file.FileName);
            if (File.Exists(archivo))
            {
                Response.Write(String.Format("Ya existe un archivo con nombre\"{0}\".", file.FileName));
            }
            else
            {
                try
                {

                    using (MySqlConnection conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
                    {
                        int id = Convert.ToInt32(Request.QueryString["id"]);
                        string query = $"UPDATE patientstudy SET rutePdfStudy='PDF/{file.FileName}', operatorStudy='{lblOperatorStudy.Text.ToUpper()}' WHERE idPatientStudy={id}";
                        conexion.Open();
                        MySqlCommand cmd = new MySqlCommand(query, conexion);
                        cmd.ExecuteNonQuery();
                    }
                    file.SaveAs(archivo);
                    Thread.Sleep(300);
                    Response.Redirect("ListarPacientes.aspx");

                }
                catch (Exception ex)
                {

                    Response.Write(ex.Message);
                }
            }
        }
    }
}