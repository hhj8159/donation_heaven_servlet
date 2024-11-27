package service;

import java.util.List;

import vo.Like;


// 나중에 필요하면 사용....????


public interface LikeService {
	
	int like(String id, Long pno);
	
	int dislike(String id, Long pno);
	
	Like findBy(String id, Long pno);
	
	List<Like> list(String id);

}
