package servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/donehistory")
public class DoneHistory extends HttpServlet{
	private MemberService service = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  HttpSession session = req.getSession();
	      Member member = (Member) session.getAttribute("member");
		req.setAttribute("done", service.donehistory(member.getMno()));
		req.getRequestDispatcher("/WEB-INF/jsp/member/doneHistory.jsp").forward(req, resp);
	}
	
}
