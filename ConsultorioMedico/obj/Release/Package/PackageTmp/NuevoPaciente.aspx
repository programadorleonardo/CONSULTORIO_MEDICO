<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="NuevoPaciente.aspx.cs" Inherits="ConsultorioMedico.NuevoPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header pb-0">
                        <div class="d-flex align-items-center">
                            <p class="mb-0">Nuevo paciente</p>

                        </div>
                    </div>
                    <div class="card-body">
                        <p class="text-uppercase text-sm">Informacion basica del paciente</p>
                        <div class="row">

                            <%--NOMBRE COMPLETO--%>
                            <div class="col-md-3">
                                <label for="example-text-input" class="form-control-label">Primer nombre</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtPrimerNombrePaciente" placeholder="'Ingrese el primer nombre'"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="example-text-input" class="form-control-label">Segundo nombre</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtSegundoNombrePaciente" placeholder="'Ingrese el segundo nombre'"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="example-text-input" class="form-control-label">Primer apellido</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtPrimerApellidoPaciente" placeholder="'Ingrese el primer apellido'"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="example-text-input" class="form-control-label">Segundo apellido</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtSegundoApellidoPaciente" placeholder="'Ingrese el segundo apellido'"></asp:TextBox>
                                </div>
                            </div>

                            <%--FIN NOMBRES COMPLETO--%>




                            <div class="col-md-4">
                                <label for="example-text-input" class="form-control-label">Numero de documento</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" MaxLength="12" min="0" ID="txtNumIdPaciente" placeholder="'Digite el numero de documento'"></asp:TextBox>
                                </div>
                            </div>



                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Tipo de documento</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="txtTipoIdPaciente"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Regimen</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="txtRegimenPaciente">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <%--EPS--%>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Empresa Promotara de Salud - EPS</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="txtEPS">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Anexar estudio</label>
                                    <asp:FileUpload runat="server" CssClass="form-control" ID="FileUploadPDF" />
                                </div>
                            </div>

                            <%--GUARDAR--%>
                            <div class="col-md-12">
                                <br />
                                <asp:Button runat="server" Width="100%" CssClass="btn btn-primary btn-sm ms-auto" ID="btnSavePatient" Text="Guardar" OnClick="btnSavePatient_Click" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
