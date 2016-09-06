<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/screen.css" />
<title>Новости</title>
</head>
<body>

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

  <c:url var="mainUrl" value="/izludec/main/news" />    
  <hr class="noscreen" />
  <div id="container" class="box">
    <div id="obsah" class="content box">
      <div class="in">
    <div class="article">
        
        
        
<c:url var="saveUrl" value="/izludec/main/news/edit?id=${newsAttribute.id}" />
<form:form modelAttribute="newsAttribute" method="POST" action="${saveUrl}">
	<table>
		<tr>
			<td><form:label path="id">Номер</form:label></td>
                        <td><form:input path="id" disabled="true"/></td>
		</tr>
	
		<tr>
			<td><form:label path="head">Заголовок</form:label></td>
                        <td><form:input size="60" path="head"/></td>
		</tr>

		<tr>
			<td><form:label path="text">Текст</form:label></td>
			<td><form:textarea cols="50" rows="30" path="text"/></td>
		</tr>
		
		<tr>
			<td><form:label path="category">Категория</form:label></td>
			<td><form:input path="category"/></td>
		</tr>
                
                <tr>
			<td><form:label path="date">Дата</form:label></td>
			<td><form:input path="date" disabled="true"/></td>
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
          <strong class="title">Категории</strong>
          <ul>
            <li><a class="tags" href="${bytag}?tag=Спорт">Спорт</a></li>
            <li><a class="tags" href="${bytag}?tag=Наука">Наука</a></li>
            <li><a class="tags" href="${bytag}?tag=Интернет">Интернет</a></li>
            <li><a class="tags" href="${bytag}?tag=Игры">Игры</a></li>

          </ul>
        </div>
      </div>     
<a class="add" href="${mainUrl}">На главную</a>   
    </div>
  </div>

</body>
</html>