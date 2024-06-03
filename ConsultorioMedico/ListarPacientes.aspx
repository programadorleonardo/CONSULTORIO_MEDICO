<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="ConsultorioMedico.ListarPacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pacientes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12">
        <div class="card mb-4">

            <div class="card-header pb-0">
                <div class="col-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtBuscarUsuario" placeholder="Buscar paciente..."></asp:TextBox>
                </div>
            </div>



            <%--COMIEZA LA TABLA--%>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <table class="table align-items-center mb-0">
                        <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Nombre del paciente</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Identificacion</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Medico</th>
                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo del paciente" FontBold="True"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="# Identificacion" FontBold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-success">
                                        <asp:Label runat="server" Text="En consulta"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo del paciente" FontBold="True"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="# Identificacion" FontBold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-danger">
                                        <asp:Label runat="server" Text="En espera"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo del paciente" FontBold="True"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="# Identificacion" FontBold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-danger">
                                        <asp:Label runat="server" Text="En espera"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo del paciente" FontBold="True"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="# Identificacion" FontBold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-danger">
                                        <asp:Label runat="server" Text="En espera"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo del paciente" FontBold="True"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="# Identificacion" FontBold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-danger">
                                        <asp:Label runat="server" Text="En espera"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo del paciente" FontBold="True"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="# Identificacion" FontBold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-danger">
                                        <asp:Label runat="server" Text="En espera"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
