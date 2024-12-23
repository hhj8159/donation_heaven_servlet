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

import at.favre.lib.crypto.bcrypt.BCrypt;
import service.MemberService;
import service.MemberServiceImpl;
import utils.MailSender;
import vo.Member;

@WebServlet("/signup/*")
public class Signup extends HttpServlet{
	private MemberService service = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        
        String uri = req.getRequestURI();
        uri = uri.replace(req.getContextPath() + "/signup/", "");
        
        
        if (uri.startsWith("dupliid")) {
			 String id = req.getParameter("id");
			 String email = req.getParameter("email");
      	try {
      			
              if(service.findBy(id) == null) {
            	  if(service.idCheck(id, email) == null) {
    	              resp.getWriter().write("success");
            	  }else {
                	  resp.getWriter().write("duplie");
            	  }

              };
              
          }catch(Exception e){
        	 e.printStackTrace();
        	resp.getWriter().write("fail");
          }
      	return;
        }
        
        
		String name =    req.getParameter("name");
        String birthday = req.getParameter("birthday");
        String tel = req.getParameter("tel");
        String oknum = req.getParameter("oknum");

        String gender = req.getParameter("gender");
        int genderint =  Integer.parseInt(gender);
        String email = req.getParameter("email");
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");
		String pwcrypt = BCrypt.withDefaults().hashToString(8, pw.toCharArray());
        String addr = req.getParameter("roadAddrPart1");
        String detailAddr = req.getParameter("addrDetail");
        System.out.println(name +"/ "+  birthday +"/ "+  tel +"/ " + gender +"/ "+  email +"/ "+  id +"/ "+ pw + "/" + addr + "/"+detailAddr);
        
//        HttpSession session = req.getSession();
//        session.setAttribute("name", name);
//        session.setAttribute("birthday", birthday);
//        session.setAttribute("tel", tel);


        
        System.out.println(name +"/ "+  birthday +"/ "+  tel +"/ "+ oknum );
        Member member = Member.builder()
        		.name(name)
        		.tel(tel)
        		.birthday(birthday)
        		 .gender(genderint)
        		 .email(email)
                .id(id)
                .pw(pwcrypt)
                .roadAddr(addr)
                .detailAddr(detailAddr)
                .build();
        System.out.println(member);

        service.register(member);
        resp.sendRedirect(req.getContextPath()+"/sucessSignup");

	    
	}
	
}
