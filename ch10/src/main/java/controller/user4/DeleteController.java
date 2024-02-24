package controller.user4;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.User4Service;

@WebServlet("/user4/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private User4Service service = User4Service.getInstance();
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		service.deleteUser4(uid);
		
		resp.sendRedirect("/ch10/user4/list.do");
	}
	
}