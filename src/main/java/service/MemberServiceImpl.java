package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.MemberMapper;
import utils.MybatisInit;
import vo.Member;
import vo.Post;

public class MemberServiceImpl implements MemberService{
	private static MemberService instance = new MemberServiceImpl();
	
	public static void main(String[] args) {

		Member member = instance.findBy();
	    System.out.println(member);
	}
	@Override
	public int register(Member member) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.insert(member);
		}
	}

	@Override
	public Member findBy() {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession()){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.selectOne();
		}
	}
	@Override
	public boolean login(String id, String pw) {
		Member m = findBy();
		return m != null && m.getPw().equals(pw);
	}
	
	@Override
	public boolean logout(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Member> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(Member member) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
