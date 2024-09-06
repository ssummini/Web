<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="java.util.Map"%>

<%
	//데이터
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    //DB
    MemberDAO memberDAO = MemberDAO.getInstance();
    Map<String, String> userInfo = memberDAO.memberLogin(id, pwd);

    if (userInfo.isEmpty()) {
    	//페이지 이동
    	response.sendRedirect("loginFail.jsp");
    } else {
     	//중요한 데이터를 주소표시줄에 실어서 보내지 말자
    	//response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name, "UTF-8") + "&id=" + id);

        // 쿠키 설정
        /*
        Cookie cookie = new Cookie("memName", name);//쿠키 생성
        cookie.setMaxAge(30 * 60); //초 단위 - 30분
        response.addCookie(cookie);//클라이언트에 저장

        Cookie cookie2 = new Cookie("memId", id);//쿠키 생성
        cookie2.setMaxAge(30 * 60); //초 단위 - 30분
        response.addCookie(cookie2);//클라이언트에 저장
		*/
		
		//세션
		//HttpSession session = request.getSession(); //세션 생성
		
		String name = userInfo.get("name");
        String email1 = userInfo.get("email1");
        String email2 = userInfo.get("email2");

        
    	System.out.println(name);
        System.out.println(id);
     	// 세션에 저장
        session.setAttribute("memName", name);
        session.setAttribute("memId", id);
        session.setAttribute("memEmail", email1 + "@" + email2);

        response.sendRedirect("loginOk.jsp");
    }
%>
