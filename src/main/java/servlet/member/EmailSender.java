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

@WebServlet("/sendemail")
public class EmailSender extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceImpl();
        Session session = new MailSender().init();

		String email = req.getParameter("email");
		System.out.println(email);
        try {
        	  String rndText = String.format("%08d", (int)(Math.random() * 100000000));
              
              service.emailinsert(email,rndText);
              MailSender.send(session, "DonationHaeven", "김용태 전용 이메일 인증번호  : " + rndText, email);
              resp.getWriter().write("success");
        }catch(Exception e){
        	e.printStackTrace();
        	resp.getWriter().write("fail");
        }
        
	}
	
}
