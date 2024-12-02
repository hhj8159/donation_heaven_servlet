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

@WebServlet("/leavemember")
public class LeaveMember extends HttpServlet{
	MemberService service = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      HttpSession session = req.getSession();
	      Member member = (Member) session.getAttribute("member");
	      System.out.println(member.getId());
	      System.out.println(member.getEmail());
	      
	     
	      
	      if(service.donehistory(member.getMno()) != null) {
	    	  service.modifynull(member.getMno()); 
	      }
		 if(service.memberHistory(member.getId(),member.getEmail()) == 1) {
			req.getSession().invalidate();
			 System.out.println(service.deletemember(member.getId())); 
			 String redirectURL = req.getContextPath()+"/index";
			 resp.sendRedirect(redirectURL);
		 }
	}
	
	
}
