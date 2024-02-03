<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid   = request.getParameter("uid");
	String name  = request.getParameter("name");
	String gender  = request.getParameter("gender");
	String age  = request.getParameter("age");
	String hp = request.getParameter("hp");
	String addr  = request.getParameter("addr");
	
	// 데이터베이스 작업
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="123rhkddms2";
	String pass="1234";
	


	try{
		// 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계 - DB접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		
		// 3단계 - SQL 실행객체 생성
		String sql = "INSERT INTO `User4` VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, gender);
		psmt.setString(4, age);
		psmt.setString(5, hp);
		psmt.setString(6, addr);
		
		// 4단계 - SQL 실행
		psmt.executeUpdate();
		
		// 5단계 - 결과 처리(SELECT 경우)
		
		// 6단계 - DB 종료
		psmt.close();
		conn.close();

	}catch(Exception e){
		e.printStackTrace();
	}
	//목록이동
	response.sendRedirect("./list.jsp");


%>