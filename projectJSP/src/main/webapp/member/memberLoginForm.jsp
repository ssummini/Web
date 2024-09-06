<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 700x;
	margin: auto;
}

th {
	padding: 7px 15px;
}

td {
	padding: 7px 10px;	
}

div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}

input[type="button"], input[type="submit"] {
	background-color: #E0E0E0; 
	border: 1px solid;
	text-align: center; 
	font-size: 14px; 
	margin: 4px 2px; 
	padding: 4px 5px;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #BFBFBF;
}
</style>
</head>
<body>
<img src="../image/free-icon-love-4096198.png" alt="홈" width="60" height="60" onclick="location.href='../index.jsp'" style="cursor: pointer; display: block; margin: 0 auto;" />
	<form id="loginForm">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" id="id" placeholder="아이디 입력" />
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력" />
					<div id="pwdDiv"></div>
				</td>
			</tr>
			
			<tr>
			    <td colspan="2" align="center">
			        <input type="submit" value="로그인" id="loginBtn"/>
			        <input type="button" value="회원가입" onclick="location.href='MemberWriteForm.jsp'" />
			    </td>
			</tr>
		</table>
		쿠키 = <span></span>
	</form>	
<script src="../js/member.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$('#loginBtn').click(function(event) {
    event.preventDefault(); // 기본 제출 동작 방지
    
    $('#idDiv').empty();
    $('#pwdDiv').empty();
    
    if ($('#id').val() == '') {
        $('#idDiv').html('아이디를 입력하세요.');
    } else if ($('#pwd').val() == '') {
        $('#pwdDiv').html('비밀번호를 입력하세요.');
    } else {
        $.ajax({
            type: 'POST',
            url: 'memberLogin.jsp',
            data: {
                'id': $('#id').val(),
                'pwd': $('#pwd').val()
            },
            dataType: 'text', // 서버로부터 순수한 텍스트만 받음
            success: function(data) {
            	console.log(data);
                if (data.trim() === 'fail') {
                    alert("아이디 또는 비밀번호가 틀렸습니다.");
                } else {
                    alert(data.trim() + "님이 로그인하였습니다.");                    
                    location.href = '../index.jsp'
                }
            },
            error: function(e) {
                console.log(e);
            }
        });
    }
});

</script>

</body>
</html>