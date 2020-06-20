<%-- 
    Document   : sidebar
    Created on : Dec 16, 2019, 10:20:09 PM
    Author     : quan.vd173320
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
<%@page import="entity.Category" %>
<!DOCTYPE html>
<div class="side-bar">
    <div class="side-bar-item">
        <a href="dashboard">
            <svg id="home" viewBox="0 0 24 24"><path fill-rule="evenodd" clip-rule="evenodd" d="M10.938 4.424L5.061 7.913c-.42.255-.708.464-.88.79C4.01 9.03 4 9.38 4 9.86v9.413c0 .401.326.727.727.727h4.364a.727.727 0 0 0 .727-.727v-4.825c0-.433.337-.774.773-.774h2.818c.436 0 .773.34.773.774v4.825c0 .401.325.727.727.727h4.364a.727.727 0 0 0 .727-.727V9.86c0-.48-.01-.83-.182-1.157-.172-.326-.46-.535-.875-.79-.002 0-5.875-3.489-5.875-3.489-.258-.155-.608-.414-1.062-.424-.466.01-.816.269-1.069.424z"></path></svg>
            <div class="item-content">Trang chủ</div>
        </a>
    </div>
    <div class="side-bar-item">
        <button id="myBtn">
            <svg id="create-set" viewBox="0 0 24 21"><path d="M15.281 3.93v3.515h3.516V9.79H15.28v3.516h-2.344V9.789H9.422V7.445h3.515V3.93h2.344zm-15 1.992v12.773c0 .586.215 1.094.645 1.524.43.43.937.644 1.523.644h14.883v-2.168H2.449V5.922H.281zm4.278 8.555c0 .585.205 1.084.615 1.494.41.41.908.615 1.494.615h14.941c.586 0 1.084-.205 1.495-.615.41-.41.615-.909.615-1.494V2.757c0-.585-.205-1.093-.615-1.523A1.989 1.989 0 0 0 21.609.59H6.668a1.99 1.99 0 0 0-1.494.644c-.41.43-.615.938-.615 1.524v11.719z" fill-rule="evenodd"></path></svg>
            <span>Thêm từ mới</span>
        </button>
    </div>
    <div id="myModal" class="modal">

  <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
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
    </div>
</div>
    <div class="side-bar-item">
        <button id="myBtn_cate">
            <svg id="create-set" viewBox="0 0 24 21"><path d="M15.281 3.93v3.515h3.516V9.79H15.28v3.516h-2.344V9.789H9.422V7.445h3.515V3.93h2.344zm-15 1.992v12.773c0 .586.215 1.094.645 1.524.43.43.937.644 1.523.644h14.883v-2.168H2.449V5.922H.281zm4.278 8.555c0 .585.205 1.084.615 1.494.41.41.908.615 1.494.615h14.941c.586 0 1.084-.205 1.495-.615.41-.41.615-.909.615-1.494V2.757c0-.585-.205-1.093-.615-1.523A1.989 1.989 0 0 0 21.609.59H6.668a1.99 1.99 0 0 0-1.494.644c-.41.43-.615.938-.615 1.524v11.719z" fill-rule="evenodd"></path></svg>
            <span>Thêm danh mục</span>
        </button>
    </div>
    <div id="myModal_cate" class="modal">

  <!-- Modal content -->
    <div class="modal-content">
        <span class="close_cate">&times;</span>
        <span class="title-popup">Thêm danh mục mới</span>
      <form action="insertcategory" method="post" enctype="multipart/form-data">
          <div class="form-container">
              <label>Nhập tên</label>
              <input name="name" id="name_cate" type="text" required="">
          </div>
          <div class="form-container">
              <label>Mô tả</label>
              <input name="description" id="description" type="text" >
          </div>
          <div class="form-submit">
              <input type="submit" value="Thêm danh mục">
          </div>
      </form>
    </div>
</div>
</div>
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

var modal_cate = document.getElementById("myModal_cate");

// Get the button that opens the modal
var btn_cate = document.getElementById("myBtn_cate");

// Get the <span> element that closes the modal
var span_cate = document.getElementsByClassName("close_cate")[0];

// When the user clicks the button, open the modal 
btn_cate.onclick = function() {
  modal_cate.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span_cate.onclick = function() {
  modal_cate.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event_cate) {
  if (event_cate.target == modal_cate) {
    modal_cate.style.display = "none";
  }
}
</script>