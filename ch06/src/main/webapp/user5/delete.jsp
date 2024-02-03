<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="ch06.User5DTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");

	// 삭제 데이터 조회
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="123rhkddms2";
	String pass="1234";
		
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		PreparedStatement psmt = conn.prepareStatement("DELETE FROM `User5` WHERE `seq`=?");
		psmt.setString(1, uid);
			
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
		}

	response.sendRedirect("./list.jsp");
%>