<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="Windows-1251"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/screen.css" />
<title>�������</title>
</head>
<body>

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

  <c:url var="mainUrl" value="/izludec/main/news" />    
  <hr class="noscreen" />
  <div id="container" class="box">
    <div id="obsah" class="content box">
      <div class="in">
    <div class="article">

<c:url var="saveUrl" value="/izludec/main/news/add" />
<form:form modelAttribute="newsAttribute" method="POST" action="${saveUrl}">
	<table>
		<tr>
			<td><form:label path="head">���������</form:label></td>
			<td><form:input size="60" path="head"/></td>
		</tr>

		<tr>
			<td><form:label path="text">�����</form:label></td>
			<td><form:textarea cols="50" rows="30" path="text"/></td>
		</tr>               
                
		<tr>
			<td><form:label path="category">���������</form:label></td>
			<td><form:input path="category"/></td>
		</tr>
              
	</table>
	
	<input type="submit" value="Save" />
</form:form>

        
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
<a class="add" href="${mainUrl}">�� �������</a>   
    </div>
  </div>

</body>
</html>