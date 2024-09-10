<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.bean.BoardPaging"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page import="java.util.List" %>
<%
	int pg = Integer.parseInt(request.getParameter("pg"));

	//1페이지당 5개씩
	int endNum = pg * 5;
	int startNum = endNum - 4;

	//DB
    BoardDAO boardDAO = BoardDAO.getInstance();
    List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
    
    //페이징 처리
    int totalA = boardDAO.getTotalA();
    
    BoardPaging boardPaging = new BoardPaging();
    boardPaging.setCurrentPage(pg);
    boardPaging.setPageBlock(3);
    boardPaging.setPageSize(5);
    boardPaging.setTotalA(totalA);
    
    boardPaging.makePagingHTML();
%>
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

#currentPaging {
	color: red;
	font-size: 15px;
	padding: 5px 8px;
	margin: 3px;
}

#paging {
	color: black;
	font-size: 15px;
	padding: 5px 8px;
	margin: 3px;	
}

span:hover {
	text-decoration: underline;
	cursor: pointer;
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
        	<% if(list != null) { %>
        		<% for(BoardDTO boardDTO : list) { %>
        		 <tr> 
                     <td><%=boardDTO.getSeq() %></td>
                     <td><%=boardDTO.getSubject() %></td>
                     <td><%=boardDTO.getName() %></td>
                     <td><%=boardDTO.getLogtime() %></td>
                     <td><%=boardDTO.getHit() %></td>
                 </tr>
                 <%} %>
        	  <%} %>	 	
        </tbody>
    </table>
	<div style="margin-top: 15px;">
		<%=boardPaging.getPagingHTML() %>
	</div>

<script type="text/javascript">
function boardPaging(pg){
	location.href = "boardList2.jsp?pg=" + pg;
}
</script>
</body>
</html>