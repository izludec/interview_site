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
<title>�������</title>
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
<li class="active">
<a href="${mainUrl}">�������</a></li>
<sec:authorize access="isAnonymous()">
<li class="">
<a href="${mainUrl}/login">�����</a>
</li>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<li class="">
<a href="${mainUrl}/logout">�����</a>
</li>
</sec:authorize>

<!--<li class=""><a href="${mainUrl}">�����</a></li>-->
</ul>
<c:url var="searchUrl" value="/izludec/main/news/search?text=${text}" />
<form role="search" id="demo-b" class="navbar-search pull-right" action="${searchUrl}" >
<input type="search" name="text" placeholder="Search"/>
</form>
</div></div></div>
</div>
  

<div class="row-fluid">
<div class="span10 fix-main">

    
<div class="well">
<div class="row-fluid">
<div class="span2" style="width: 90px;">
<img width="299" height="299" src="${pageContext.request.contextPath}/img/info-logo.jpg" 
class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt=""/>	
</div>
<div class="span10">
<h3 class="title-post-name"><a style="text-decoration: none;" href="#"><c:out value="�������� �������" /></a></h3>
<p class="post-name-info">�����: ������ �������</p>
<a style='text-decoration: none;' href='#'><span class='label label-success'>��������</span></a> </div>
</div>
<p>
     <ul> </ul>
    <c:out value="��� �������� ���� ������� � �������� ��������� �������."/><br/>
            <c:out value="�������:"/><br/>
            <c:out value="����������� ���-���������� �� ���������� ��������� ������ �� �����.
           ������ ������� ������� �� ��������, ����������, ���� ���������� � ���������,� ������� ��������� �������.
           ������ ��������� �������� ��������, � � ��� ����� ���� ��������� ��������� ��������."/> <br/>
            <c:out value="
           ���������� ������ ������������� ��������� ����������� �� ������ � ���������:"/><br/><br/>
            <ul>
           <li style=" list-style: circle outside !important; margin-left: 20px;">������������� ������ ��������</li>
           <li style=" list-style: circle outside !important; margin-left: 20px;">����� ������� �� ��������� (����������� ������� �� ������������ ���������), �������� � ����������</li>
           <li style=" list-style: circle outside !important; margin-left: 20px;">�������� � �������������� �������</li>
           <li style=" list-style: circle outside !important; margin-left: 20px;">�������� �������</li>
           <li style=" list-style: circle outside !important; margin-left: 20px;">������ ����������������� ����� � �������������� Spring Security</li>
           </ul><br/>
          
           <h4>����� ������� �����: <a href="http://devcolibri.com">Alex Barchuk</a></h4>
           <c:out value="������������ ����������: Spring MVC, Hibernate, JSP, Spring Security, MySQL, Heroku, ClearDb." /> <br/>
           <c:out value="���������� ������ �� ������ �����" />
           <a href="https://github.com/izludec/interview_trendsoft">�����</a><br/>
           <c:out value="���� �� �� ������ ������� ��������, ����� ����, ������ ���������� ������ � ����� ������ ���� ��� ��� �� ���������. �������, ����������, � ������ � 10:00-19:00 �� ����������� �������."/>
    
    <legend></legend></p>
<div class="buttom-post-info">
<i class="icon-time"></i>  10/10/2016 
</div>
</div>

  <c:if test="${empty page}">
	�������� ���.
</c:if>         
           
    
<c:url var="addUrl" value="/izludec/main/news/add" />
<c:url var="bytag" value="/izludec/main/news/tag" />

<c:forEach items="${news}" var="news" begin="${(page-1)*5}" end="${(page-1)*5+4}">
    <c:url var="editUrl" value="/izludec/main/news/edit?id=${news.id}" />
    <c:url var="deleteUrl" value="/izludec/main/news/delete?id=${news.id}" />
    <c:url var="shownews" value="/izludec/main/news/show?id=${news.id}" />
    <fmt:formatDate value="${news.date}" pattern="dd/MM/yyyy" var="datevar" /> 
    
    
    
    <div class="well">
    <div class="row-fluid">
    <div class="span2" style="width: 90px;">
    <img width="299" height="299" src="${pageContext.request.contextPath}/img/newslogo.png" 
         class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt=""/>	
    </div>
    <div class="span10">
    <h3 class="title-post-name"><a style="text-decoration: none;" href="${shownews}"><c:out value="${news.head}" /></a></h3>
    <p class="post-name-info">�����: ������ �������</p>
    <a style='text-decoration: none;' href='${bytag}?tag=${news.category}'><span class='label label-success'>${news.category}</span></a> </div>
    </div>
    <p>
        <c:out value="${fn:substring(news.text, 0, 500)}..." />
        <legend></legend></p>
    <div class="buttom-post-info">
    <i class="icon-time"></i> <c:out value="${datevar}" />
    <sec:authorize access="isAuthenticated()">
    <div style="float: right;"><a href="${deleteUrl}" class="delete btn btn-success" id="btn-add-comment">�������</a><a href="${editUrl}" class="delete btn btn-success" id="btn-add-comment">��������</a></div>
    </sec:authorize>
    
    </div>
    </div>
    
</c:forEach>


<c:if test="${empty news}">
	�������� ���.
</c:if>

  
<center><div id='wp_page_numbers'>
        <fmt:formatNumber value="${fn:length(news)/5+(1-(fn:length(news)/5%1))%1}" type="number" pattern="#" var="end"/>
<ul><li class="page_info">�������� 1 �� <fmt:formatNumber value="${end}" minFractionDigits="0" maxFractionDigits="0"/></li>        
        <c:forEach var="i" begin="1" end="${end}"> 
            <c:choose>
        <c:when test="${i == page}">
        <li class="active_page"><a href="${mainUrl}?page=${i}"><c:out value="${i}" /></a></li>
        </c:when>
        <c:when test="${i != page}">        
        <li><a href="${mainUrl}?page=${i}"><c:out value="${i}" /></a></li>
        </c:when>
        </c:choose>
        </c:forEach>
</ul>
<div style='float: none; clear: both;'></div>
</div>
<br /></center>
	</div>
<div class="span2 fix">
    <div class="well">
	<ul class="nav nav-tabs nav-stacked">
		<li class="nav-header category">���������</li>
		<div class="menu">
			<li><a href="${bytag}?tag=�����"><div>�����</div></a></li>
			<li><a href="${bytag}?tag=�����"><div>�����</div></a></li>
			<li><a href="${bytag}?tag=��������"><div>��������</div></a></li>
			<li><a href="${bytag}?tag=����"><div>����</div></a></li>				
		</div>
	</ul>
      
</div>
                        <sec:authorize access="isAuthenticated()">
                <div class="well">
                <ul class="nav nav-tabs nav-stacked">
		<li class="">
                <a href="${addUrl}"><div>�������� �������</div></a></li>
                </ul>
                </div>
                </sec:authorize>
</div>
</div>
                
                <div class="row-fluid">
			<div class="well" id="footer">
				<center>
					<span style="font-size: 12px;"> ���������� ���������� ����������� ${count}</span><br />
				</center>
				
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
	      scrollText: '������',
         });
     });
});
</script>
</body>
</html>

