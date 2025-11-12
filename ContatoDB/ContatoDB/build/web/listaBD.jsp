<%-- 
    Document   : listaBD
    Created on : 29/08/2025, 21:28:30
    Author     : 24100167
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Lista de Contatos</title>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            String url = "jdbc:derby://localhost:1527/Java2025";

            Connection con = DriverManager.getConnection(url, "java", "java");
        %>
    </head>
    <body>
        <%
            try {
                java.sql.Statement statement = con.createStatement();
                ResultSet resultados = statement.executeQuery("SELECT * FROM CONTATOS");
        %>
        <table class="table table-striped">
            <tr>
                <th>Nome</th>
                <th>Endereço</th>
                <th>E-Mail</th>
                <th>Dt.Nasc.</th>
                <th>Alterar</th>
                <th>Excluir</th>
            </tr>
            <%
                while (resultados.next()) {%>

            <tr>
                <td><%=resultados.getString("nome")%></td> 
                <td><%=resultados.getString("endereco")%></td> 
                <td><%=resultados.getString("email")%></td>
                <td><%=new SimpleDateFormat("dd/MM/yyyy").format(resultados.getDate("dataNascimento"))%></td>
                <td align="center"><a href="alteraBD.jsp?id=<%=resultados.getInt("id")%>">
                                      <img src="imagens/ticado.jpg"></a></td>
                <td align="center"><a href="excluiBD.jsp?id=<%=resultados.getInt("id")%>">
                                      <img src="imagens/x.jpg"></a></td>
            </tr>
            <%
                    }
                    resultados.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            %>
        </table>
    </body>
</html>
