package servlet.member;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import at.favre.lib.crypto.bcrypt.BCrypt;
import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/signin")
public class Signin extends HttpServlet{
	private MemberService service = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/jsp/member/signin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        
        String uri = req.getRequestURI();
        uri = uri.replace(req.getContextPath() + "/signin/", "");
		
  
			try {
				
				  String id =  req.getParameter("id");
			        String pw = req.getParameter("pw");
			        String save = null;
			        
			        Member member = service.findBy(id); // 회원 정보 가져오기

			        if (member == null) {
			            // 회원 정보가 없는 경우
			            resp.getWriter().write("noresult");
			            return; // 메서드 종료
			        }
			        
			        if(service.login(id, pw)) {
			        	
			        	
			            save = req.getParameter("remember_id");
			    		Cookie cookie = new Cookie("save", id);
			        	//로그인 성공
			        	if("yes".equals(save)) {
			        		
			        		cookie.setMaxAge(60*60*24);
			        		resp.addCookie(cookie);
			        		System.out.println(save);
			        	}else {
			        		//아이디 기억안할때 처리할 일
			        		Cookie[] cookies = req.getCookies();
			        		for(Cookie c : cookies) {
			        			if(c.getName().equals("remember-id")) {
			        				c.setMaxAge(0);
			        				break;
			        			}
			        		}
			        	}
			        	//세션 생성
			        	HttpSession session = req.getSession();
			        	session.setAttribute("member", service.findBy(id));
			        	
			
				     }else {
				        resp.getWriter().write("failed");
				     }
				
				
				
			}catch(Exception e){
		      	 e.printStackTrace();
		      	resp.getWriter().write("fail");
		      }
			

     	
     	return;
       }
}

		
	      
	        
	

