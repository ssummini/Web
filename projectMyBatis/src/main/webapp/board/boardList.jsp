<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page import="java.util.List" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@page import="java.text.SimpleDateFormat"%>

<%
	int pg = Integer.parseInt(request.getParameter("pg"));

	//1페이지당 5개씩
	int endNum = pg * 5;
	int startNum = endNum - 4;

    BoardDAO boardDAO = BoardDAO.getInstance();
    List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
    
    // JSON 배열 생성
    JSONArray jsonArray = new JSONArray();
    
    // 날짜 포맷팅
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    
    for (BoardDTO boardDTO : list) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("seq", boardDTO.getSeq());
        jsonObject.put("subject", boardDTO.getSubject());
        jsonObject.put("name", boardDTO.getName());
        
        // 날짜 포맷팅
        String logtime = sdf.format(boardDTO.getLogtime());
        jsonObject.put("logtime", logtime);
        jsonObject.put("hit", boardDTO.getHit());

        // JSON 배열에 추가
        jsonArray.put(jsonObject);
    }
    
 	// JSON 배열을 문자열로 변환
    String json = jsonArray.toString();
 	System.out.println(json);
%>

<%= json %>

