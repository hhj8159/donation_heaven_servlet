package service;

import org.apache.ibatis.session.SqlSession;

import mapper.DonationMapper;
import mapper.MemberMapper;
import utils.MybatisInit;
import vo.Donation;

public class DonationServiceImpl implements DonationService{

	@Override
	public int donationPay(Donation donation) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			DonationMapper mapper = session.getMapper(DonationMapper.class);
			return mapper.insert(donation);
		}
	}

	@Override
	public Donation findBy(Long dno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			DonationMapper mapper = session.getMapper(DonationMapper.class);
			return mapper.selectOne(dno);
		}
	}
	
	
	
}
