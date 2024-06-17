<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPDF.aspx.cs" Inherits="ConsultorioMedico.ViewPDF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>View PDF</title>
    <script>
        function pdf(){
            const valores = window.location.search;
            const urlParams = new URLSearchParams(valores);
            var urlPDF = urlParams.get('url');
            var pdf = document.querySelector("iframe");
            pdf.setAttribute("src", urlPDF)
        }
       
    </script>
</head>
<body onload="pdf()">
    <form id="form1" runat="server">
        <iframe frameborder="0" style="width: 100vw; height: 100vh"></iframe>
    </form>

</body>
</html>
