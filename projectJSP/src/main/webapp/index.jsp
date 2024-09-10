<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<style type="text/css">
body {
	background-color: #FFE2FA;
    margin: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h2 {
    margin-top: 50px;
}

.nav-bar {
    margin-top: 20px;
    padding: 10px 20px;
}

.nav-bar h3 {
    display: inline-block;
    margin: 0 10px;
}

.nav-bar h3 a {
    text-decoration: none;
    font-size: 16px;
    padding: 8px 12px;
    color: black;
}

.nav-bar h3 a:hover {
    color: gray;
}
</style>
</head>
<body>
    <h2>메인화면</h2>
    <div class="nav-bar">
    <% if(session.getAttribute("memId") == null){ %>   
        <h3><a href="./member/memberWriteForm.jsp">회원가입</a></h3>
        <h3><a href="./member/memberLoginForm.jsp">로그인</a></h3>
    <% } else { %>
        <h3><a href="./member/memberLogout.jsp">로그아웃</a></h3>
        <h3><a href="./member/memberUpdateForm.jsp">회원정보수정</a></h3>
        <h3><a href="./board/boardWriteForm.jsp">글쓰기</a></h3>
    <% } %>
        <h3><a href="./board/boardList2.jsp?pg=1">목록</a></h3>
    </div>
</body>
</html>
