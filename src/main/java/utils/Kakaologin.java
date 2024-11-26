package utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Kakaologin")
public class Kakaologin extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * req.setCharacterEncoding("utf-8"); String code = req.getParameter("code"); if
		 * (code != null) {
		 * 
		 * Cookie cookie = new Cookie("authorize-access-token", code);
		 * 
		 * 
		 * cookie.setMaxAge(60 * 60); cookie.setPath("/");
		 * 
		 * 
		 * resp.addCookie(cookie);
		 * 
		 * String redirectURL = req.getContextPath()+"/signin";
		 * resp.sendRedirect(redirectURL);
		 * 
		 * 
		 * }
		 */
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String code = req.getParameter("code");

	        Cookie cookie = new Cookie("authorize-access-token", code);

	       
	        cookie.setMaxAge(60 * 60); 
	        cookie.setPath("/"); 


	        resp.addCookie(cookie);
	        
	        String redirectURL = req.getContextPath()+"/index";
	        resp.sendRedirect(redirectURL);
		
	}
	
	
}
