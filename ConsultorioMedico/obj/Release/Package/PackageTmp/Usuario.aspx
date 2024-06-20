<%@ Page Title="" Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ConsultorioMedico.Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Usuario</title>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

    <%--Modal--%>
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
