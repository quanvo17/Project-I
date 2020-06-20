<%-- 
    Document   : index
    Created on : Dec 12, 2019, 4:28:34 PM
    Author     : quan.vd173320
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("view", "/index");
%>
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="banner-content col-md-6">
                <h1 class="heading-content">Cách tốt nhất để đạt điểm tuyệt đối trong bài thi.</h1>
                <p class="Paragraph-content">Tìm trong hàng triệu học phần hoặc tự tạo học phần. Cải thiện điểm số bằng phương pháp học cùng thẻ ghi nhớ, trò chơi và nhiều phương pháp khác.</p>
                <p class="button-content"><a href="/login">Bắt đầu học</a></p>
            </div>
        </div>
    </div>
</div>
<div class="search-section">
    <div class="container">
        <div class="title-section">Tìm kiếm từ</div>
        <form>
            <form action="search" method="get">
                <input name="word" id="word" type="text" required="">
                <label class="">
                    <input type="submit" value="search">
                </label>
        </form>
    </div>
</div>
