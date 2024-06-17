<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="NuevoUsuario.aspx.cs" Inherits="ConsultorioMedico.NuevoUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Nuevo Usuario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header pb-0">
                        <div class="d-flex align-items-center">
                            <p class="mb-0">Nuevo usuario</p>
                           
                        </div>
                    </div>
                    <div class="card-body">
                        <p class="text-uppercase text-sm">Informacion basica del usuario</p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Nombres</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtNombres"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Apellidos</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtApellidos"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Nombre de usuario</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtNombreUsuario"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Password</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" ID="txtPasswordUser"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Email</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="txtEmailUser"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Telefono</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtTelefonoUser"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label">Rol</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="txtRolUser" AutoPostBack="false"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <br />
                                 <asp:Button runat="server" Width="100%" CssClass="btn btn-dark btn-sm ms-auto" ID="btnSaveUser" Text="Guardar" OnClick="btnSaveUser_Click" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
