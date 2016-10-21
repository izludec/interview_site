<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<!--<li class=""><a href="${mainUrl}">Войти</a></li>-->
</ul>
<c:url var="searchUrl" value="/izludec/main/news/search?text=${text}" />
<form role="search" id="demo-b" class="navbar-search pull-right" action="${searchUrl}" >
<input type="search" name="text" placeholder="Search"/>
</form>
</div></div></div>
</div>
  

<div class="row-fluid">
<div class="span10 fix-main">

    
<c:url var="addUrl" value="/izludec/main/news/add" />
<c:url var="bytag" value="/izludec/main/news/tag" />


   

    <div class="well">
    <div class="row-fluid">
    <div class="span2" style="width: 90px;">
    <img width="299" height="299" src="${pageContext.request.contextPath}/img/newslogo.png" 
         class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt=""/>	
    </div>
    <div class="span10">
    <h3 class="title-post-name"><a style="text-decoration: none;" href="#"><c:out value="Посетители" /></a></h3>
    <p class="post-name-info">Автор: Кирилл Излюдец</p>
    <a style='text-decoration: none;' href="#"><span class='label label-success'>Без категории</span></a> </div>
    </div>
    <p>
        
                 
            <table border="1">
                <thead>
                    <tr>
                        <th>Номер</th>
                        <th>IP-адрес</th>
                        <th>Время</th>
                    </tr>
                </thead>
                <tbody>
                  <c:forEach items="${visits_list}" var="visit" begin="0">
                    <tr>
                        <td style="padding:10px">${visit.id}</td>
                        <td style="padding:10px">${visit.getAdress()}</td>
                        <td style="padding:10px">${visit.getDate()}</td>
                    </tr>
                  </c:forEach>
                </tbody>
            </table>

        
        
        
        <legend></legend></p>
    <div class="buttom-post-info">
    <c:out value="" />    
    </div>
    </div>
    


  
<center><div id='wp_page_numbers'>
        <ul>   
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

