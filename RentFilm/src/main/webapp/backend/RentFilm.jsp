<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "INSERT INTO "+Const.RENT_TABLE
            + "("+Const.RENT_OR_ID+", "
            + Const.FILM_ID+")"
            + "VALUES("
            + session.getAttribute("id")+", "
            + request.getParameter("id")+")";
    stmt.executeUpdate(sql);

    conn.close();

    response.sendRedirect("MyFilm");
%>