<%-- 
    Document   : Category
    Created on : Dec 18, 2019, 3:40:11 PM
    Author     : quan.vd173320
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
<%@page import="entity.Category" %>
<%@page import="entity.Word" %>
<!DOCTYPE html>
<% 
    session.setAttribute("view", "/category");
    Category cateselect = (Category) session.getAttribute("cate");
%>
<div class="dashboard-section">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <jsp:include page = "sidebar.jsp" />
            </div>
            <div class="col-md-9">
                <div class="slide-container">
                    <c:forEach items="${word}" var="word">
                            <div class="word-cate" id="word_${word.getWordId()}">
                                <a href="#">
                                    <div class="box-slide">
                                        <div class="title-slide">${word.getName()}</div>
                                        <div class="content-slide">${word.getMean()}</div>
                                    </div>
                                </a>
                            </div>
                    </c:forEach>
                    <div class="nav-slide">
                        <div class="navButton" id="previous">&#10094;</div>
                        <div class="navButton" id="next">&#10095;</div>
                    </div>                                          
                </div>
                <div class="control-bar">
                    <div class="change-bar">
                        <a href="categorydetail?id=<%=cateselect.getCateId()%>">
                            Chỉnh sửa
                        </a></div>
                </div>
            </div>
        </div>
    </div>
</div>
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
    $('#previous').on('click', function(){
    // Change to the previous word
        $('#word_' + currentImage).stop().fadeOut(1);
        decreaseImage();
        $('#word_' + currentImage).stop().fadeIn(1);
    });
    $('#next').on('click', function(){
    // Change to the next image
        $('#word_' + currentImage).stop().fadeOut(1);
        increaseImage();
        $('#word_' + currentImage).stop().fadeIn(1);
    });

    var currentImage = 1;
    var totalImages = 5;

    function increaseImage() {
    /* Increase currentImage by 1.
    * Resets to 1 if larger than totalImages
    */
        ++currentImage;
        if(currentImage > totalImages) {
            currentImage = 1;
        }
    }
    function decreaseImage() {
    /* Decrease currentImage by 1.
    * Resets to totalImages if smaller than 1
    */
        --currentImage;
        if(currentImage < 1) {
            currentImage = totalImages;
        }
    }
});
</script>