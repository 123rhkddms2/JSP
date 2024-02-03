<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="ch06.User4DTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	// 수정 데이터 조회
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="123rhkddms2";
	String pass="1234";
	
	User4DTO dto = null;
	
	try{
		// 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계 - DB 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계 - SQL 실행객체 생성
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `User4` WHERE `uid`=?");
		psmt.setString(1, uid);
		
		// 4단계 - SQL 실행
		ResultSet rs = psmt.executeQuery();
		
		// 5단계 - 결과 처리(SELECT 경우)
		if(rs.next()){
			dto = new User4DTO();
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getString(4));
			dto.setHp(rs.getString(5));
			dto.setAddr(rs.getString(6));		
		}
		
		// 6단계 - DB 종료
		rs.close();
		psmt.close();
		conn.close();
		

	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::modify</title>
	</head>
	<body>
		<h3>user4 수정</h3>
		
		<a href="../1.Jdbc.jsp">처음으로</a>
		<a href="./list.jsp">목록보기</a>
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value="<%= dto.getUid()%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= dto.getName()%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender" value="<%= dto.getGender()%>"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value="<%= dto.getAge()%>"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="hp" value="<%= dto.getHp()%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%= dto.getAddr()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>