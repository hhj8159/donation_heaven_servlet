package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import vo.Attach;
import vo.Like;
import vo.Post;

public interface LikeMapper {
	@Insert("insert into likes (id, pno) values (#{id}, #{pno})")
	int insertLike(@Param("id") String id, @Param("pno")Long pno);	
	
	@Select("select * from likes where id = #{id}")
	List<Like> selectList(Long pno);

	@Select("select * from likes where id = #{id} and pno = #{pno}")
	Like selectOne(@Param("id") String id, @Param("pno")Long pno);
	
	@Delete("delete from likes where pno = #{pno}")
	int delete(Long pno);
}