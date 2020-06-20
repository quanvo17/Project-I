<%-- 
    Document   : Dashboard
    Created on : Dec 13, 2019, 11:26:52 AM
    Author     : quan.vd173320
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
<%@page import="entity.Category" %>
<!DOCTYPE html>
<% 
    session.setAttribute("view", "/dashboard");
    
%>
<div class="dashboard-section">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <jsp:include page = "sidebar.jsp" />
            </div>
            <div class="col-md-9">
                <% 
                        String thongbao = (String) request.getAttribute("thongbao");
                        if(thongbao != null){
                    %>
                    <div class="thongbao"><%= thongbao %></div>
                    <% } %>
                <div class="row">
                    <c:forEach items="${categoryList}" var="cates">
                        <div class="col-md-6">
                            <a href="<c:url value="category?id=${cates.getCateId()}" />">
                                <div class="box-cate">
                                    <div class="title-box">${cates.getName()}</div>
                                    <div class="content-box">${cates.getDescription()}</div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
