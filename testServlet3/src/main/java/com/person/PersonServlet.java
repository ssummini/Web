package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 받기
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String color = request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		
		//응답
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<ul style='color: " + color + ";'>");
		out.println("<li>");
		out.println("이름 : " + name);		
		out.println("</li>");	
		out.println("<li>");
		out.println("성별 : " + gender);	
		out.println("</li>");	
		out.println("<li>");
		out.println("색깔 : " + color);	
		out.println("</li>");	
		out.println("<li>");
		out.print("취미 : ");
		if(hobby != null) {
			for(int i=0; i<hobby.length; i++) {
				out.println(hobby[i]);	
			}
		}else {
			out.println("선택한 취미가 없습니다.");
		}
		out.println("</li>");
		out.println("<li>");
		out.print("과목 : ");
		for(int i=0; i<subject.length; i++) {
			out.println(subject[i]);	
		}
		for(String data : subject) {
			out.println(data);	
		}
		out.println("</li>");	
		out.println("</ul>");		
		out.println("</body>");
		out.println("</html>");
	}

}