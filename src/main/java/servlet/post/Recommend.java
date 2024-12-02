package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import service.LikeService;
import service.LikeServiceImpl;
import service.PostService;
import service.PostServiceImpl;
import utils.Commons;
import vo.Like;
import vo.Member;
import vo.Post;

@WebServlet("/post/like")
public class Recommend extends HttpServlet {
	private PostService service = new PostServiceImpl();
	private LikeService likeservice = new LikeServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pnoStr = req.getParameter("pno");
		Long pno = Long.valueOf(pnoStr);
		String id = req.getParameter("id");

		
		if (likeservice.findBy(id, pno) == null) {
			try {
				service.like(id, pno);
				resp.getWriter().write("success");
			} catch (Exception e) {
				e.printStackTrace();
				resp.getWriter().write("fail");
			}
		} else {
			resp.getWriter().write("duplication");
		}

	}
}
