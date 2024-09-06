package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) {
		System.out.println("init...");
	}

	public void destroy() {
		System.out.println("destroy...");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet...");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); //웹
		out.println("<html>"); // 이 코드가 웹으로 나가게 된다.
		out.print("<body>");
		out.print("Hello Servlet !!<br/>");
		out.print("안녕하세요 서블릿 !!<br/>");
		out.println("</body>");
		out.println("</html>");
	}

}
