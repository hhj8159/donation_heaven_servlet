package service;

import vo.Donation;

public interface DonationService {
	
	// 도네이션 신청
//	int donationApp(Donation donation);
	
	// 도네이션 결제
	int donationPay(Donation donation);
	
	Donation findBy(Long dno);
	
}
