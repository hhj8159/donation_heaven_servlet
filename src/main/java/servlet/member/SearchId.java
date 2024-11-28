package servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import service.MemberService;
import service.MemberServiceImpl;
import utils.MailSender;
import vo.Member;
import vo.Reply;
@WebServlet("/searchid/*")
public class SearchId extends HttpServlet{
	MemberService service = new MemberServiceImpl();
	private Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd").create();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/searchId.jsp").forward(req, resp);

	}
	
	
			

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		String uri = req.getRequestURI();
        uri = uri.replace(req.getContextPath() + "/searchid/", "");
        if (uri.startsWith("searchid")) {
    	Object ret = null;
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		System.out.println(name + ":::name1");
		System.out.println(email + ":::email1");
	    service.selectname(name, email);
        ret = service.selectname(name, email);
         
           resp.setContentType("application/json; charset=utf-8");
	       resp.getWriter().print(gson.toJson(ret));
	       return;
		}
        resp.sendRedirect(req.getContextPath()+"/signin");
	}
	
}
