<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="angel" uri="tld" %>
<%@ taglib prefix="devil" uri="tld2" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>자바 클래스의 메소드 이용</h3>
	${param['x']} + ${param['y']} = ${ angel:sum(param['x'], param['y']) } <br>
	${param['x']} - ${param['y']} = ${ angel:sub(param['x'], param['y']) } <br>
	${param['x']} * ${param['y']} = ${ devil:mul(param['x'], param['y']) } <br>
</body>
</html>