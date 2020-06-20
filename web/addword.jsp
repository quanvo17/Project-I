<%-- 
    Document   : addword
    Created on : Dec 19, 2019, 7:39:15 PM
    Author     : quan.vd173320
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
<%@page import="entity.Category" %>
    <form action="insertword" method="post" enctype="multipart/form-data">
          <div class="form-container">
              <label>Nhập từ</label>
              <input name="name" id="name" type="text" required="">
          </div>
          <div class="form-container">
              <label>Nghĩa   </label>
              <input name="mean" id="mean" type="text" required="">
          </div>
          <div class="form-container">
              <label>Danh mục:  </label>
              <input type="text" name="category" list="catelist" required="">
              <datalist id="catelist">
                  <c:forEach items="${categoryList}" var="categoryList">
                      <option value="${categoryList.getName()}">
                  </c:forEach>
              </datalist>
          </div>
          <div class="form-submit">
              <input type="submit" value="Thêm từ">
          </div>
      </form>