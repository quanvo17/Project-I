<%-- 
    Document   : login
    Created on : Dec 12, 2019, 4:28:34 PM
    Author     : quan.vd173320
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("view", "/login");
%>
<div class="login-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <form action="login" method="get">
                    <% 
                        String error = (String) request.getAttribute("error");
                        if(error != null){
                    %>
                    <div class="error"><%= error %></div>
                    <% } %>
                    <% 
                        String thongbao = (String) request.getAttribute("thongbao");
                        if(thongbao != null){
                    %>
                    <div class="thongbao"><%= thongbao %></div>
                    <% } %>
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
                        <input type="submit" value="Đăng nhập">
                    </label>
                </form>
            </div>
         </div>
    </div>
</div>