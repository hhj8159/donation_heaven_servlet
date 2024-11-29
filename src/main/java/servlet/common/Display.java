package servlet.common;
//servlet은 파라미터 수집

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mapper.AttachMapper;
import mapper.PostMapper;
import service.PostService;
import service.PostServiceImpl;
import utils.Commons;
@WebServlet("/display")
public class Display extends HttpServlet{

	private PostService service = new PostServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 파라미터 수집
		String uuid = req.getParameter("uuid");
		String origin = req.getParameter("origin");
		String path = req.getParameter("path");
		
		service.download(uuid);	//다운로드 수 증가
	
		if(uuid == null || origin == null || path == null) {
			Commons.printMsg("잘못된 접근입니다.", null, resp);
			return;
		}
		
		File file = new File(Commons.UPLOAD_PATH, path); //업로드된 폴더
		file = new File(file, uuid); 
		
		if(!file.exists()) {
			Commons.printMsg("잘못된 접근입니다.", null, resp);
			return;
		}
		
		String mime = Files.probeContentType(file.toPath());
		
		resp.setContentType(mime);
		
		FileInputStream fis = new FileInputStream(file);
		byte[] bytes = fis.readAllBytes(); //20gb
		resp.getOutputStream().write(bytes);
		fis.close();
		
		
		
	}
	

}
