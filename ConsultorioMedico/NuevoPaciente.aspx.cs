using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.X500;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace ConsultorioMedico
{
    public partial class NuevoPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["consultoriomedico"].ConnectionString.ToString()))
            {
                con.Open();
                string queryTypeId = "SELECT * FROM listTypeIdentification";
                string queryHealthRegime = "SELECT * FROM listHealthRegime";
                string queryEPS = "SELECT * FROM listEPS";

                MySqlCommand cmdTypeId = new MySqlCommand(queryTypeId, con);
                MySqlDataAdapter daTypeId = new MySqlDataAdapter(cmdTypeId);
                DataSet dsTypeId = new DataSet();
                daTypeId.Fill(dsTypeId);
                txtTipoIdPaciente.DataSource = dsTypeId;
                txtTipoIdPaciente.DataTextField = "typeDocument";
                txtTipoIdPaciente.DataValueField = "idTypeIdDoc";
                txtTipoIdPaciente.DataBind();
                txtTipoIdPaciente.Items.Insert(0, new ListItem("- Selecionar -", "0"));

                MySqlCommand cmdHealthRegime = new MySqlCommand(queryHealthRegime, con);
                MySqlDataAdapter daHealthRegime = new MySqlDataAdapter(cmdHealthRegime);
                DataSet dsHealthRegime = new DataSet();
                daHealthRegime.Fill(dsHealthRegime);
                txtRegimenPaciente.DataSource = dsHealthRegime;
                txtRegimenPaciente.DataTextField = "regime";
                txtRegimenPaciente.DataValueField = "idhealthregimen";
                txtRegimenPaciente.DataBind();
                txtRegimenPaciente.Items.Insert(0, new ListItem("- Selecionar -", "0"));

                MySqlCommand cmdEPS = new MySqlCommand(queryEPS, con);
                MySqlDataAdapter daEPS = new MySqlDataAdapter(cmdEPS);
                DataSet dsEPS = new DataSet();
                daEPS.Fill(dsEPS);
                txtEPS.DataSource = dsEPS;
                txtEPS.DataTextField = "epsname";
                txtEPS.DataValueField = "ideps";
                txtEPS.DataBind();
                txtEPS.Items.Insert(0, new ListItem("- Selecionar -", "0"));
            }
        }

        protected void btnSavePatient_Click(object sender, EventArgs e)
        {
            string rutePdf = Server.MapPath("~/PDF");
            if (!Directory.Exists(rutePdf))
            {
                Directory.CreateDirectory(rutePdf);
            }
            try
            {
                if (FileUploadPDF.HasFile)
                {
                    //Verificamos las extension del archivo
                    string ext = Path.GetExtension(FileUploadPDF.FileName);
                    ext = ext.Substring(ext.LastIndexOf(".")+1).ToLower();
                    string[] formatos = new string[] { "pdf" };
                    if (Array.IndexOf(formatos, ext) < 0)
                    {
                        Response.Write("Formato de iamgen invalido");
                    }
                    else
                    {
                        GuardarArchivo(FileUploadPDF.PostedFile);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            Response.Redirect("ListarPacientes");
        }
        private void GuardarArchivo(HttpPostedFile file)
        {
            string rutePdf = Server.MapPath("~/PDF");
            if (!Directory.Exists(rutePdf))
            {
                Directory.CreateDirectory(rutePdf);
            }
            string archivo = String.Format("{0}\\{1}",rutePdf,file.FileName);
            if (File.Exists(archivo))
            {
                Response.Write(String.Format("Ya existe un archivo con nombre\"{0}\".",file.FileName));
            }
            else
            {
                file.SaveAs(archivo);
            }
        }
    }
}