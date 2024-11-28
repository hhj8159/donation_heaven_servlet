package servlet.donation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.DonationService;
import service.DonationServiceImpl;
import utils.Commons;
import vo.Donation;
import vo.Member;

@WebServlet("/donationpay")
public class DonationPay extends HttpServlet{
	private DonationService donationService = new DonationServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
      HttpSession session = req.getSession();
      Member member = (Member) session.getAttribute("member");
//      System.out.println(member);
//      if(member == null) {
//    	  Commons.printMsg("로그인 후 시도해주세요", "signin", resp);
//    	  return;
//      };
      System.out.println(session.getAttribute("member"));
      req.getRequestDispatcher("/WEB-INF/jsp/donation/donationpay.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dcno = req.getParameter("dcno");
        int dcnum = Integer.parseInt(dcno);
        String dtno = req.getParameter("dtno");
        int dtnum = Integer.parseInt(dtno);
        String price = req.getParameter("price");
        Long priceLong = Long.parseLong(price);
        
        String roadAddr = req.getParameter("roadAddrPart1");
        String detailAddr = req.getParameter("addrDetail");
        
        String payType = req.getParameter("payType");
        
        donationService.donationPay(Donation.builder().dcno(dcnum).dtno(dtnum).price(priceLong).roadAddr(roadAddr).detailAddr(detailAddr).paytype(payType).build());
        
	}
	
}
