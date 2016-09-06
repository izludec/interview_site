<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="cp1251"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
<title>�������</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/screen.css" />
</head>
<body>
  <%--  <c:url var="searchUrl" value="/krams/main/news/search?word=${word}" />
        <form:form modelAttribute="news" method="GET" action="${searchUrl}">               
            <form:input path="word" />
	  <input type="submit" value="�����" />           
         </form:form>   --%>
  <div id="layout">
  <div id="header">
    <h1 id="logo">�������</h1>
    

    <hr class="noscreen" />
    
    
     <c:url var="searchUrl" value="/izludec/main/news/search?text=${text}" />
    <div id="search">     
        <form action="${searchUrl}"> 
            <fieldset>
          <input id="phrase" name="text" />
	  <input id="submit" type="submit" value="�����" /> 
            </fieldset>          
        </form>     
    </div>
  </div> 

      
        
  <c:url var="mainUrl" value="/izludec/main/news"/>    
  <hr class="noscreen" />
  <div id="container" class="box">
    <div id="obsah" class="content box">
      <div class="in">
<c:url var="addUrl" value="/izludec/main/news/add"/>
    <c:url var="editUrl" value="/izludec/main/news/edit?id=${news.id}"/>
    <c:url var="deleteUrl" value="/izludec/main/news/delete?id=${news.id}"/>
    <div class="article">
    <h2><c:out value="${news.head}" /></h2>
    <div class="f-left article-img"><img src="${pageContext.request.contextPath}/img/image.jpg" alt="" />        
    <div></div>
    </div>
    <p class="f-left"><c:out value="${news.text}" /></p>
    <div class="category"><a href="${bytag}?tag=${news.category}">${news.category}</a></div><a href="${deleteUrl}" class="delete">�������</a><a href="${editUrl}" class="delete">��������</a>    
    <div class="clear"></div>
    </div>
        </div>
    </div>
<div id="panel-right" class="box panel">
      <div id="bottom">
          <div class="f-left">
            <div></div>
          </div>
          <div class="clear"></div>
          <br />
          <strong class="title">���������</strong>
          <ul>
            <li><a class="tags" href="${bytag}?tag=�����">�����</a></li>
            <li><a class="tags" href="${bytag}?tag=�����">�����</a></li>
            <li><a class="tags" href="${bytag}?tag=��������">��������</a></li>
            <li><a class="tags" href="${bytag}?tag=����">����</a></li>
          

          </ul>
        </div>
      </div>
<a class="add" href="${addUrl}">�������� �������</a>
<a class="add" href="${mainUrl}">�� �������</a>  
    </div>
  </div>

</body>
</html>