<%-- 
    Document   : grava
    Created on : 10/10/2025, 20:26:41
    Author     : 24100167
--%>

<%@page contentType="text/html" pageEncoding="WINDOWS-1252"%>
<jsp:useBean id="cliente" class="br.com.liberato.DadosCliente" scope="session"/>
<jsp:setProperty name="cliente" property="*"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=WINDOWS-1252">
        <title>Confirmação</title>
    </head>
    <body>
        <h1>Dados incluidos com sucesso!</h1>
        <br><br><br>
        <a href="mostra.jsp">Mostrar Dados</a>
    </body>
</html>