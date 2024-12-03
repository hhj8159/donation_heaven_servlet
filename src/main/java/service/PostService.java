package service;

import java.util.List;

import dto.Criteria;
import vo.Attach;
import vo.Post;


public interface PostService {
	
	int write(Post post);
	
	int modify(Post post);
	
	int remove(Long pno);

	Post findBy(Long pno);
	
	List<Attach> attachList(Long pno);

	Post view(Long pno);
	
	List<Post> list(Criteria cri);
	
	int count(Criteria cri);
	
	int like(String id, Long pno);
	
	int download(String uuid);
	
	int replyCount(Long pno);

}
