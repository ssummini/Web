<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
<style type="text/css">
td {
	padding: 0 5px;
	width: 100px;
}
</style>
</head>
<body>
<table>
<% for(int i = 1; i < 10; i++){ %>
	<tr>
	<%for(int dan = 2; dan < 10; dan++){ %>
			
		<td><%= dan %> * <%=i%>  = <%= dan*i %></td>
			
	<%}//for dan %>
	</tr>
<%}//for i %>
</table>
</body>
</html>