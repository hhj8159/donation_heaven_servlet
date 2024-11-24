package servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.mail.Session;
import service.MemberService;
import service.MemberServiceImpl;
import utils.MailSender;

@WebServlet("/emaildelete")
public class EmailDelete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceImpl();
        Session session = new MailSender().init();
        
        String email = req.getParameter("email");
        System.out.println(email);

        try {
            service.emaildelete(email);
            resp.getWriter().write("success");
        }catch(Exception e){
      	e.printStackTrace();
      	resp.getWriter().write("fail");
        }	
	}
	
}
