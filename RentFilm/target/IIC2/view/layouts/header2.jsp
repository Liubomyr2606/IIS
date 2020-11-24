
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

                        <form id="form<%=rs.getInt(Const.GENRE_ID)%>" action="MyFilm" method="post">
                        <input type="hidden" value="<%=rs.getInt(Const.GENRE_ID)%>" name="id">
                        <div onclick="document.querySelector('#form<%=rs.getInt(Const.GENRE_ID)%>').submit()" href="<%=rs.getString(Const.GENRE_NAME)%>"><%=rs.getString(Const.GENRE_NAME)%></div>
                         </form>

                        <%}
                        %>
                    </div>

                </a>
                <a class="nav_link" href="conditions">Conditions</a>
                <a class="nav_link" href="login">Login</a>
                <a class="nav_link" href="register">Register</a>


            </nav>
        </div>
</header>
<script>
    document.querySelector(".arrow").style.top = window.innerHeight-60+'px';
    document.querySelector(".arrow").addEventListener('click',()=>scroll(0,0));

    function CheckForm(){
        if(CheckFirstName() && CheckLastName() && CheckMail() && CheckNumber())
        {
            alert("Дякуємо за відгук!");
        }
    }

    function CheckFirstName()
    {
        let fnameValue = document.forms["section_form"]["name"].value;
        if(!IsLetter(fnameValue))
        {
            alert("Ім'я повинно складатися з букв!");
            return false;
        }
        return true;
    }

    function CheckLastName(){
        let lnameValue = document.forms["section_form"]["lastname"].value;
        if(!IsLetter(lnameValue))
        {
            alert("Фамілія повинна складатися з букв!");
            return false;
        }
        return true;
    }

    function CheckNumber(){
        let numberValue = document.forms["section_form"]["user_phone"].value;
        if(!IsNumber(numberValue)){
            alert("Невірно введений номер!");
            return false;
        }
        return true;
    }

    function CheckMail(){
        var regex = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/;
        let mail = document.forms["section_form"]["mail"].value;
        if (mail.match(regex))
        {
            return true;
        }
        else
        {
            alert("Невірно введена пошта!");
            return false;
        }
    }

    function IsLetter(value){
        var regex=/^[a-zA-Z]+$/;
        if (value.match(regex))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    function IsNumber(value){
        return !isNaN(value);
    }
    /*NewTheme*/
    document.querySelector("#themeButton").addEventListener('click',()=>changeTheme());
    function changeTheme()
    {
        if ( typeof (changeTheme.theme) == 'undefined' ) {
            changeTheme.theme = 'bright';
        }
        if(changeTheme.theme = 'bright'){
            console.log('theme cheking to dark. Current theme is: '+ changeTheme.theme);

            changeTheme.theme = 'dark';
            switchDark();
        }
        else if(changeTheme.theme = 'dark')
        {
            console.log('theme cheking to bright. Current theme is: '+ changeTheme.theme);

            changeTheme.theme = 'bright';
            switchBright();
        }
    }

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