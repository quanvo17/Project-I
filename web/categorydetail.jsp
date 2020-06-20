<%-- 
    Document   : categorydetail
    Created on : Dec 19, 2019, 4:14:27 PM
    Author     : quan.vd173320
--%>

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
    session.setAttribute("view", "/categorydetail");
    Category cateselect = (Category) session.getAttribute("cate");

%>
<div class="category-section">
    <div class="container">
        <div class="title-section">Học phần <%=cateselect.getName()%></div>
        <% 
                        String thongbao = (String) request.getAttribute("thongbao");
                        if(thongbao != null){
                    %>
                    <div class="thongbao"><%= thongbao %></div>
                    <% } %>
                    <div class="pop-up">
                        <button id="addword">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M7.127 22.562l-7.127 1.438 1.438-7.128 5.689 5.69zm1.414-1.414l11.228-11.225-5.69-5.692-11.227 11.227 5.689 5.69zm9.768-21.148l-2.816 2.817 5.691 5.691 2.816-2.819-5.691-5.689z"></path></svg>
                            <div>Thêm từ mới</div>
                        </button>
                        <div class="hoantat"><a href="category?id=<%=cateselect.getCateId()%>">Hoàn tất</a></div>
                    </div>
        <c:forEach items="${word}" var="word">
            <div class="table-word">
                <div class="toolbar">
                    <span class="toolbar-counter">${word.getWordId()}</span>
                    <span class="toolbar-drag"></span>
                    <span class="toolbar-change">
                         <button class="myBtn" data-id="${word.getWordId()}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M7.127 22.562l-7.127 1.438 1.438-7.128 5.689 5.69zm1.414-1.414l11.228-11.225-5.69-5.692-11.227 11.227 5.689 5.69zm9.768-21.148l-2.816 2.817 5.691 5.691 2.816-2.819-5.691-5.689z"></path></svg>
                        </button>
                    </span>
                    <span class="toolbar-remove">
                        <a href="deleteword?id=${word.getWordId()}">
                            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 26 26" style=" fill:#000000;"><path d="M 11 -0.03125 C 10.164063 -0.03125 9.34375 0.132813 8.75 0.71875 C 8.15625 1.304688 7.96875 2.136719 7.96875 3 L 4 3 C 3.449219 3 3 3.449219 3 4 L 2 4 L 2 6 L 24 6 L 24 4 L 23 4 C 23 3.449219 22.550781 3 22 3 L 18.03125 3 C 18.03125 2.136719 17.84375 1.304688 17.25 0.71875 C 16.65625 0.132813 15.835938 -0.03125 15 -0.03125 Z M 11 2.03125 L 15 2.03125 C 15.546875 2.03125 15.71875 2.160156 15.78125 2.21875 C 15.84375 2.277344 15.96875 2.441406 15.96875 3 L 10.03125 3 C 10.03125 2.441406 10.15625 2.277344 10.21875 2.21875 C 10.28125 2.160156 10.453125 2.03125 11 2.03125 Z M 4 7 L 4 23 C 4 24.652344 5.347656 26 7 26 L 19 26 C 20.652344 26 22 24.652344 22 23 L 22 7 Z M 8 10 L 10 10 L 10 22 L 8 22 Z M 12 10 L 14 10 L 14 22 L 12 22 Z M 16 10 L 18 10 L 18 22 L 16 22 Z"></path></svg>
                        </a>
                    </span>
                </div>
                <div class="table-content">
                    <div class="row">
                        <div class="col-md-6">${word.getName()}</div>
                        <div class="col-md-6">${word.getMean()}</div>
                    </div>     
                </div>
            </div>
        </c:forEach>
    </div>
</div>
    <div class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <span class="title-popup">Cập nhật từ</span>
            <form action="updateword" method="post" enctype="multipart/form-data">
                <div class="form-container">
                    <label>ID</label>
                    <input name="wordid" id="wordid" readonly>
                </div>
                <div class="form-container">
                    <label>Nhập từ</label>
                    <input name="name" id="name1" type="text" required="">
                </div>
                <div class="form-container">
                    <label>Nghĩa   </label>
                    <input name="mean" id="mean1" type="text" required="">
                </div>
                <div class="form-submit">
                    <input type="submit" value="Cập nhật">
                </div>
            </form>
        </div>
    </div>
    <div id="pop-content" class="pop-content">

  <!-- Modal content -->
    <div class="modal-content">
        <span class="close1">&times;</span>
        <span class="title-popup">Thêm từ mới</span>
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
              <input type="text" name="category" id="cate" value="<%=cateselect.getName()%>" readonly>
          </div>
          <div class="form-submit">
              <input type="submit" value="Thêm từ">
          </div>
      </form>
    </div>
    </div>
    <script>
        // Get the modal
        jQuery(document).ready(function($){
          $('.myBtn').click(function(){
              var id = $(this).data('id');
              $('.modal').show();
              $('#wordid').val(id);
          });  
          
          $('.close').click(function(){
               $('.modal').hide();
          });
        });
        var popcontent = document.getElementById("pop-content");
        var addword = document.getElementById("addword");
        var span = document.getElementsByClassName("close1")[0];
        addword.onclick = function() {
            popcontent.style.display = "block";
        }
        span.onclick = function() {
                popcontent.style.display = "none";
        }
        window.onclick = function(event) {
            if (event.target == modal) {
                popcontent.style.display = "none";
            }
        }
    </script>