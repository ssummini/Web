<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}

</style>
</head>
<body>
	<form method="get" action="elResult.jsp">
		<table border="1">
			<tr>
				<th>X</th>
				<td><input type="text" name="x" /></td>
			</tr>
			
			<tr>
				<th>Y</th>
				<td><input type="text" name="y"  /></td>
			</tr>
			
			<tr>
				<td colspan="2"  align="center">
					<input type="submit" value="계산" />
					<input type="reset" value="취소" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>