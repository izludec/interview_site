<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
  
    <title>Войти</title>
 
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/bootstrap/css/jumbotron-narrow.css" rel="stylesheet" type="text/css"/>
</head>
 
<body>
 
<div class="container" style="width: 300px;">
    <c:url value="/izludec/main/news/j_spring_security_check" var="loginUrl" />
    <form action="${loginUrl}" method="post">
        <h3 class="form-signin-heading">Введите логин и пароль</h3>
        <input type="text" class="form-control" name="j_username" placeholder="Email address" required autofocus value="admin">
        <input type="password" class="form-control" name="j_password" placeholder="Password" required value="admin">        
        <button class="btn btn-lg btn-primary btn-block btn-success" type="submit">Войти</button>
    </form> 
</div>
 
</body>
</html>