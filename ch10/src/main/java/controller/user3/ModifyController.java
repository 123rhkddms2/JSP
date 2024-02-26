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

@WebServlet("/user3/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private User3Service service = User3Service.getInstance();
	
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		
		// 수정 사용자 조회
		User3DTO user = service.selectUser3(uid);
		
		// View에서 데이터 공유를 위해 request Scope에 데이터 설정
		req.setAttribute("user", user);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user3/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid   = req.getParameter("uid");
		String name  = req.getParameter("name");
		String birth = req.getParameter("birth");
		String hp = req.getParameter("hp");
		String addr    = req.getParameter("addr");
	
		User3DTO user = new User3DTO();
		user.setUid(uid);
		user.setName(name);
		user.setBirth(birth);
		user.setHp(hp);
		user.setAddr(addr);
		
		service.updateUser3(user);
		
		resp.sendRedirect("/ch10/user3/list.do");
	}
}