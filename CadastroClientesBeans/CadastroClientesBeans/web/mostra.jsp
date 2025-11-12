<%-- 
    Document   : mostra
    Created on : 10/10/2025, 20:27:25
    Author     : 24100167
--%>

<%@page contentType="text/html" pageEncoding="WINDOWS-1252"%>
<jsp:useBean id="cliente" class="br.com.liberato.DadosCliente" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=WINDOWS-1252">
        <title>Mostra os Dados</title>
    </head>
    <body>
        Você entrou <br><br>
        Razão Social: <%= cliente.getRazaoSocial()%><br>
        Email: <%= cliente.getEmail()%><br>
        Endereço: <%= cliente.getEndereco()%><br>
        CNPJ: <%= cliente.getCnpj()%><br>
        Inscrição Estadual: <%= cliente.getIe()%><br>
        Login: <%= cliente.getLogin()%><br>
        Senha: <%= cliente.getSenha()%><br>
        
        
    </body>
</html>
