<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML 태그 시작 전의 공백 제거 --%>
<%
	//JAVA 구역(HTML 안에서)
	//String user_id = request.getParameter("user_id");
	String user_id = "hong2";
	
	//DB 연동 구역
	//만약에 지금 id가 "hong"이라면 DB에 이미 저장된 id인 경우 => 사용 불가능
	// "hong"이 아니면 사용 가능
	boolean result = false;
	if(user_id.equals("hong")){
		result = true;
	}	
%>
<%-- XML보내기 --%>
<?xml version="1.0" encoding="UTF-8"?> <%-- DTD부분--%>
<check_id>
    <result><%=result %></result>
</check_id>



<%--
* trimDirectiveWhitespaces 속성

jsp에서 서블릿이나 EL을 이용할 경우 로딩된 페이지에서 소스보기를 해 보면 공백으로 표기가 된다.
trimDirectiveWhitespaces 속성을 true로 할 경우 해당 공백을 모두 제거해 준다.
--%>