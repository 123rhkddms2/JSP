<%@page import="ch06.User5DTO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// request body JSON 문자열 스트림 처리
	request.setCharacterEncoding("UTF-8");
	
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	String line;
	while((line = reader.readLine()) != null){
		requestBody.append(line);
	}
	reader.close();
	
	// JSON 파싱(JSON 문자열을 DTO 객체로 변환)
	Gson gson = new Gson();
	User5DTO user5 = gson.fromJson(requestBody.toString(), User5DTO.class);
	System.out.println(user5);
	
	// 데이터베이스 처리
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	PreparedStatement psmt = conn.prepareStatement("INSERT INTO `User5` VALUES (?,?,?,?,?)");
	psmt.setString(1, user5.getSeq());
	psmt.setString(2, user5.getName());
	psmt.setString(3, user5.getGender());
	psmt.setString(4, user5.getAge());
	psmt.setString(5, user5.getAddr());
	
	// row count 반환
	int result = psmt.executeUpdate();
	System.out.println("result : " + result);
	
	psmt.close();
	conn.close();	
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());
%>