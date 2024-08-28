<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String num = request.getParameter("num");

	//고유한 값인 num을 들고 DB에가서 삭제하기
	boolean result = true;
	String message = "댓글이 삭제되었습니다.";
%>

<%-- XML 보내기 --%>
<?xml version="1.0" encoding="UTF-8"?> <%-- DTD부분--%>
<commment>
	<result><%=result %></result>
	<message><%=message %></message>
</commment>