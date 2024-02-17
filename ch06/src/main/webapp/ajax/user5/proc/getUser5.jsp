<%@page import="ch06.User5DTO"%>
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
	String seq = request.getParameter("seq");
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();

	PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `User5` WHERE `seq`=?");
	psmt.setString(1, seq);
	
	ResultSet rs = psmt.executeQuery();
	
	User5DTO user5 = null;
	
	if(rs.next()){
		user5 = new User5DTO();
		user5.setSeq(rs.getString(1));
		user5.setName(rs.getString(2));
		user5.setGender(rs.getString(3));
		user5.setAge(rs.getString(4));
		user5.setAddr(rs.getString(5));
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
	// JSON 출력
	Gson gson = new Gson();
	String strJson = gson.toJson(user5);
	out.print(strJson);
%>