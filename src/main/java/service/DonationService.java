package service;

import vo.Donation;

public interface DonationService {
	
	int donationPay(Donation donation);
	
	Donation findBy(Long dno);
	
}
