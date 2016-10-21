<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="cp1251"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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
<img width="299" height="299" src="${pageContext.request.contextPath}/img/newslogo.png" 
class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt=""/>	
</div>
<div class="span10">
<h3 class="title-post-name"><a style="text-decoration: none;" href="#"><c:out value="�������� �������" /></a></h3>
<p class="post-name-info">�����: ������ �������</p>
<a style='text-decoration: none;' href='#'><span class='label label-success'>�����</span></a> </div>
</div>
<p>
    
    <c:out value="��� �������� ���� ������� � �������� ��������� �������."/><br/>
            <c:out value="�������:"/><br/>
            <c:out value="����������� ���-���������� �� ���������� ��������� ������ �� �����.
           ������ ������� ������� �� ��������, ����������, ���� ���������� � ���������,� ������� ��������� �������.
           ������ ��������� �������� ��������, � � ��� ����� ���� ��������� ��������� ��������."/> <br/>
            <c:out value="
           ���������� ������ ������������� ��������� ����������� �� ������ � ���������:"/><br/>
            <ul>
           <li style=" list-style: circle outside !important; margin-left: 20px;">������������� ������ ��������</li>
           <li style=" list-style: circle outside !important; margin-left: 20px;">����� ������� �� ��������� (����������� ������� �� ������������ ���������), �������� � ����������</li>
           <li style=" list-style: circle outside !important; margin-left: 20px;">�������� � �������������� �������</li>
           <li style=" list-style: circle outside !important; margin-left: 20px;">�������� �������</li>
           </ul><br/>
           <c:out value="������������ ����������: Spring MVC, Hibernate, JSP." /> <br/>
           <c:out value="���������� ������ �� ������ �����" />
           <a href="https://github.com/izludec/interview_trendsoft">�����</a><br/>
           <c:out value="���� �� �� ������ ������� ��������, ����� ����, ������ ���������� ������ � ����� ������ ���� ��� ��� �� ���������. �������, ����������, � ������ � 10:00-19:00 �� ����������� �������."/>
    
    <legend></legend></p>
<div class="buttom-post-info">
<i class="icon-time"></i>  10/10/2016 
</div>
</div>

           
           
    
<c:url var="addUrl" value="/izludec/main/news/add" />
<c:url var="bytag" value="/izludec/main/news/tag" />


<c:if test="${empty news}">
	�������� ���.
</c:if>

        
<center><div id='wp_page_numbers'>
<ul><li class="page_info">�������� 1 �� 1</li>
<li class="active_page"><a href="#">1</a></li>
<!-- <li><a href="#">2</a></li> -->



<!--<a class="add" href="${addUrl}">�������� �������</a>-->

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
</div>
</body>
</html>

