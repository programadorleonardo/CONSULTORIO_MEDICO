<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="ConsultorioMedico.Paciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Paciente</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <p class="text-uppercase text-sm">Informacion del paciente</p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Nombre completo</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblNombreCompleto" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Tipo de identificacion</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="txtTypeIdPatient" AutoPostBack="false"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Numero de identificacion</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblIdentificacion" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Fecha del estudio</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblDateStudy" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Estudio</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblNameStudy" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Tipo de estudio</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblTypeStudy" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Estado del estudio</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="lblStateStudy" AutoPostBack="false"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Operador </label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblOperatorStudy"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Regimen </label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="txtRegimenPatient" AutoPostBack="false"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">EPS </label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="txtEpsPatient" AutoPostBack="false"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Anexar PDF </label>
                                    <asp:FileUpload runat="server" CssClass="form-control" ID="FileUploadPDF" />
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Observacion </label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" ID="txtObservations"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label"></label>
                                    <asp:Button ID="btnViewPDF" CssClass="form-control btn btn-dark" runat="server" Text="Ver PDF" PostBackUrl="~/ViewPDF.aspx"></asp:Button>
                                    <asp:Button ID="btnUpdateData" CssClass="form-control btn btn-success" runat="server" Text="Actualizar" OnClick="btnUpdateData_Click"></asp:Button>
                                    <asp:Button ID="btnOpenFilePatient" CssClass="form-control btn-info" runat="server" Text="Open File" OnClick="btnOpenFilePatient_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderModal" runat="server">
    <%--Modal--%>
    <div class="modal fade" id="staticbackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticbackdroplabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticbackdroplabel"></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                </div>
                <div class="modal-body">
                    <h1 class="modal-title fs-5" id="staticbackdroplabelBody"></h1>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function showModalExito(mensaje, cuerpo) {

            $("#staticbackdroplabel").text(mensaje);
            $("#staticbackdroplabelBody").text(cuerpo);
            $("#staticbackdrop").modal("show");
        }
    </script>
</asp:Content>
