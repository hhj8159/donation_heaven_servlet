package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.Donation;
import vo.Member;

public interface MemberMapper {
	 public int insert(Member member);
	 
	 public Member selectOne(String id);
	 
	 public boolean selectid(@Param("id")String id,@Param("email")String email);
	 
	 public Member selectname(@Param("name")String name,@Param("email") String email);
	 
	 public int emailinsert(@Param("email") String email,@Param("code")String code);
	 
	 public int emailselect(@Param("email") String email,@Param("code")String code);
	 
	 public int emaildelete(@Param("email") String email);
	 
	 public int updatepw(@Param("id")String id,@Param("pw") String pw);
	 
	 public int userEmailSelect(@Param("id")String id,@Param("email") String email);
	 
	 public List<Donation> selectdone(int mno);
	 
	 public boolean leavemember(String id);
	 
	 public boolean idCheck(String id,String email);
	 
	 public int memberHistory(@Param("id")String id,@Param("email")String email);

}
