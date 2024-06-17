<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="ConsultorioMedico.Informes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card shadow-lg mx-0">
        <div class="card-body p-3">
            <div class="row">
                <div class="col-6">
                    <label for="example-text-input" class="form-control-label">Desde</label>
                    <asp:TextBox runat="server" CssClass="datefield form-control" ID="txtDateBegin" TextMode="Date" />
                </div>
                <div class="col-6">
                    <label for="example-text-input" class="form-control-label">Hasta</label>
                    <asp:TextBox runat="server" CssClass="datefield form-control" ID="txtDateEnd" TextMode="Date" />
                </div>
            </div>
            <div class="row gx-4">
                <div class="col-12">
                    <div class="h-100">
                        <br />
                        <asp:Button runat="server" Width="100%" CssClass="btn btn-dark" Text="Buscar datos" ID="btnInformDate" OnClick="btnInformDate_Click" />
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
                         <asp:GridView ID="GridViewDataPatientStudy" runat="server" AutoGenerateColumns="False" CssClass="table align-items-center mb-0">
                             <Columns>
                                 <asp:HyperLinkField HeaderText="Paciente" DataNavigateUrlFields="idPatientStudy" DataNavigateUrlFormatString="~/Paciente.aspx?id={0}" DataTextField="namePatient" ItemStyle-CssClass="text-xs text-secondary mb-0" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" />
                                 <asp:BoundField HeaderText="Paciente" DataField="namePatient" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" Visible="false">
                                     <HeaderStyle CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" />
                                     <ItemStyle CssClass="text-xs text-secondary mb-0" />
                                 </asp:BoundField>
                                 <asp:BoundField HeaderText="Identificacion" DataField="identification" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                     <HeaderStyle CssClass="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" />
                                     <ItemStyle CssClass="text-center text-xs text-secondary mb-0" />
                                 </asp:BoundField>
                                 <asp:BoundField HeaderText="Fecha del estudio" DataField="dateStudy" HeaderStyle-CssClass="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
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
