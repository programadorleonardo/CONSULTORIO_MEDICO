<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="ListarUsuarios.aspx.cs" Inherits="ConsultorioMedico.ListarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Usuarios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card shadow-lg mx-0">
      <div class="card-body p-3">
          <div class="row gx-4">
              <div class="col-12">
                  <div class="h-100">
                      <asp:Button runat="server" Width="100%" CssClass="btn btn-dark" Text="Agregar un nuevo usuario" ID="btnAddUserSystem" OnClick="btnAddUserSystem_Click" />
                  </div>
              </div>
              <div class="col-12">
                  <div class="h-100">
                      <asp:TextBox runat="server" CssClass="form-control" placeholder="Buscar usuario..."></asp:TextBox>
                  </div>
              </div>
          </div>

          <%--COMIEZA LA TABLA--%>
          <br />
          <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                  <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                      <ContentTemplate>
                          <asp:GridView ID="GridViewDataUserSystem" runat="server" AutoGenerateColumns="False" CssClass="table align-items-center mb-0">
                              <Columns>
                                  <asp:HyperLinkField HeaderText="Usuario" DataNavigateUrlFields="idUserSystem" DataNavigateUrlFormatString="~/Usuario.aspx?id={0}" DataTextField="username" ItemStyle-CssClass="text-xs text-secondary mb-0" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" />
                                  <asp:BoundField HeaderText="Usuario" DataField="username" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" Visible="false">
                                      <HeaderStyle CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" />
                                      <ItemStyle CssClass="text-xs text-secondary mb-0" />
                                  </asp:BoundField>
                                  <asp:BoundField HeaderText="Rol" DataField="permissionType" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                      <HeaderStyle CssClass="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" />
                                      <ItemStyle CssClass="text-center text-xs text-secondary mb-0" />
                                  </asp:BoundField>
                              </Columns>
                          </asp:GridView>
                      </ContentTemplate>
                  </asp:UpdatePanel>
              </div>
          </div>
          <%--FIN DE LA TABLA--%>
      </div>
  </div>
</asp:Content>
