package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import service.PostService;
import service.PostServiceImpl;
import utils.Commons;
import vo.Member;
import vo.Post;

@WebServlet("/post/like")
public class Like extends HttpServlet{
private PostService service = new PostServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pnoStr = req.getParameter("pno");
	    Object memberObj = req.getSession().getAttribute("member");
	    Criteria cri = new Criteria(req);
	    String redirectUrl = "view?" + cri.getQs2();
	
	      
	    if (pnoStr == null || memberObj == null) {
	        Commons.printMsg("비정상적인 접근입니다", redirectUrl, resp);
	        return;
	    }
	    
	    Long pno = Long.valueOf(pnoStr);
	    Member m = (Member) memberObj;
	    if(m.getId().equals(service.findBy(pno).getId())) {
	    	Commons.printMsg("본인의 글은 추천할 수 없습니다", redirectUrl, resp);
	    	return;
	    }
	    
	    service.like(pno);
		resp.sendRedirect(redirectUrl);
	
	}
}
