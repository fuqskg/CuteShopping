<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>귀여운 건 다파는 쇼핑몰</title>
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
	<!-- 헤더 시작 -->
	<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">귀여운 건 다 파는 쇼핑몰</a>
			<button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#">베스트</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="index.jsp#join">간편회원가입</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!--  로그인 폼 시작 -->
	<div class="container" align="center" style="padding-top: 150px; padding-bottom: 80px">
		<div class="col-md-4 col-me-offset-4">
			<h3 class="form-signin-heading">Hello!</h3>
			<%
				
			%>
			<form class="form-signin" action="loginAction.jsp" method="post">
				<div class="form-group" style="padding-bottom: 10px">
					<input name="userID" class="form-control" placeholder="아이디를 입력하세요." required autofocus>
				</div>
				<div class="form-group" style="padding-bottom: 10px">
					<input type="password" name="userPw" class="form-control" placeholder="비밀번호를 입력하세요" required>
				</div>
				<button class="btn btn-lg btn-primary" type="submit">로그인</button>
				
				<button class="btn btn-lg btn-secondary" type="button" onclick="location.href='index.jsp#join'">회원가입</button>

			</form>
		</div>
	</div>

	<!-- 로그인 폼 끝 -->

	<!-- 푸터-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">

				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">바로가기</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"> <i class="fab fa-fw fa-facebook-f"></i>
					</a> <a class="btn btn-outline-light btn-social mx-1" href="#!"> <i class="fab fa-fw fa-twitter"></i>
					</a> <a class="btn btn-outline-light btn-social mx-1" href="#!"> <i class="fab fa-fw fa-linkedin-in"></i>
					</a> <a class="btn btn-outline-light btn-social mx-1" href="#!"> <i class="fab fa-fw fa-dribbble"></i>
					</a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">귀여운 건 다 파는 쇼핑몰</h4>
					<p class="lead mb-0">
						사용기술 : css html 부트스트랩 / mysql / jsp <br /> <a href="https://github.com/fuqskg">깃허브 바로가기!</a>

					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- 푸터끝 -->
	<!-- 카피 시작 -->
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2022</small>
		</div>
	</div>
	<!-- 카피 끝 -->
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>