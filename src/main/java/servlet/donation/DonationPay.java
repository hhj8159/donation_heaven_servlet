package servlet.donation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DonationService;
import service.DonationServiceImpl;
import vo.Donation;

@WebServlet("/donationpay")
public class DonationPay extends HttpServlet{
	private DonationService donationService = new DonationServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
