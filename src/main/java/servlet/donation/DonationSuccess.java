package servlet.donation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.DonationService;
import service.DonationServiceImpl;
import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/donationsuccess")
public class DonationSuccess extends HttpServlet{
	private DonationService donationService = new DonationServiceImpl();
	private MemberService service = new MemberServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

    	
    	
		String cardName = req.getParameter("cardName"); 
		String dcno = req.getParameter("dcno"); 
		String name = req.getParameter("name"); 
		String price = req.getParameter("price"); 
		String buyerAddr = req.getParameter("buyerAddr"); 
		String regdate = req.getParameter("regdate");
		String id = req.getParameter("usi");
		
    	//세션 생성
    	HttpSession session = req.getSession();
    	session.setAttribute("member", service.findBy(id));
		
		
		req.setAttribute("cardName", cardName);
		req.setAttribute("dcno", dcno);
		req.setAttribute("name", name);
		req.setAttribute("price", price);
		req.setAttribute("regdate", regdate);
		req.setAttribute("buyerAddr", buyerAddr);
		
		req.getRequestDispatcher("/WEB-INF/jsp/donation/donationsuccess.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
