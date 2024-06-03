using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
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
    }
}