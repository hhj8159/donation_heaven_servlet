package servlet.donation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.DonationService;
import service.DonationServiceImpl;
import utils.Commons;
import utils.MailSender;
import vo.Donation;
import vo.Member;

@WebServlet("/donationpay/*")
public class DonationPay extends HttpServlet{
	private DonationService donationService = new DonationServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	System.out.println("111111");
      HttpSession session = req.getSession();
      Member member = (Member) session.getAttribute("member");

      System.out.println(session.getAttribute("member"));
      req.getRequestDispatcher("/WEB-INF/jsp/donation/donationpay.jsp").forward(req, resp);
      System.out.println("2222222");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		String uri = req.getRequestURI();
        uri = uri.replace(req.getContextPath() + "/donationpay/", "");
		if (uri.startsWith("pay")) {
			
			System.out.println("33333");
			
			Donation donation = gson.fromJson(req.getReader(), Donation.class);
			System.out.println(donation);
//			resp.setContentType("application/json; charset=utf-8");
//			resp.getWriter().print(GSON.toJson(responseMap));
			System.out.println(donation);
			System.out.println("4444444");
			donationService.donationPay(donation);	
      }
		
        
        

	}
	
}
