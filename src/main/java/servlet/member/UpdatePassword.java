package servlet.member;

import java.io.IOException;

import javax.management.loading.PrivateClassLoader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/updatePassword")
public class UpdatePassword extends HttpServlet{
	private MemberService service = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/updatepassword.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("newpw");
		
		System.out.println(id);
		System.out.println(pw);
		service.modifypw(id, pw);
		
		 String redirectURL = req.getContextPath()+"/signin";
	        resp.sendRedirect(redirectURL);
		
	}
	
}
