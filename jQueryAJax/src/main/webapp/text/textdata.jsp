<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
<%
//Java
String result = request.getParameter("keyword"); //요청을 받음. (Hello AJax!!가 담겨진다.)
%>

결과 = <%=result %> result값을 찍어라  --%>

${ param.keyword }; <%--  EL / JSTL --%>