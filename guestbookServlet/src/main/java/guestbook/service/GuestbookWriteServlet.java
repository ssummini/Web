package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

@WebServlet("/write")
public class GuestbookWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터
		request.setCharacterEncoding("UTF-8");
		//한글처리 - post 방식
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String homepage = request.getParameter("homepage");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
	
		GuestbookDTO guestbookDTO = new GuestbookDTO();
		guestbookDTO.setName(name);
		guestbookDTO.setEmail(email);
		guestbookDTO.setHomepage(homepage);
		guestbookDTO.setSubject(subject);
		guestbookDTO.setContent(content);

		//DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); //싱글톤
		guestbookDAO.guestbookWrite(guestbookDTO);
		
		//응답
		response.setContentType("text/html; charset=UTF-8");;
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h3>작성하신 글을 저장하였습니다.</h3>");
		out.println("<br><br>");
		out.println("<input type='button' value='뒤로' style='color: red' onclick='history.go(-1)'/>");
		out.println("<input type='button' value='글목록' style='color: red' onclick=\"location.href='/guestbookServlet/list?pg=1'\"/>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
