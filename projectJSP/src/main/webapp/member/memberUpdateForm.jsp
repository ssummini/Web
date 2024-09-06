<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>

<%
	String id = (String)session.getAttribute("memId");

	//DB
	MemberDAO memberdao = MemberDAO.getInstance();
	MemberDTO memberDTO = memberdao.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 700px; 
	border: 1px solid;
	margin: 0 auto;
}

th {
	padding: 7px 15px;
	border: 1px solid;
}

td {
	padding: 7px 10px;
	border: 1px solid;
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
<form name="memberUpdateForm" method="post" action="memberUpdate.jsp">
	<table border="1">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" id="name" value="<%=memberDTO.getName() %>" size="15"/>
				<div id="nameDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" value="<%=memberDTO.getId() %>" readonly />
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력" size="25"/>
				<div id="pwdDiv"></div>	
			</td>
		</tr>
		
		<tr>
			<th>재확인</th>
			<td>
				<input type="password" name="repwd" id="repwd" placeholder="비밀번호 입력" size="25"/>
				<div id="repwdDiv"></div>	
			</td>
		</tr>
		
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value="0"/>남자
				<input type="radio" name="gender" value="1"/>여자
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td >
				<input type="text" name="email1" value="<%=memberDTO.getEmail1() %>"/> @
				<input type="text" name="email2" id="email2" value="<%=memberDTO.getEmail2() %>"/>
				<input type="text" name="email3" id="email3" list="email3_list" oninput="change()"/>
				<datalist id="email3_list">
					<option value="직접입력">직접입력</option>
					<option value="naver.com"></option>
					<option value="gmail.com"></option>
					<option value="daum.net"></option>
				</datalist>						
			</td>
		</tr>
		
		<tr>
			<th>휴대전화</th>
			<td>
				<select name="tel1" style="width: 70px;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="019">019</option>
				</select>
				-
				<input type="text" name="tel2" value="<%=memberDTO.getTel2() %>" size="4" maxlength="4"/>
				-
				<input type="text" name="tel3" value="<%=memberDTO.getTel3() %>" size="4" maxlength="4"/>
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="zipcode" id="zipcode" value="<%=memberDTO.getZipcode() %>" placeholder="우편번호" size="6" readonly/>
				<input type="button" value="우편번호 검색" onclick="checkPost()"/><br>
				<input type="text" name="addr1" id="addr1" value="<%=memberDTO.getAddr1() %>" placeholder="주소" size="50" readonly/><br>
				<input type="text" name="addr2" id="addr2" value="<%=memberDTO.getAddr2() %>" placeholder="상세주소" size="50"/>
			</td>
		</tr>
		
		<tr >
			<td colspan="2" align="center">
				<input type="submit" value="회원정보수정" id="updateBtn"/>
				<input type="reset" value="다시입력" onclick="location.reload()"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/member.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.memberUpdateForm.gender['<%=memberDTO.getGender()%>'].checked = true; 
	document.memberUpdateForm.tel1.value = '<%=memberDTO.getTel1() %>';
}

</script>
</body>
</html>


