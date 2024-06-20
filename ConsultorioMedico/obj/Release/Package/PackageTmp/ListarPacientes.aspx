<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="ListarPacientes.aspx.cs" Inherits="ConsultorioMedico.ListarPacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pacientes</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card shadow-lg mx-0">
        <div class="card-body p-3">
            <div class="row gx-4">
                <div class="col-12">
                    <div class="h-100">
                        <asp:Button runat="server" Width="100%" CssClass="btn btn-dark" Text="Actualizar pacientes" ID="btnUpdateStudyPatientList" OnClick="btnUpdateStudyPatientList_Click" />
                    </div>
                </div>
                <div class="col-12">
                    <div class="h-100">
                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Buscar paciente..."></asp:TextBox>
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


    <%--MODAL--%>
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
