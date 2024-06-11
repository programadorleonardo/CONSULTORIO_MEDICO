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
            <br />

            <%--COMIEZA LA TABLA--%>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridViewDataUser" runat="server" AutoGenerateColumns="False" CssClass="table align-items-center mb-0">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="Nombre de usuario" DataNavigateUrlFields="idUserSystem" DataNavigateUrlFormatString="~/Usuario.aspx?id={0}" DataTextField="username" ItemStyle-CssClass="text-xs text-secondary mb-0" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"  />
                                    <asp:BoundField HeaderText="Nombre de usuario" DataField="username" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" Visible="false" >
                                    <HeaderStyle CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" />
                                    <ItemStyle CssClass="text-xs text-secondary mb-0" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Rol" DataField="permissionType" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" >
                                    <HeaderStyle CssClass="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" />
                                    <ItemStyle CssClass="text-center text-xs text-secondary mb-0" />
                                    </asp:BoundField>
                                   
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
