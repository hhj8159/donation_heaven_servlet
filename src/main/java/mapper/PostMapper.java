package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import dto.Criteria;
import vo.Post;

public interface PostMapper {
	int insert(Post post);
	
	Post selectOne(Long pno);
	
	int getCount(Criteria cri);
	
	List<Post> selectList(Criteria cri);
	
	int update(Post post);
	
	int increaseViewCount(Long pno);
	
	int delete(Long pno);

	int increaseLikes(Long pno);
	
	int getReplyCount(Long pno);
    
	
}
