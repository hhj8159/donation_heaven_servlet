package servlet.member;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/signup2")
public class Signup2 extends HttpServlet{
	private MemberService service = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/signup2.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		  req.setCharacterEncoding("utf-8");
		  HttpSession session = req.getSession();
		  String name = (String)session.getAttribute("name");
		  String birthday = (String)session.getAttribute("birthday");
		  String tel = (String)session.getAttribute("tel");
	        

	        String gender = req.getParameter("gender");
	        String email = req.getParameter("email");
	        String id = req.getParameter("id");
	        String pw = req.getParameter("pw");
	        String addr = req.getParameter("addr");
	        String detailAddr = req.getParameter("detailAddr");
	        int genderint =  Integer.parseInt(gender);
	        System.out.println(name +"/ "+  birthday +"/ "+  tel +"/ " + gender +"/ "+  email +"/ "+  id +"/ "+ pw + "/" + addr + "/"+detailAddr);
	        session.removeAttribute("name");
	        session.removeAttribute("birthday");
	        System.out.println(session.getAttribute(name));
	        Member member = Member.builder()
	        		.username(name)
	        		.tel(tel)
	        		 .gender(genderint)
	        		 .email(email)
	                .id(id)
	                .pw(pw)
	                .roadAddr(addr)
	                .detailAddr(detailAddr)
	                .build();
	        System.out.println(member);

	        service.register(member);
	        resp.sendRedirect(req.getContextPath()+"/signup");
	        
	}
	
}
