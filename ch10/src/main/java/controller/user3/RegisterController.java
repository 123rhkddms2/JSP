package controller.user3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User3DTO;
import service.User3Service;

@WebServlet("/user3/register.do")
public class RegisterController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private User3Service service = User3Service.getInstance();
	
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user3/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String hp = req.getParameter("hp");
		String addr = req.getParameter("addr");
		
		User3DTO user = new User3DTO();
		user.setUid(uid);
		user.setName(name);
		user.setBirth(birth);
		user.setHp(hp);
		user.setAddr(addr);
		
		service.insertUser3(user);
		
		// 리다이렉트
		resp.sendRedirect("/ch10/user3/list.do");
	}
}
