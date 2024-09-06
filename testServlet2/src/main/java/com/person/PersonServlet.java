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
		//넘어온 데이터 받기
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		//응답해서 화면에 출력
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println(name + "님의 나이는 " + age + "살이므로 ");
		if(age >= 19) 
			out.println("<font color='red'>성인</font>입니다.");
		else
			out.println("<font color='red'>청소년</font>입니다.");	
		out.println("<br><br>");
		out.println("""
				<input type='button' value='뒤로' onclick='history.go(-1)'>
				""");
		out.println("</body>");
		out.println("</html>");
	}

}
