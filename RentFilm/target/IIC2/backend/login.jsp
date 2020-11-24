<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="DB.Const" %>
<%
    String entLogin = request.getParameter("login");
    String entPass =  request.getParameter("password");

    if(entLogin.equals("admin") && entPass.equals("1234")) {
        response.sendRedirect("admin/main");
    }
    else {
        DBHandler DBH = new DBHandler();
        Connection conn = DBH.getDbConnection();
        Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM " + Const.OR_TABLE + " WHERE " + Const.OR_LOGIN + "=" + "'" + entLogin + "'";
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            response.sendRedirect("logError");
        }
        String pass = null;
        if (rs.next()) {
            pass = rs.getString(Const.OR_PASSWORD);
            session.setAttribute("name", rs.getString(Const.OR_NAME));
            session.setAttribute("id", rs.getString(Const.OR_ID));
            session.setAttribute("surname", rs.getString(Const.OR_SURNAME));
        }
        if (entPass.equals(pass)) {
            response.sendRedirect("user/main");
        } else {
            response.sendRedirect("logError");
        }
        conn.close();
    }
%>