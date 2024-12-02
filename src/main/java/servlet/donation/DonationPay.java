package servlet.donation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

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

      HttpSession session = req.getSession();
      Member member = (Member) session.getAttribute("member");

      System.out.println(session.getAttribute("member"));
      req.getRequestDispatcher("/WEB-INF/jsp/donation/donationpay.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		String uri = req.getRequestURI();
        uri = uri.replace(req.getContextPath() + "/donationpay/", "");
		
        System.out.println(uri.startsWith("pay"));
        if (uri.startsWith("pay")) {
			
			
			Donation donation = gson.fromJson(req.getReader(), Donation.class);
			
			
			System.out.println(donation);

			
			donationService.donationPay(donation);
			
			
			Map<String, Object> responseMap = new HashMap<>();
	        responseMap.put("status", "success");
	        responseMap.put("cardName", donation.getCardName());
	        responseMap.put("dcno", donation.getDcno());
	        responseMap.put("name", donation.getName());
	        responseMap.put("price", donation.getPrice());
	        responseMap.put("regdate", donation.getRegdate());
	        responseMap.put("buyerAddr", donation.getBuyerAddr());
	        
	        
	        resp.setContentType("application/json; charset=utf-8");
	        resp.getWriter().print(gson.toJson(responseMap));

			
			
        }

        
        

	}
	
}
