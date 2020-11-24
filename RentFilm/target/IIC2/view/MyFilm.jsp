<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ page import="java.sql.*" %>
<%@ page import="DB.DBHandler" %>
<%@ page import="DB.Const" %>
<%! String pageTitle = "FILM";%>
<%@ include file = "layouts/header2.jsp"%>
<%
    String sql = "";
    rs = null;
    sql = "SELECT "+Const.GENRE_NAME+" FROM "
            + Const.GENRE_TABLE + " WHERE "
            + Const.GENRE_ID + "=" + request.getParameter("id");
    rs = stmt.executeQuery(sql);
    rs.next();
%>
<%=rs.getString(Const.GENRE_NAME)+" genre"%>
<div style="display: flex; width: 100%;justify-content: center;align-items: center;flex-wrap: wrap">

    <%
        sql = "SELECT * FROM "
                + Const.FILM_TABLE + " WHERE "
                + Const.FILM_GENRE + "=" + request.getParameter("id");
        rs = stmt.executeQuery(sql);
        %>
    <div style="width: 100%;display: flex;justify-content: space-around;align-items: center;margin: 10px;
border-bottom: 1px solid #222">
        <div>Film name</div>
        <div>Year</div>
        <div>Price</div>
        <div>Rent</div>
    </div>
    <%
        while (rs.next()){
    %>

    <form id="formfilm<%=rs.getInt(Const.FILM_ID)%>"
          style="width: 100%;display: flex;justify-content: space-around;align-items: center;margin: 10px;
border-bottom: 1px solid #222"
          action="Film" method="post">
        <div><%=rs.getString(Const.FILM_NAME)%></div>
        <div><%=rs.getInt(Const.FILM_DATE)%></div>
        <div><%=rs.getInt(Const.FILM_PRICE)%>$</div>
        <input type="hidden" value="<%=rs.getInt(Const.FILM_ID)%>" name="id">

        <div style="border: 1px solid #222"
             style="cursor:pointer">
            To rent Log In
        </div>
    </form>
    <%}
        conn.close();
    %>
</div>

<%@ include file = "layouts/footer.jsp"%>