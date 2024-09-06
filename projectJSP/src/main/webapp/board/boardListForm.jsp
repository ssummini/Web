<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<style type="text/css">
    table {
        border-collapse: collapse;
        width: 800px;
        margin: auto;
    }

    th, td {
        padding: 10px;
        border: 1px solid black;
        text-align: center;
    }

    th {
        background-color: #F2F2F2;
    }

    a {
        text-decoration: none;
        color: black;
    }

    a:hover {
        text-decoration: underline;
        color: blue;
    }

    input[type="button"] {
        background-color: #E0E0E0; 
        border: 1px solid;
        text-align: center; 
        font-size: 14px; 
        margin: 4px 2px; 
        padding: 4px 5px;
    }

    input[type="button"]:hover {
        background-color: #BFBFBF;
    }
</style>
</head>
<body>
    <img src="../image/free-icon-love-4096198.png" alt="홈" width="60" height="60" onclick="location.href='../index.jsp'" style="cursor: pointer; display: block; margin: 20px auto;" />
    
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
                	var row = 
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
