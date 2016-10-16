<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="cp1251"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<title>Новости</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>
<body>
   
   <c:url var="searchUrl" value="/izludec/main/news/search?text=${text}" />
<div class="main">
<div class="row-fluid">
<div class="span12">
<div style="margin: 0 0 15px 0;">
       <c:url var="mainUrl" value="/izludec/main/news"/>  
<a href="${mainUrl}" alt=""><img src="${pageContext.request.contextPath}/img/logo.png" width="320" /></a>
<div class="navbar">
<div class="navbar-inner">
<ul class="nav">     
<li class="">
<a href="${mainUrl}">Главная</a></li>
<sec:authorize access="isAnonymous()">
<li class="">
<a href="${mainUrl}/login">Войти</a>
</li>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<li class="">
<a href="${mainUrl}/logout">Выйти</a>
</li>
</sec:authorize>
</ul>
<form role="search" id="demo-b" class="navbar-search pull-right" method="get" action="${searchUrl}" >
<input type="search" name="s" placeholder="Search">
</form>
</div></div></div>
</div>
  

<div class="row-fluid">
<div class="span10 fix-main">       
 

<c:url var="addUrl" value="/izludec/main/news/add"/>
    <c:url var="editUrl" value="/izludec/main/news/edit?id=${news.id}"/>
    <c:url var="deleteUrl" value="/izludec/main/news/delete?id=${news.id}"/>
    <div class="well" style="background-color:#ffffff;">
        <center><h2><c:out value="${news.head}" /></h2></center>
    <p><c:out value="${news.text}" /></p>
    </div>
			
	  	
<center><div id='wp_page_numbers'>
<ul><li class="page_info">Страница 1 из 1</li>
<li class="active_page"><a href="#">1</a></li>
<!-- <li><a href="#">2</a></li> -->

</div> 

<!--<a class="add" href="${addUrl}">Добавить новость</a>-->

</ul>
<div style='float: none; clear: both;'></div>
</div>
<br /></center>
	
<div class="span2 fix">
	  		<div class="well">
	<ul class="nav nav-tabs nav-stacked">
		<li class="nav-header category">Категории</li>
		<div class="menu">
			<li><a href="${bytag}?tag=Спорт"><div>Спорт</div></a></li>
			<li><a href="${bytag}?tag=Наука"><div>Наука</div></a></li>
			<li><a href="${bytag}?tag=Интернет"><div>Интернет</div></a></li>
			<li><a href="${bytag}?tag=Игры"><div>Игры</div></a></li>				
		</div>
	</ul>
                </div>
                  <sec:authorize access="isAuthenticated()">
                <div class="well">
                <ul class="nav nav-tabs nav-stacked">
		<li class="">
                <a href="${addUrl}"><div>Добавить новость</div></a></li>
                </ul>
                </div>
                </sec:authorize>
</div>
</div>
</div>
</div>
                
                     <script src="${pageContext.request.contextPath}/bootstrap/min.js" type="text/javascript"></script>            
 <script src="${pageContext.request.contextPath}/bootstrap/scrollup.js" type="text/javascript"></script>
<script>
$(function () {
     $(function () {
          $.scrollUp({
              animation: 'slide',
	      scrollText: 'Наверх',
         });
     });
});
</script>
</body>
</html>