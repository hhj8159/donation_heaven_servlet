package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Result;
import mapper.MemberMapper;
import utils.MybatisInit;
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
		System.out.println(pwd);
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
			
			System.out.println(mapper.selectname(name, email));
			Member member = mapper.selectname(name, email);
			System.out.println(member + "dddd");
			return member;
					
		}
	}
	
	
	public static void main(String[] args) {
		Member member = instance.selectname("김용태","dydxo4423");
		System.out.println(member);
	}
	
}

