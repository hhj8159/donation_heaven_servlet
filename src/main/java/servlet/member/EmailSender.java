package servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import jakarta.mail.Session;
import service.MemberService;
import service.MemberServiceImpl;
import utils.MailSender;
import vo.Member;

@WebServlet("/sendemail/*")
public class EmailSender extends HttpServlet{
	MemberService service = new MemberServiceImpl();
    Session session = new MailSender().init();
    private Gson gson = new Gson(); 

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String email = req.getParameter("email");

        String uri = req.getRequestURI();
        uri = uri.replace(req.getContextPath() + "/sendemail/", "");
		System.out.println(email);
		
		   if (uri.startsWith("select")) {
				 String code = req.getParameter("code");
				 System.out.println(code);
           	try {
                   service.emailselect(email,code);
                   resp.getWriter().write("success");
               }catch(Exception e){
             	resp.getWriter().write("fail");
               }	
           }
		   
		   
		   
		   
		   if (uri.startsWith("send")) {
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
		   
		   
		   
		   
		   
		   if (uri.startsWith("delete")){
			   System.out.println(email);
		        try {
		            service.emaildelete(email);
		            resp.getWriter().write("success");
		        }catch(Exception e){
		      	e.printStackTrace();
		      	resp.getWriter().write("fail");
		        }
		   }
		   
		   
		   
		   
		   if (uri.startsWith("cfidsendemail")) {
				 String id = req.getParameter("id");
				 System.out.println("id");
           	try {
                   if(service.findById(id, email)) {
                	  String rndText = String.format("%08d", (int)(Math.random() * 100000000));
 		              
 		              service.emailinsert(email,rndText);
 		              MailSender.send(session, "DonationHaeven", "김용태 전용 이메일 인증번호  : " + rndText, email);
 		              resp.getWriter().write("success");
                   };
                   
               }catch(Exception e){
             	resp.getWriter().write("fail");
               }
           }
		   
		   
		   if (uri.startsWith("cfnamesendemail")) {
				 String name = req.getParameter("name");
           	try {

                   if(service.selectname(name, email) != null) {
                	  String rndText = String.format("%08d", (int)(Math.random() * 100000000));
 		              service.emailinsert(email,rndText);
 		              
 		              MailSender.send(session, "DonationHaeven", "김용태 전용 이메일 인증번호  : " + rndText, email);
 		              resp.getWriter().write("success");
                   };
                   
               }catch(Exception e){
             	resp.getWriter().write("fail");
               }
           }
		
       
        
	}
	
}
