<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
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
</head>
<body id="page-top">
	<!-- 네비바 -->
	<jsp:include page="nav.jsp" />
	<!-- 네비바 끝 -->

	<%
		request.setCharacterEncoding("UTF-8");
		String userID = (String) session.getAttribute("userID"); //다운캐스팅
		String name = request.getParameter("userName");
	%>

	<%
		if (userID != null && userID.equals("admin")) {
	%>
	<section>
		<div class="container" style="margin-top: 120px">
			<h2><%=userID%>님, 안녕하세요
			</h2>
			관리자페이지입니다.<br>

	
			<a href="managePrd.jsp">상품 관리</a><br>
			<a href="manageMem.jsp">회원 관리</a><br>
			
		</div>
	</section>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("권한이 없습니다.");
		location.href = "index.jsp";
	</script>
	<%
		}
	%>
	<!-- 푸터 -->
	<jsp:include page="foot.jsp" />

</body>
</html>