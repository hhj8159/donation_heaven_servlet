package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Result;
import mapper.MemberMapper;
import utils.MybatisInit;
import vo.Donation;
import vo.Member;
import vo.Post;

public class MemberServiceImpl implements MemberService{
	private static MemberService instance = new MemberServiceImpl();

	@Override
	public int register(Member member) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.insert(member);
		}
	}

	@Override
	public Member findBy(String id) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession()){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.selectOne(id);
		}
	}
	@Override
	public boolean findById(String id,String email) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession()){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.selectid(id, email);
		}
	}
	@Override
	public boolean login(String id, String pw) {
		Member m = findBy(id);
		String pwd = m.getPw();
		Result result = BCrypt.verifyer().verify(pw.toCharArray(),pwd);

//			return m != null && m.getPw().equals(pw);
		
		return result.verified;
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
	@Override
	public void emailinsert(String email,String code) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.emailinsert(email,code);
		}
	}
	@Override
	public void emailselect(String email, String code) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.emailselect(email,code);
		}
	}
	@Override
	public void emaildelete(String email) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.emaildelete(email);
		}
	}
	@Override
	public int modifypw(String id, String pw) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.updatepw(id, pw);
		}
	}
	@Override
	public Member selectname(String name, String email) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			

			Member member = mapper.selectname(name, email);

			return member;
					
		}
	}
	
	
	
	
	@Override
	public List<Donation> donehistory(int mno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			
			List<Donation> done = mapper.selectdone(mno);
			return done;	
		}
	}
	
	
	

	@Override
	public boolean deletemember(String id) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			
			return mapper.leavemember(id);
		}
	}

	@Override
	public boolean idCheck(String id, String email) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			
			return mapper.idCheck(id, email);
		}
	}
	
	

	@Override
	public int memberHistory(String id, String email) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			
			return mapper.memberHistory(id, email);
		}
	}

	public static void main(String[] args) {
		Member member = instance.selectname("김용태","dydxo4423");
		System.out.println(member);
	}
	
}

