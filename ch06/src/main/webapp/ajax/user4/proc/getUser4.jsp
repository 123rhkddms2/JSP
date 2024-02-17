<%@page import="ch06.User4DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();

	PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `User4` WHERE `uid`=?");
	psmt.setString(1, uid);
	
	ResultSet rs = psmt.executeQuery();
	
	User4DTO user4 = null;
	
	if(rs.next()){
		user4 = new User4DTO();
		user4.setUid(rs.getString(1));
		user4.setName(rs.getString(2));
		user4.setGender(rs.getString(3));
		user4.setAge(rs.getString(4));
		user4.setHp(rs.getString(5));
		user4.setAddr(rs.getString(6));
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
	// JSON 출력
	Gson gson = new Gson();
	String strJson = gson.toJson(user4);
	out.print(strJson);
%>