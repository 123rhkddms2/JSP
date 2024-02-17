<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user4</title>
		<!-- 
			날짜 : 2024/02/15
			이름 : 김광은
			내용 : JSP AJAX 실습하기
		-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script>			
			window.onload = function(){
				
				// 문서 객체 생성
				const formUser = document.getElementsByTagName('form')[0];
				const btnSubmit = formUser.submit;
				
				// 전송버튼
				btnSubmit.onclick = (e) => {
					e.preventDefault(); // 기본 폼 전송 취소
					
					const uid   = formUser.uid.value;
					const name  = formUser.name.value;
					const gender = formUser.gender.value;
					const age = formUser.age.value;
					const hp = formUser.hp.value;
					const addr    = formUser.addr.value;
					
					const jsonData = {
						"uid": uid,
						"name": name,
						"gender": gender,
						"age": age,
						"hp": hp,
						"addr": addr						
					};
					
					/*
						- jquery ajax를 이용하면 json 문자열 변환없이 바로 전송 가능
						- 서버측에서는 request.getParameter 수신 가능
					*/
					$.ajax({
						method: 'POST',
						url: './proc/putUser4.jsp',
						data: jsonData,
						success: function(data){
							
							// 자동으로 객체 변환되어 들어옴
							console.log(data);
							
							if(data.result > 0){
								alert('수정완료');
								location.href = './list.jsp';
							}
						}
					});
				}
				
				// 현재 페이지 url에서 파라미터 추출
				const url = location.href;
				const params = url.split('?')[1];
				const value = params.split('=')[1];
				console.log(value);
				
				// 서버요청
				const xhr = new XMLHttpRequest();
				xhr.open('GET', './proc/getUser4.jsp?uid='+value);
				xhr.send();
				
				// 응답처리
				xhr.onreadystatechange = function(){
					
					// 응답완료
					if(xhr.readyState == XMLHttpRequest.DONE){
						
						// 요청 성공
						if(xhr.status == 200){
							const resData = JSON.parse(xhr.responseText);
							console.log(resData);
							
							formUser.uid.value = resData.uid;
							formUser.name.value = resData.name;
							formUser.gender.value = resData.gender;
							formUser.age.value = resData.age;
							formUser.hp.value = resData.hp;
							formUser.addr.value = resData.addr;
							
						}else{
							// 요청 실패
							console.log('요청 실패...');
						}
					}
				}
			}
		</script>
	</head>
	<body>
		<h3>user4 수정</h3>
		<a href="./list.jsp">목록이동</a>
		<form action="#"> 
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly></td>
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
					<td>휴대폰</td>
					<td><input type="text" name="hp"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" name="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</html>