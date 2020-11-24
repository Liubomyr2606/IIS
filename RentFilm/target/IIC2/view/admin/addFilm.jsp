<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHandler" %>
<%@ page import="DB.Const" %>
<%! String pageTitle = "Register";%>
<%@ include file = "header.jsp"%>
<div style="display: flex; width: 100%;justify-content: center;align-items: center;">
    <form action="addFilm" method = "post">
        <div class="group">
            <input type="text" name="name" required>
            <span class="bar"></span>
            <label>Film name</label>
        </div>
        <select name="genre">
            <%

                conn = DBH.getDbConnection();
                stmt = conn.createStatement();
                try {
                    conn = DBH.getDbConnection();
                    stmt = conn.createStatement();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                rs = stmt.executeQuery("SELECT * FROM "+Const.GENRE_TABLE);
                while (rs.next()){
            %>

            <option value="<%=rs.getInt(Const.GENRE_ID)%>"><%=rs.getString(Const.GENRE_NAME).toUpperCase()%></option>

            <%}
            %>
        </select>
        <div class="group">
            <input type="text" name="timing" required>
            <span class="bar"></span>
            <label>Timing</label>
        </div>
        <div class="group">
            <input type="text" name="year" required>
            <span class="bar"></span>
            <label>Year</label>
        </div>
        <div class="group">
            <input type="text" name="price" required>
            <span class="bar"></span>
            <label>price</label>
        </div>

        <input type="submit" value="Submit">
    </form>
</div>


<%@ include file = "../layouts/footer.jsp"%>
