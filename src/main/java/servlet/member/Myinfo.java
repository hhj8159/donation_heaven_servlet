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

@WebServlet("/myinfo/*")
public class Myinfo extends HttpServlet{
	private MemberService service = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/myinfo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        
        String uri = req.getRequestURI();
        uri = uri.replace(req.getContextPath() + "/myinfo/", "");
		 if (uri.startsWith("updatejuso")) {
			 String road_addr = req.getParameter("roadAddr");
			 String detail_Addr = req.getParameter("detailAddr");
			 HttpSession session = req.getSession();
		      Member member = (Member) session.getAttribute("member");
		      try {

      			
              if(service.modifyjuso(road_addr, detail_Addr, member.getId())) {
        		
            	  System.out.println(member.getId());
            	  
                  Member memberbuilder = Member.builder()
                		  .name(member.getName())
                  		.tel(member.getTel())
                  		.birthday(member.getBirthday())
                  		 .gender(member.getGender())
                  		 .email(member.getEmail())
                          .id(member.getId())
                          .pw(member.getPw())
                          .roadAddr(road_addr)
                          .detailAddr(detail_Addr)
                          .build();
                  System.out.println(memberbuilder);
  	        	session.setAttribute("member", service.findBy(member.getId()));
                  resp.getWriter().write("success");
              };
              
          }catch(Exception e){
        	 e.printStackTrace();

        	resp.getWriter().write("fail");
          }
      	return;
        }
	}
	
	
	
}
