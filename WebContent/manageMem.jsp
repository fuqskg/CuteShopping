<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="userdao" class="user.UserDAO" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>귀여운 건 다파는 쇼핑몰-장바구니-</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- 커스텀 CSS추가하기 -->
<link rel="stylesheet" href="./Resources/css/custom.css">
<!-- Font Awesome icons (free version)-->
<script src="./Resources/js/scripts.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="script.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./Resources/css/styles.css" rel="stylesheet" />
<script>
function memDel(delID){
	location.href="memDel.jsp?id=" + delID;
}
</script>
<%
request.setCharacterEncoding("UTF-8");
String userID = (String)session.getAttribute("userID");
userdao.getMemberList();
ArrayList memberList = userdao.getMemberList();

%>
</head>
<body id="page-top">
	<!-- 네비바 -->
	<jsp:include page="nav.jsp" />
	<!-- 네비바 끝 -->

	<section>
		<div class="container" style="margin-top: 120px; margin-bottom:120px">
			<div align="center">
				<h3>회원 관리</h3>
			</div>
<form method="get" name="mM">
			<table id=tableMem border="1" align="center" border-style="solid" >
				<tr align="center">
					<td>아이디</td>
					<td>이름</td>
					<td>우편번호</td>
					<td>주소</td>
					<td>상세주소</td>
					<td>이메일</td>
					<td>삭제</td>

				</tr>

				<%
				//ArrayList는 가변배열 -> size존재 (lenth 없음)
				for(int i = 0; i < memberList.size(); i++){
					User user = (User)memberList.get(i);
		%>
				
				<tr align="center" >
					<td><%=user.getUserID() %></td>
					<td><%=user.getUserName() %></td>
					<td><%=user.getUserPost() %></td>
					<td><%=user.getUserAddress() %></td>
					<td><%=user.getUserDaddress() %></td>
					<td><%=user.getUserEmail() %></td>
					<td><input type="button" value="삭제" onclick="memDel('<%=user.getUserID()%>');"></td>
				</tr>
				<% } %>

			</table>
			</form>

		</div>

	</section>


	<!-- 푸터 -->
	<jsp:include page="foot.jsp" />

</body>
</html>