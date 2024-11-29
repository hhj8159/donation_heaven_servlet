package servlet.post;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import service.PostService;
import service.PostServiceImpl;
import utils.Commons;
import vo.Attach;
import vo.Post;

@WebServlet("/post/write")
public class Write extends HttpServlet{
	private PostService postService = new PostServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		Criteria cri = new Criteria(req);
		if(req.getSession().getAttribute("member") == null) {
			String cp = req.getContextPath();
			resp.sendRedirect(cp + "/signin?url=" + URLEncoder.encode(cp + "/post/write?" + cri.getQs2(), "utf-8"));
			return;
		}
		req.setAttribute("cri", cri);
		req.getRequestDispatcher("/WEB-INF/jsp/post/write.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = new Criteria(req);
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String id = req.getParameter("id");
		
		// 제목이랑 내용 공백시 처리해야됨(jsp에서 해야됨!!)
		String ct = content.trim();
		String tt = title.trim();
	
		String redirectUrl = "write?"+cri.getQs2();
		if(ct.length() == 0 || tt.length() == 0) {		
			Commons.printMsg("글 내용을 입력해주세요", redirectUrl, resp);
			return;
		}
		
		List<Attach> attachs = new ArrayList<>();

		
		//첨부파일 정보 수집
		String[] uuids = req.getParameterValues("uuid");
		String[] origins = req.getParameterValues("origin");
		String[] images = req.getParameterValues("image");
		System.out.println(Arrays.toString(images));
		String[] paths = req.getParameterValues("path");

		
		if(uuids != null) {
			for(int i = 0; i < uuids.length; i++) {
				attachs.add(Attach.builder()
						.uuid(uuids[i])
						.origin(origins[i])
						.image(images[i].equals("true"))
						.path(paths[i])
						.build());
			}
		}
		
		postService.write(Post.builder().title(title).content(content).id(id).cno(cri.getCategory()).attachs(attachs).build());
		
		resp.sendRedirect("list?"+cri.getQs2());
	}
}
