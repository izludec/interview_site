<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs"
      xmlns:h="http://java.sun.com/jsf/html"
      xmlns:f="http://java.sun.com/jsf/core">
<head>
<title>Новости</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>
<body>
   
   
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
<c:url var="searchUrl" value="/izludec/main/news/search?text=${text}" />
<form role="search" id="demo-b" class="navbar-search pull-right" method="get" action="${searchUrl}" >
<input type="search" name="s" placeholder="Search">
</form>
</div></div></div>
</div>
  

<div class="row-fluid">
<div class="span10 fix-main">     

<c:url var="saveUrl" value="/izludec/main/news/add" />
<form:form modelAttribute="newsAttribute" method="POST" action="${saveUrl}"  width="100">
	 <table style="width:500px !important;">
		<tr>
			<td><form:label path="head">Заголовок</form:label></td>
			<td><form:input style="width:auto;" size="103" path="head"/></td>
		</tr>

		<tr>
			<td><form:label path="text">Текст</form:label></td>
			<td><form:textarea style="width:auto;" cols="100" rows="30" path="text"/></td>
		</tr>               
                
                <tr>
			<td><form:label path="category">Категория</form:label></td>
                        <td><form:select style="width:auto;" path="category">
                                <form:option value="Наука">Наука</form:option>
                            <form:option  value="Спорт">Спорт</form:option>
                            <form:option  value="Интернет">Интернет</form:option>
                            <form:option  value="Игры">Игры</form:option>
                            </form:select>
                            </td>
		</tr>
              
	</table>
	
	<input  class="delete btn btn-success" id="btn-add-comment" type="submit" value="Сохранить" />
</form:form>

        
        
<center><div id='wp_page_numbers'>
<ul><li class="page_info">Страница 1 из 1</li>
<li class="active_page"><a href="#">1</a></li>
<!-- <li><a href="#">2</a></li> -->



<!--<a class="add" href="${addUrl}">Добавить новость</a>-->

</ul>
<div style='float: none; clear: both;'></div>
</div>
<br /></center>
	</div>
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
</body>
</html>