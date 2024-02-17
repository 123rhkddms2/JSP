<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user5</title>
		<!-- 
			날짜 : 2024/02/15
			이름 : 김광은
			내용 : JSP AJAX 실습하기
		-->
		<script>
			
			window.onload = function(){
					
				// 사용자 등록
				const btnSubmit = document.getElementsByName('submit')[0];
				const formUser5 = document.getElementsByTagName('form')[0];
		 		
		 		btnSubmit.onclick = (e) => {
		 			e.preventDefault();
		 			
		 			const seq 	= formUser5.seq.value;
		 			const name 	= formUser5.name.value;
		 			const gender 	= formUser5.gender.value;
		 			const age = formUser5.age.value;
		 			const addr 	= formUser5.addr.value;
		 			
		 			// JSON 생성
		 			const jsonData = {
		 				"seq": seq,
		 				"name": name,
		 				"gender": gender,
		 				"age": age,
		 				"addr": addr		 				
		 			};
		 			
		 			// JSON 문자열 변환
		 			const strJson = JSON.stringify(jsonData);
		 			console.log('strJson : ' + strJson);
		 			
		 			// 서버 전송
		 			fetch('./proc/postUser5.jsp', {
			 				method: 'POST',
			 				headers: {
			 					"Content-Type": "application/json",
			 				},
			 				body: strJson
		 				})
			 			.then(response => response.json())
			 			.then((data) => {
			 				console.log(data);
			 				
			 				if(data.result > 0){
			 					
			 					alert('등록 성공!');
			 					
			 					// 목록 이동
			 					location.href = './list.jsp';
			 					
			 				}else{
			 					alert('등록 실패!');
			 				}
			 				
			 			})
			 			.catch((err) => {
			 				console.log(err);
			 			});
		 		}
			}
		</script>
	</head>
	<body>
		<h3>user5 등록</h3>
		<form action="#"> 
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="seq"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" name="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>