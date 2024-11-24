package mapper;

import org.apache.ibatis.annotations.Param;

import vo.Member;

public interface MemberMapper {
	 public int insert(Member member);
	 
	 public Member selectOne(String id);
	 
	 public int emailinsert(@Param("email") String email,@Param("code")String code);
	 
	 public int emailselect(@Param("email") String email,@Param("code")String code);
	 
	 public int emaildelete(@Param("email") String email);
}
