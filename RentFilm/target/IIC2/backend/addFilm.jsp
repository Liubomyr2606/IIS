<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "INSERT INTO "+ Const.FILM_TABLE+"("
            + Const.FILM_NAME + ", "
            + Const.FILM_GENRE + ", "
            + Const.FILM_TIMING + ", "
            + Const.FILM_DATE+ ", "
            + Const.FILM_PRICE + ") VALUES('"
            + request.getParameter("name") + "', '"
            + request.getParameter("genre") + "', '"
            + request.getParameter("timing") + "', '"
            + request.getParameter("year") + "', '"
            + request.getParameter("price") + "')";
    stmt.executeUpdate(sql);

    conn.close();

    response.sendRedirect("main");
%>