<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String age = request.getParameter("age");
	String hp = request.getParameter("hp");
	
	System.out.println("uid : " + uid);
	System.out.println("name : " + name);
	System.out.println("birth : " + birth);
	System.out.println("age : " + age);
	System.out.println("hp : " + hp);
	
	out.print("{\"result\":1}");
	



%>