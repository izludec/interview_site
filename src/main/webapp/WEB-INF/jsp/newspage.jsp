<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="cp1251"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<title>Новости</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/screen.css" />
</head>
<body>
  <%--     --%>
  <div id="layout">
  <div id="header">
    <h1 id="logo">Новости</h1>
    
    
    <hr class="noscreen" /> 
   <c:url var="searchUrl" value="/izludec/main/news/search?text=${text}" />
    <div id="search">     
        <form action="${searchUrl}"> 
            <fieldset>
          <input id="phrase" name="text" />
	  <input id="submit" type="submit" value="Поиск" /> 
            </fieldset>          
        </form>     
    </div>
  </div> 
      
        
      
  <hr class="noscreen" />
  <div id="container" class="box">
    <div id="obsah" class="content box">
      <div class="in">

<c:url var="addUrl" value="/izludec/main/news/add" />
<c:url var="bytag" value="/izludec/main/news/tag" />
<c:forEach items="${news}" var="news">
    <c:url var="editUrl" value="/izludec/main/news/edit?id=${news.id}" />
    <c:url var="deleteUrl" value="/izludec/main/news/delete?id=${news.id}" />
    <c:url var="shownews" value="/izludec/main/news/show?id=${news.id}" />
    <fmt:formatDate value="${news.date}" pattern="dd/MM/yyyy" var="datevar" />
    <div class="article">
    <h2><a href="${shownews}"><c:out value="${news.head}" /></a></h2>
    <div class="f-left article-img"><img src="../../img/image.jpg" alt="" />
    <div></div>
    </div>
    <p class="f-left text"><c:out value="${fn:substring(news.text, 0, 500)}..." /></p>
    <div class="category"><a href="${bytag}?tag=${news.category}">${news.category}</a></div><div class="category"><fmt:formatDate value="${news.date}" pattern="yyyy-MM-dd"/></div><a href="${shownews}" class="more">Читать</a><a href="${deleteUrl}" class="delete">Удалить</a><a href="${editUrl}" class="delete">Изменить</a>
    <div class="clear"></div>
    </div>
</c:forEach>


<c:if test="${empty news}">
	Новостей нет.
</c:if>
        </div>
    </div>
<div id="panel-right" class="box panel">
      <div id="bottom">
          <div class="f-left">
            <div></div>
          </div>
          <div class="clear"></div>
          <br />
          <strong class="title">Категории</strong>
          <ul>            
            <li><a class="tags" href="${bytag}?tag=Спорт">Спорт</a></li>
            <li><a class="tags" href="${bytag}?tag=Наука">Наука</a></li>
            <li><a class="tags" href="${bytag}?tag=Интернет">Интернет</a></li>
            <li><a class="tags" href="${bytag}?tag=Игры">Игры</a></li>
        

          </ul>
        </div>
      </div>
<a class="add" href="${addUrl}">Добавить новость</a>
    </div>
  </div>

</body>
</html>