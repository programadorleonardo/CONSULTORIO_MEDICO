<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="ConsultaPaciente.aspx.cs" Inherits="ConsultorioMedico.ConsultaPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Consulta</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header pb-0">
                        <div class="d-flex align-items-center">
                            <p class="mb-0">Datos de la consulta</p>
                        </div>
                    </div>
                    <div class="card-body">
                        <p class="text-uppercase text-sm"><asp:Label runat="server" ID="idPaciente" Text="Nombre completo del paciente"></asp:Label></p>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Motivo de la consulta</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" ID="txtMotivoConsulta"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Sintomas</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" ID="txtSintomas"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Tensio arterial</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="txtTensionArterial" min="0"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Frecuencia cardiaca</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="txtFrecuenciaCardiaca" min="0"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Frecuencia respiratoria</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="txtFrecuenciaRespiratoria" min="0"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Saturacion de oxigeno</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="txtSaturacionOxigeno" min="0"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Diagnostico</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="txtDiagnostico">
                                        <asp:ListItem Value="-1">- Seleccionar -</asp:ListItem>
                                        <asp:ListItem Value="1">Disnostico 1</asp:ListItem>
                                        <asp:ListItem Value="2">Disnostico 2</asp:ListItem>
                                        <asp:ListItem Value="3">Disnostico 3</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Tratamiento</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" Columns="10" ID="txtTratamiento"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <br />
                                <asp:Button runat="server" Width="100%" CssClass="btn btn-primary btn-sm ms-auto" ID="btnSaveUser" Text="Guardar datos de la consulta" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
