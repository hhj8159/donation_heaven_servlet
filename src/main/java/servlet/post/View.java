package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Criteria;
import service.PostService;
import service.PostServiceImpl;
import service.ReplyService;
import service.ReplyServiceImpl;
import utils.Commons;
import vo.Member;

@WebServlet("/post/view")
public class View extends HttpServlet{
	private PostService service = new PostServiceImpl();
	private ReplyService replyService = new ReplyServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = new Criteria(req); 
		
		String pnoStr = req.getParameter("pno");

		
		if(pnoStr == null) {
			Commons.printMsg("비정상적인 접근입니다", "list", resp);
			return;
		}
		Long pno = Long.valueOf(pnoStr);
		
		req.setAttribute("post", service.view(pno));

		
		
		req.setAttribute("cri", cri);
		req.getRequestDispatcher("/WEB-INF/jsp/post/view.jsp").forward(req, resp);
		
		
	}
	
}