<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<style type="text/css">
body {
    background-color: #FFE2FA;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 70vh;
    flex-direction: column;
}

table {
    border-collapse: collapse;
    border-radius: 10px;
    background-color: white;
    width: 800px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 0 auto;
}

th, td {
    padding: 10px;
    border: 1px solid #CCC;
    text-align: center;
    font-size: 14px;
}

th {
    background-color: #F2F2F2;
    color: #333;
    font-size: 16px;
}

td {
    color: #333;
}

input[type="button"] {
    background-color: #FF9ADB;
    border: none;
    font-size: 14px;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
    color: white;
    transition: background-color 0.3s ease;
    margin: 10px;
}

input[type="button"]:hover {
    background-color: #FF70C0;
}

img {
    margin-bottom: 20px;
    cursor: pointer;
    display: block;
}
</style>
</head>
<body>
    <img src="../image/free-icon-love-4096198.png" alt="홈" width="60" height="60" onclick="location.href='../index.jsp'" />
    
    <table>
        <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
        
        </tbody>
    </table>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function () {
    $.ajax({
        type: 'get',
        url: '../board/boardList.jsp',
        dataType: 'json',
        success: function(data){
           console.log(data);
                $.each(data, function(index, item) {
                   console.log(data);
                   let row = 
                       '<tr>' +
                           '<td>' + item.seq + '</td>' +
                           '<td>' + item.subject + '</td>' +
                           '<td>' + item.name + '</td>' +
                           '<td>' + item.logtime + '</td>' +
                           '<td>' + item.hit + '</td>' +
                       '</tr>';
                   document.querySelector('tbody').insertAdjacentHTML('beforeend', row);
                });
        },
        error: function(e){
            console.log(e);
        }
    });
});
</script>
</body>
</html>
