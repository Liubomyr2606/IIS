<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHandler" %>
<%@ page import="DB.Const" %>
<%! String pageTitle = "Register";%>
<%@ include file = "layouts/header2.jsp"%>
<div style="display: flex; width: 100%;justify-content: center;align-items: center;">
    <form action="register" method = "post">
        <div class="group">
            <input type="text" name="name" required>
            <span class="bar"></span>
            <label>Name</label>
        </div>
        <div class="group">
            <input type="text" name="surname" required>
            <span class="bar"></span>
            <label>Surame</label>
        </div>
        <div class="group">
            <input type="text" name="phone" required>
            <span class="bar"></span>
            <label>Phone</label>
        </div>
        <div class="group">
            <input type="text" name="login" required>
            <span class="bar"></span>
            <label>Login</label>
        </div>
        <div class="group">
            <input type="text" name="password" required>
            <span class="bar"></span>
            <label>Password</label>
        </div>

        <input type="submit" value="Submit">
    </form>
</div>


<%@ include file = "layouts/footer.jsp"%>
