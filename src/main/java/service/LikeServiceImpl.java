package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.LikeMapper;
import mapper.PostMapper;
import utils.MybatisInit;
import vo.Like;
import vo.Post;

public class LikeServiceImpl implements LikeService{

	@Override
	public int like(String id, Long pno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dislike(String id, Long pno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Like findBy(String id, Long pno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			LikeMapper likemapper = session.getMapper(LikeMapper.class);
			Post post = mapper.selectOne(pno);
			Like like = likemapper.selectOne(id, pno);
			return like;
		}
	}

	@Override
	public List<Like> list(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
