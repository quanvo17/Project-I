<%-- 
    Document   : search
    Created on : Dec 15, 2019, 2:38:00 PM
    Author     : quan.vd173320
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="entity.Word" %>
<% 
    session.setAttribute("view", "/search");
    Word wordfinded = (Word) session.getAttribute("wordfinded");
    String thongbao = (String) session.getAttribute("thongbao");
%>
<!DOCTYPE html>
<html>
    <body>
        <div class="section-search">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="thongbao"><%=thongbao %></div>
                    <div class="word-cate">
                        <div class="box-slide">
                            <div class="title-slide"><%=wordfinded.getName()%></div>
                            <div class="content-slide"><%=wordfinded.getMean()%></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 form-dky">
                    <div class="title-form">Đăng ký tài khoản</div>
                    <form action="register" method="get">
                    <div class="login-name">
                        <div class="title-form">Tên người dùng</div>
                        <input name="name" id="name" type="text" placeholder="Tên" required="">
                        <i class="icon-name"></i>
                    </div>
                    <div class="login-name">
                        <div class="title-form">Mật khẩu</div>
                        <input name="password" id="password" type="password" placeholder="Mật khẩu" required="">
                        <i class="icon-pass"></i>
                    </div>
                    <label class="button-content">
                        <input type="submit" value="Đăng ký">
                    </label>
                </form>        
                </div>      
            </div>
        </div>
        </div>
    </body>
</html>
