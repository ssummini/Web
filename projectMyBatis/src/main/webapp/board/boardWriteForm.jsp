<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
<style type="text/css">
body {
    background-color: #FFE2FA;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80vh;
    flex-direction: column;
}

table {
    border-collapse: collapse;
    border-radius: 10px;
    background-color: white;
    width: 700px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 0 auto;
}

th, td {
    padding: 10px 15px;
    text-align: left;
    font-size: 14px;
}

th {
    color: #333;
    font-size: 16px;
}

td {
    color: #333;
}

div {
    color: red;
    font-size: 8pt;
    font-weight: bold;
    margin-top: 5px;
}

input[type="text"], textarea {
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #CCC;
    border-radius: 5px;
    box-sizing: border-box;
    width: 100%;
    font-size: 14px;
}

textarea {
    resize: none;
}

input[type="button"], input[type="submit"], input[type="reset"] {
    background-color: #FF9ADB;
    border: none;
    font-size: 14px;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
    color: white;
    transition: background-color 0.3s ease;
    margin: 5px;
}

input[type="button"]:hover, input[type="submit"]:hover, input[type="reset"]:hover {
    background-color: #FF70C0;
}

img {
    margin-bottom: 20px;
    cursor: pointer;
    display: block;
}

table td[colspan="2"] {
    text-align: center;
}
</style>
</head>
<body>
   <img src="../image/free-icon-love-4096198.png" alt="홈" width="60" height="60" onclick="location.href='../index.jsp'" />
   <form id="boardWriteForm" method="post">
      <table border="1">   
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
               <textarea name="content" id="content" cols="65" rows="15" placeholder="내용을 입력하세요"></textarea>
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
