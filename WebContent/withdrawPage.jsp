<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>�Ϳ��� �� ���Ĵ� ���θ�-��ٱ���-</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Ŀ���� CSS�߰��ϱ� -->
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
	<%
		//userID�� �޾ƿ� ���̵𼼼ǰ��� ..
		String userID = (String) session.getAttribute("userID");
		String userName = (String) session.getAttribute("userName");
	%>
	<!-- �׺�� -->
	<jsp:include page="nav.jsp" />
	<!-- �׺�� �� -->

	<!-- ��� ���� Ż�� -->
	<div class="container" style="margin-top: 120px">
		<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">ȸ�� Ż��</h2>
		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"><%=userID%>��...
		</h2>
		<p class="page-section-heading text-center  text-secondary mb-0">���� Ż���Ͻðھ��?</p>
	</div>
	<!-- ��� ���� �� -->
	<div class="container" align="center">

		<form action="user_delete.jsp" method="post" style="margin-top: 20px">
			<p>
				<strong>��й�ȣ�� �Է��Ͻø� Ż�� �Ϸ�˴ϴ�.</strong><br />
				<input type="password" id="check_pw" name="chkPw" style="margin-top: 20px">
				<br>
				<button class="btn btn-primary" type="submit" style="margin-top: 10px">Ż���ϱ�</button>
		</form>
	</div>
	<!-- Ǫ�� -->
	<jsp:include page="foot.jsp" />

</body>
</html>