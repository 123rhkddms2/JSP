<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String prodNo = request.getParameter("prodNo");
	String prodName   = request.getParameter("prodName");
	String stock     = request.getParameter("stock");
	String price   = request.getParameter("price");
	String company   = request.getParameter("company");
	
	// DBCP를 이용한 데이터베이스 작업
	try {
		// 1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경이름
		
		// 2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		// 3단계 - SQL실행 객체 생성
		String sql = "INSERT INTO `Product` VALUES (?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, prodNo);
		psmt.setString(2, prodName);
		psmt.setString(3, stock);
		psmt.setString(4, price);
		psmt.setString(5, company);
		
		// 4단계 - SQL실행
		psmt.executeUpdate();
		
		// 5단계 - 결과처리(SELECT 경우)
		// 6단계 - 데이터베이스 종료(커넥션 반납)
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 목록이동
	response.sendRedirect("./list.jsp");

%>