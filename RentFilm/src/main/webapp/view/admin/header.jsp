<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.Const" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name = "viewport" content="width=device-width, initial-scale=1" >
    <style>
        <%@include file ="../style.css"%>
    </style>
    <link href="https://fonts.googleapis.com/css?family=Oswald|Sen:700&display=swap&subset=cyrillic" rel="stylesheet">

    <title><%=pageTitle%></title>

    <style>
        table {
            width: 300px;
            border: 1px solid green;
            margin: auto;
        }
        td {
            text-align: center;
        }
    </style>

</head>
<body>


<header>
    <div class="header_inner">
        <div class="header_logo">MovieSharing &#128190;
        </div>
        <div style="display: flex;position: fixed;right: 0; top: 0;">
            Hi, admin
            <button id="logButton" onclick="window.location = '/RentFilm_war/logout'" style="background-color: #84dcc6;padding: 7px 15px;margin: 0px 15px;
                border: 1px solid #fff;color: #222; border-radius: 15px; cursor: pointer;">
                LogOut
            </button>

        </div>
        <nav class="nav">
            <a id="navbar-ul-dropdown-list" class="nav_link">
                <button id="navbar-ul-dropdown-button">Films</button>
                <div id="navbar-ul-dropdown-content">
                    <%
                        DBHandler DBH = new DBHandler();
                        Connection conn = null;
                        Statement stmt = null;
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
                        ResultSet rs = null;
                        rs = stmt.executeQuery("SELECT * FROM "+Const.GENRE_TABLE);
                        while (rs.next()){
                    %>
                    <form id="form<%=rs.getInt(Const.GENRE_ID)%>" action="films" method="post">
                        <input type="hidden" value="<%=rs.getInt(Const.GENRE_ID)%>" name="id">
                        <div onclick="document.querySelector('#form<%=rs.getInt(Const.GENRE_ID)%>').submit()" ><%=rs.getString(Const.GENRE_NAME)%></div>
                    </form>
                    <%}
                    %>
                </div>

            </a>
        </nav>
    </div>
</header>
<script>
    document.querySelector(".arrow").style.top = window.innerHeight-60+'px';
    document.querySelector(".arrow").addEventListener('click',()=>scroll(0,0));

    function switchDark()
    {
        console.log("theme was switched to dark");
        document.querySelector(".intro").style.background = "url('assets/images/intro_dark.jpg') center no-repeat";
        document.querySelector("body").style.background = "#140D01";
        document.querySelector("body").style.color = "white";
        document.querySelector(".section").style.background = "url('assets/images/background_dark.jpg') center no-repeat";
        document.querySelector(".statistics").style.background = "#F1813E";

    }

    function switchBright()
    {
        console.log("theme was switched to bright");
        document.querySelector(".intro").style.background = "url('assets/images/intro.jpg') center no-repeat";
        document.querySelector("body").style.color = "black";
        document.querySelector(".section").style.background = "url('assets/images/background.jpg') center no-repeat";
    }

</script>