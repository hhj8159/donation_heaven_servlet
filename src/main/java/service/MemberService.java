package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.Donation;
import vo.Member;

public interface MemberService {
	//회원 가입
	int register(Member member);
	
	//회원 단일조회
	Member findBy(String id);
	//로그인
	boolean login(String id,String pw);
	//회원 전제초회
	List<Member> list();
	
	//회원 삭제,탈퇴
	boolean remove(String id);
	
	//회원정보수정
	boolean modify(Member member);
	//회원 로그아웃
	boolean logout(String id);
	
	void emailinsert(@Param("email") String email,@Param("code")String code);
	
	void emailselect(@Param("email") String email,@Param("code")String code);
	
	void emaildelete(@Param("email") String email);
	
	int modifypw(String id,String pw);
	

	Member selectname(String name,String email);
	boolean findById(String id, String email);
	
	List<Donation> donehistory(int mno);
	
	boolean deletemember(String id);
	
	boolean idCheck(String id ,String email);
	
	int memberHistory(String id,String email);
}
