<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	//Java 구역 - 전역변수
	//처음 실행할 때 딱 1번만 실행 - init()
	String name = "홍길동";
	int age = 25;
%>

<%
	//Java 구역 - 지역변수
	//요청시마다 실행한다., service()
	age++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  HELLO JSP !! <br/> -->

<%-- 안녕하세요 JSP !! <br/> --%>

나의 이름은 <%=name %>입니다. <br/>

<% out.println("나의 이름은 " + name + "입니다."); %> <br/>

<!-- 나의 나이는 <%=age %>살입니다. <br/>  -->

<%-- <% out.println("내 나이는 " + age + "살입니다."); %> --%>
</body>
</html>