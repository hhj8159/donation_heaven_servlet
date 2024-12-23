package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import mapper.AttachMapper;
import mapper.LikeMapper;
import mapper.PostMapper;
import mapper.ReplyMapper;
import utils.MybatisInit;
import vo.Attach;
import vo.Post;

public class PostServiceImpl implements PostService{

	public static void main(String[] args) {
		new PostServiceImpl().write(Post.builder().title("제목").content("abcd").id("mekwon").cno(2).build());
	}
	
	@Override
	public int write(Post post) { 
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			//System.out.println(post); 
			mapper.insert(post);
			///System.out.println(post);
			post.getAttachs().forEach(a -> {
				a.setPno(post.getPno());
				attachMapper.insert(a);
			});
			return 0;
		}
	}
	
	@Override
	public int modify(Post post) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			
			//attachMapper.delete(post.getPno());
			
			post.getAttachs().forEach(a -> {
				a.setPno(post.getPno());
				attachMapper.insert(a);
			});
			
			return mapper.update(post);
		}
	}
	
	@Override
	public int remove(Long pno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			//첨부파일도
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			ReplyMapper replyMapper = session.getMapper(ReplyMapper.class);
			LikeMapper likemapper = session.getMapper(LikeMapper.class);
			replyMapper.deleteAll(pno);
			attachMapper.delete(pno);
			likemapper.delete(pno);
			return mapper.delete(pno);
		}
	}

	@Override
	public Post findBy(Long pno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			Post post = mapper.selectOne(pno);
			post.setAttachs(attachMapper.selectList(pno));
			return post;
		}
	}
	
	@Override
	public List<Attach> attachList(Long pno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			return attachMapper.selectList(pno);
		}
	}

	
	@Override
	public Post view(Long pno) { //부하가 심한 코드임 -> 나중엔 테이블이 아니라 시퀀스 등으로 처리하거나 nosql로 ...처리?
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			mapper.increaseViewCount(pno);
			Post post = mapper.selectOne(pno);
			post.setAttachs(attachMapper.selectList(pno));
			return post;
		}
	}
	
	@Override
	public List<Post> list(Criteria cri){
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			List<Post> list = mapper.selectList(cri);
			list.forEach(post -> {
				post.setAttachs(attachList(post.getPno())); 
			});
			return list;
		}
	}
	
	
	@Override
	public int count(Criteria cri) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.getCount(cri);
		}
	}
	
	
	
	@Override
	public int replyCount(Long pno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.getReplyCount(pno);
		}
	}

	@Override
	public int like(String id, Long pno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			LikeMapper likemapper = session.getMapper(LikeMapper.class);
//			mapper.increaseLikes(pno);
			System.out.println(mapper.increaseLikes(pno));
			likemapper.insertLike(id, pno);
			return 1;
		}
	}
	
	public int download(String uuid) {		
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			attachMapper.increaseDownloadCount(uuid);
			return 1;
		}
		
		
		
	}
	
	
	
	
}
