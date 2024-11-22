package servlet.member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

@WebServlet("/signup")
public class Signup extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
		String name =    req.getParameter("name");
        String birthday = req.getParameter("birthday");
        String tel = req.getParameter("tel");
        String oknum = req.getParameter("oknum");
        
        HttpSession session = req.getSession();
        session.setAttribute("name", name);
        session.setAttribute("birthday", birthday);
        session.setAttribute("tel", tel);


        
        System.out.println(name +"/ "+  birthday +"/ "+  tel +"/ "+ oknum );
        resp.sendRedirect(req.getContextPath()+"/signup2");
	       
	}
	
}
