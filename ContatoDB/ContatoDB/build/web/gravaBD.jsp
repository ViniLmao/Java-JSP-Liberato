<%-- 
    Document   : gravaBD
    Created on : 29/08/2025, 19:43:44
    Author     : 24100167
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
        <%
            String nome = request.getParameter("nome");
            String endereco = request.getParameter("endereco");
            String email = request.getParameter("email");
            String dataEmTexto = request.getParameter("dtNasc");
            Calendar dataNascimento = null;

            try {
                SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
                data.setLenient(false);
                Date date = data.parse(dataEmTexto);
                dataNascimento = Calendar.getInstance();
                dataNascimento.setTime(date);

            } catch (ParseException e) {
        %>
    <html>
        <body>
            Erro de conversão da data
            <br><br>
            <a href=javascript:history.back()> &lt;&lt; Voltar </a>
        </body>
    </html>
    <%
            return;
        }

        Class.forName("org.apache.derby.jdbc.ClientDriver");

        String url = "jdbc:derby://localhost:1527/Java2025";

        Connection con = DriverManager.getConnection(url, "java", "java");

        String sql = "insert into contatos" + " (nome, email, endereco, dataNascimento)" + " values (?,?,?,?)";

        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, email);
            stmt.setString(3, endereco);
            stmt.setDate(4, new java.sql.Date(dataNascimento.getTimeInMillis()));
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    %>
    <html>
        <head>
            <title>Contatos</title>
        </head>
        <body>
            <h1>Contato <%=nome%> Inserido com sucesso!</h1>
            <br><br><br>
        </body>
    </html>
</head>
</html>
