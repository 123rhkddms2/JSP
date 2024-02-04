<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String prodNo = request.getParameter("prodNo");
	String prodName = "";
	String stock = "";
    String price = "";
    String company = "";
	
	try {
		// 1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경이름
		
		// 2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `product` WHERE `prodNo`=?");
		psmt.setString(1, prodNo);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			prodNo = rs.getString("prodNo");
			prodName = rs.getString("prodName");
			stock = rs.getString("stock");
			price = rs.getString("price");
			company = rs.getString("company");	
		}
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
		<title>product::modify</title>
	</head>
	<body>
		<h3>Product 수정</h3>
		
		<a href="../../2.DBCP.jsp">처음으로</a>
		<a href="./list.jsp">목록보기</a>
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>상품번호</td>
					<td><input type="text" name="prodNo" readonly value="<%=prodNo%>"></td>
				</tr>
				<tr>
					<td>상품이름</td>
					<td><input type="text" name="prodName" value="<%=prodName%>"></td>
				</tr>
				<tr>
					<td>재고량</td>
					<td><input type="text" name="stock" value="<%=stock%>"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" value="<%=price%>"></td>
				</tr>
				<tr>
					<td>회사</td>
					<td><input type="text" name="company" value="<%=company%>"></td>
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