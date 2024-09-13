<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>
	forward로 보내면 데이터는 공유한다.<br>
	주소는 forwardStart.jsp가 보이지만 화면은 forwardEnd.jsp가 보인다.
</h3>
결과 = ${requestScope.list} <%-- request.getAttribute("list"); --%>
<br><br>

3번째 항목 = ${requestScope.list[2] }
<br><br>

<c:forEach var="data" items="${list }"> <%-- for(String data : requestScope.list) --%>
	${data }<br>
</c:forEach>
<br><br>

<c:forEach var="personDTO" items="${list2 }"><%-- for(PersonDTO personDTO : list2) --%>
	${personDTO }<br>
</c:forEach> 
<br><br>

<c:forEach var="personDTO" items="${list2 }"> 
	${personDTO.getName() } &emsp;&emsp;${personDTO.getAge() } <br>
	
	<%-- JSTL에서는 메서드의 이름을 변수명처럼 사용한다. --%>
	${personDTO.name } &emsp;&emsp;${personDTO.age } <br>
</c:forEach> 
</body>
</html>