package controller.user2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User1DTO;
import dto.User2DTO;
import service.User1Service;
import service.User2Service;

@WebServlet("/user2/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private User2Service service = User2Service.getInstance();
	
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		
		// 수정 사용자 조회
		User2DTO user = service.selectUser2(uid);
		
		// View에서 데이터 공유를 위해 request Scope에 데이터 설정
		req.setAttribute("user", user);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user2/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
