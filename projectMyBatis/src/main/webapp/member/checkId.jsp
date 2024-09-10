<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//데이터 
	String id = request.getParameter("id");

	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	
	//id가 있으면 true(사용 불가능) / id가 없으면 false(사용 가능)
	int su = memberDAO.isExistId(id); //id가 있으면 true(사용 불가능)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <% if (su == 1) { %>
        <%=id %>은(는) 이미 사용 중입니다.
        <br><br>
        <form action="checkId.jsp">
        	아이디 <input type="text" name="id">
        	<input type="submit" value="중복체크"/>
        </form>
    <% } else { %>
         <%=id %>은(는) 사용 가능한 아이디입니다.
         <br><br>
         <input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')" />
    <% } %>  
<script type="text/javascript">
function checkIdClose(id){
	opener.document.getElementById("id").value = id;
	opener.document.getElementById("check").value = id;
	window.close();
	opener.document.getElementById("pwd").focus();
}
</script>

</body>
</html>