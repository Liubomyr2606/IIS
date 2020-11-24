<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHandler" %>
<%@ page import="DB.Const" %>
<%! String pageTitle = "RentFilm";%>
<%@ include file = "layouts/header.jsp"%>

<div class="intro">
    <div class="container">
        <div class="intro_inner">

            <h1 class="intro_title">MovieShare</h1>

            <a class="btn" href="#">We are -</a>
        </div>
    </div>
    <div class="slider">
        <div class="container">
            <div class="slider_inner">
                <div class="slider_item active">
                    <span class="slider_num">01</span>
                    <span class="slider_text" >High quality</span>
                </div>
                <div class="slider_item">
                    <span class="slider_num">02</span>
                    <span class="slider_text" >Fast service</span>
                </div>
                <div class="slider_item">
                    <span class="slider_num">03</span>
                    <span class="slider_text" >More than 1000 films</span>
                </div>
                <div class="slider_item">
                    <span class="slider_num">04</span>
                    <span class="slider_text" >Skilled workers</span>
                </div>
                <div class="slider_item">
                    <span class="slider_num">05</span>
                    <span class="slider_text" >Clever price</span>
                </div>
            </div>
        </div>
    </div>

</div><!-- /.intro -->

<%@ include file = "layouts/footer.jsp"%>
