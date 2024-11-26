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

@WebServlet("/post/modify")
public class Modify extends HttpServlet{
	private PostService service = new PostServiceImpl();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pnoStr = req.getParameter("pno");
		Object memberObj = req.getSession().getAttribute("member");
		Criteria cri = new Criteria(req);
		String redirectUrl = "list?"+cri.getQs2();
		
		
		if(pnoStr == null || memberObj == null) {
			Commons.printMsg("비정상적인 접근입니다", redirectUrl, resp);
			return;
		}
		
		
		Long pno = Long.valueOf(pnoStr);
		Member m = (Member) memberObj;
		
		
		if(!m.getId().equals(service.findBy(pno).getId())) {
			Commons.printMsg("본인이 작성한 글만 수정할 수 있습니다", redirectUrl, resp);
			return;
		}
		
		
		
		req.setAttribute("cri", cri);
		req.setAttribute("post", service.findBy(pno));
		req.getRequestDispatcher("/WEB-INF/jsp/post/modify.jsp").forward(req, resp);
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		Object memberObj = req.getSession().getAttribute("member");
		Criteria cri = new Criteria(req);
		
		
		
		if(memberObj == null) {
			Commons.printMsg("비정상적인 접근입니다", "list?"+cri.getQs2(), resp);
			return;
		}
		
		Member m = (Member) memberObj;

		//파라미터 수집
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String pnoStr = req.getParameter("pno");
		Long pno = Long.valueOf(pnoStr);

		
		if(!m.getId().equals(service.findBy(pno).getId())) {
			Commons.printMsg("본인이 작성한 글만 수정할 수 있습니다", "list?"+cri.getQs2(), resp);
			return;
		}
		
		//첨부파일수정하고싶ㅇ므 .ㅠㅠㅠ
//		List<Attach> attachs = new ArrayList<>();
//
//		
//		String[] uuids = req.getParameterValues("uuid");
//		String[] origins = req.getParameterValues("origin");
//		String[] images = req.getParameterValues("image");
//		String[] paths = req.getParameterValues("path");
//
//		
//		if(uuids != null) {
//			for(int i = 0; i < uuids.length; i++) {
//				attachs.add(Attach.builder()
//						.uuid(uuids[i])
//						.origin(origins[i])
//						.image(images[i].equals("true"))
//						.path(paths[i])
//						.build());
//			}
//		}
//			
//		
//		service.modify(Post.builder().title(title).content(content).attachs(attachs).build());
//		resp.sendRedirect("view?pno="+pno+"&"+cri.getQs2());
//		
//		
		
		service.modify(Post.builder().title(title).content(content).pno(pno).build());
		resp.sendRedirect("view?pno="+pno+"&"+cri.getQs2());
	}
	
}
