<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="ListarUsuarios.aspx.cs" Inherits="ConsultorioMedico.ListarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Usuarios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12">
        <div class="card mb-4">

            <div class="card-header pb-0">
                <div class="col-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtBuscarUsuario" placeholder="Buscar usuario..."></asp:TextBox>
                </div>
            </div>



            <%--COMIEZA LA TABLA--%>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <table class="table align-items-center mb-0">
                        <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Nombre de usuario</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Funcion</th>
                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Estado</th>
                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
                                <th class="text-secondary opacity-7"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="d-flex px-1 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo" FontBold="True"></asp:Label>
                                            <asp:Label runat="server" CssClass="text-xs text-secondary mb-0" Text="Nombre del usuario"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Asistente" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-success">
                                        <asp:Label runat="server" Text="Inline"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle text-center">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Editar"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Eliminar"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo" FontBold="True"></asp:Label>
                                            <asp:Label runat="server" CssClass="text-xs text-secondary mb-0" Text="Nombre del usuario"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-danger">
                                        <asp:Label runat="server" Text="OffLine"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle text-center">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Editar"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Eliminar"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-1 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo" FontBold="True"></asp:Label>
                                            <asp:Label runat="server" CssClass="text-xs text-secondary mb-0" Text="Nombre del usuario"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Asistente" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-success">
                                        <asp:Label runat="server" Text="Inline"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle text-center">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Editar"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Eliminar"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo" FontBold="True"></asp:Label>
                                            <asp:Label runat="server" CssClass="text-xs text-secondary mb-0" Text="Nombre del usuario"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-danger">
                                        <asp:Label runat="server" Text="OffLine"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle text-center">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Editar"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Eliminar"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-1 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo" FontBold="True"></asp:Label>
                                            <asp:Label runat="server" CssClass="text-xs text-secondary mb-0" Text="Nombre del usuario"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Asistente" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-success">
                                        <asp:Label runat="server" Text="Inline"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle text-center">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Editar"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Eliminar"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <asp:Label runat="server" CssClass="mb-0 text-sm" Text="Nombre completo" FontBold="True"></asp:Label>
                                            <asp:Label runat="server" CssClass="text-xs text-secondary mb-0" Text="Nombre del usuario"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label runat="server" CssClass="text-xs font-weight-bold mb-0" Text="Medico" FontBold="True"></asp:Label>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span class="badge badge-sm bg-gradient-danger">
                                        <asp:Label runat="server" Text="OffLine"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle text-center">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Editar"></asp:Label>
                                    </span>
                                </td>
                                <td class="align-middle">
                                    <span class="text-secondary text-xs font-weight-bold">
                                        <asp:Label runat="server" Text="Eliminar"></asp:Label>
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
