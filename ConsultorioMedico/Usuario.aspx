<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ConsultorioMedico.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <p class="text-uppercase text-sm">Informacion basica del usuario</p>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="example-text-input" class="form-control-label">Nombres</label>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblNombres" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="example-text-input" class="form-control-label">Apellidos</label>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblApellidos" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="example-text-input" class="form-control-label">Nombre de usuario</label>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblNameUser" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="example-text-input" class="form-control-label">Rol</label>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblRol" Enabled="false"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="example-text-input" class="form-control-label">Email</label>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="lblEmail" Enabled="false"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="example-text-input" class="form-control-label">Telefono</label>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="lblTelefono" Enabled="false"></asp:TextBox>
                            </div>
                        </div>

                      

                        <div class="col-md-12">
                            <br />
                            
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    
</asp:Content>
