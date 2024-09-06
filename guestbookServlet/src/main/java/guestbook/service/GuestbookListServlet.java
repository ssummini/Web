package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

@WebServlet("/list")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터
		int pg =Integer.parseInt(request.getParameter("pg"));
		
		//1페이지당 3개씩
		int endNum = pg * 3;
		int startNum = endNum - 2;
		
		// DB에서 데이터 가져오기
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); // 싱글톤
		List<GuestbookDTO> list = guestbookDAO.guestbookList(startNum, endNum); //부모 = 자식
		
		int totalA = guestbookDAO.getTotal(); //총글수
		int totalP = (totalA + 2) / 3;
		//System.out.println(totalA + ", " + totalP);
		
		//응답
		response.setContentType("text/html; charset=UTF-8");;
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<style>");
		out.println("#pagingContainer { text-align: center; margin-top: 20px; }");
		
		out.println("hr { width: 610px; align: left; color: red; margin: 20px auto; }");
		
		out.println("#currentPaging {  text-align: center; color: red; text-decoration: underline;}");
		out.println("#paging { color: black; text-decoration: none; }");
		out.println("</style>");
		out.println("<body>");
		
		if(list != null) {
			out.println("<div id='pagingContainer'>");
			for(int i=1; i<totalP; i++) {
				if(i == pg)
					out.println("[ <a id='currentPaging' href='/guestbookServlet/list?pg=" + i + "'>" + i + "</a> ]");
				else
					out.println("[ <a id='paging' href='/guestbookServlet/list?pg=" + i + "'>" + i + "</a> ]");
			}
			out.println("</div>");
			
			for(GuestbookDTO guestbookDTO : list) {
				out.println("<table border='1' style='border-collapse: collapse; margin: 20px auto;'>");
				out.println("<tr>");				
				out.println("<th width='100'>작성자</th>");				
				out.println("<td width='150' align='center'>" + guestbookDTO.getName() + "</td>");				
				out.println("<th width='100'>작성일</th>");				
				out.println("<td width='250' align='center'>" + guestbookDTO.getLogtime() + "</td>");			
				out.println("</tr>");
				
				out.println("<tr>");	
				out.println("<th>이메일</th>");	
				out.println("<td colspan='3'>" + guestbookDTO.getEmail() + "</td>");	
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<th>홈페이지</th>");	
				out.println("<td colspan='3'>" + guestbookDTO.getHomepage() + "</td>");
				out.println("</tr>");
				
				out.println("<tr>");	
				out.println("<th>제목</th>");	
				out.println("<td colspan='3'>" + guestbookDTO.getSubject() + "</td>");	
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td colspan='4' style='white-space: pre-wrap; word-wrap: break-word;'>" + guestbookDTO.getContent() + "</td>");

				out.println("</tr>");
				out.println("</table>");
				out.println("<hr color=red />");
			}
		}
		out.println("</body>");
		out.println("</html>");
	}
}
