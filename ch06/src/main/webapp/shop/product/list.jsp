<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 변수 초기화
    String prodNo = "";
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

        // 3단계 - SQL 실행을 위한 PreparedStatement 객체 생성
        PreparedStatement psmt = conn.prepareStatement("SELECT * FROM product");

        // 4단계 - SQL 실행 및 결과 처리
        ResultSet rs = psmt.executeQuery();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>product::list</title>
	</head>
	<body>
		<h3>Product 목록</h3>
        
        <a href="../../2.DBCP.jsp">처음으로</a>
        <a href="./register.jsp">등록하기</a>
        <table border="1">
        	<tr>
        		<th>상품번호</th>
        		<th>상품이름</th>
                <th>재고량</th>
                <th>가격</th>
                <th>회사</th>
                <th>관리</th>
			</tr>
<%
        // 결과가 여러 개인 경우 while 문을 사용하여 모든 결과를 가져옴
        while (rs.next()) {
            // 반복문 내부에서 변수를 갱신
            prodNo = rs.getString("prodNo");
            prodName = rs.getString("prodName");
            stock = rs.getString("stock");
            price = rs.getString("price");
            company = rs.getString("company");
%>
			<tr>
				<td><%=prodNo%></td>
                <td><%=prodName%></td>
                <td><%=stock%></td>
                <td><%=price%></td>
                <td><%=company%></td>
                <td>
                    <a href="./modify.jsp?prodNo=<%=prodNo%>">수정</a>
                	<a href="./delete.jsp?prodNo=<%=prodNo%>">삭제</a>
                </td>
			</tr>
<%
        }

        // 사용한 자원 해제
        rs.close();
        psmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
		</table>
	</body>
</html>