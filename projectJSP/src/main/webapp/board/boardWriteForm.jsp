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
	width: 700x;
	margin: auto;
}

th, td {
	padding: 5px;
}

div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}

input[type="button"], input[type="submit"], input[type="reset"] {
	background-color: #E0E0E0; 
	border: 1px solid;
	text-align: center; 
	font-size: 14px; 
	margin: 4px 2px; 
	padding: 4px 5px;
}

input[type="button"]:hover, input[type="submit"]:hover, input[type="reset"]:hover {
	background-color: #BFBFBF;
}
</style>
</head>
<body>
	<img src="../image/free-icon-love-4096198.png" alt="홈" width="60" height="60" onclick="location.href='../index.jsp'" style="cursor: pointer; display: block; margin: 0 auto;" />
	<form id="boardWriteForm" method="post">
		<table border="1" >	
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" id="subject" size="65" placeholder="제목 입력"/>
					<div id="subjectDiv"></div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" id="content" cols="65" rows="20"></textarea>
					<div id="contentDiv"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="writeBtn" value="글쓰기" />
					<input type="reset" value="다시작성" />
				</td>
			</tr>
		</table>
	</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/board.js"></script>
</body>
</html>