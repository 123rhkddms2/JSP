<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product::register</title>
	</head>
	<body>
		<h3>Product 등록</h3>
		
		<a href="../../2.DBCP.jsp">처음으로</a>
		<a href="./list.jsp">목록보기</a>
		<form action="./registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>상품번호</td>
					<td><input type="text" name="prodNo"></td>
				</tr>
				<tr>
					<td>상품이름</td>
					<td><input type="text" name="prodName"></td>
				</tr>				
				<tr>
					<td>재고량</td>
					<td><input type="text" name="stock"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>회사</td>
					<td><input type="text" name="company"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>