<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %>
<%@ page import="java.sql.ResultSet" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "INSERT INTO "+ Const.OR_TABLE+"("
            + Const.OR_SURNAME + ", "
            + Const.OR_NAME + ", "
            + Const.OR_PHONE + ", "
            + Const.OR_LOGIN + ", "
            + Const.OR_PASSWORD + ") "
            + " VALUES('"+request.getParameter("surname")+ "', '"
            + request.getParameter("name")+ "', '"
            + request.getParameter("phone")+ "', '"
            +request.getParameter("login")+ "', '"
            + request.getParameter("password")+ "')";
    stmt.executeUpdate(sql);
    conn.close();

    response.sendRedirect("main");
%>
<%=sql%>