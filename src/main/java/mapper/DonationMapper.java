package mapper;

import vo.Donation;

public interface DonationMapper {
	public int insert(Donation donation);
	
	public Donation selectOne(Long dno);
}
