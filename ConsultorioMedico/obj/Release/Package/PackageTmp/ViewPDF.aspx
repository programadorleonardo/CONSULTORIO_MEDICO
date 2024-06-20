<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPDF.aspx.cs" Inherits="ConsultorioMedico.ViewPDF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>View PDF</title>
    <script>
        try {
            function pdf() {
                const valores = window.location.search;
                const urlParams = new URLSearchParams(valores);
                var urlPDF = urlParams.get('url');
                var pdf = document.querySelector("iframe");
                pdf.setAttribute("src", urlPDF)
            }
        } catch (e) {
            (function showModalExito() {

                $("#staticbackdroplabel").text("Error");
                $("#staticbackdroplabelBody").text("No se pudo cargar el documento.", e);
                $("#staticbackdrop").modal("show");
            })();
        }


    </script>
</head>
<body onload="pdf()">
    <form id="form1" runat="server">
        <iframe frameborder="0" style="width: 100vw; height: 100vh"></iframe>
    </form>

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
</body>
</html>
