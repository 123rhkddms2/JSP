package controller.user5;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.User5Service;

@WebServlet("/user5/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private User5Service service = User5Service.getInstance();
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		service.deleteUser5(seq);
		
		resp.sendRedirect("/ch10/user5/list.do");
	}
	
}