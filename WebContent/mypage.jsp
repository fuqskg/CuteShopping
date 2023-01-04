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
	<%
		//userID에 받아온 아이디세션값을 ..
		String userID = (String) session.getAttribute("userID");
		String userName = (String) session.getAttribute("userName");
	%>
	<!-- 헤더 시작 -->
	<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">귀여운 건 다 파는 쇼핑몰</a>
			<button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<%
						if (userID == null) { //미로그인시 네비바
					%>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">베스트</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#join">간편회원가입</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp">로그인</a></li>

					<%
						} else {
					%>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">베스트</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="cart.jsp">장바구니</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="mypage.jsp">마이페이지</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout.jsp">로그아웃</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 헤더 끝 -->
	<!-- 마이페이지 시작 -->
	<!-- Portfolio Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container" style="margin-top: 50px">
			<!-- 마이페이지 Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">마이페이지</h2>

			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"><%=userID%>님!
			</h2>
			<p class="page-section-heading text-center  text-secondary mb-0">반갑습니다.</p>

			<!-- Portfolio Grid Items-->

			<div class="row justify-content-center">
				<!-- 내정보수정하기 -->
				<div class="col-md-6 col-lg-4 mb-5 auto">

					<a href="myInfo.jsp"> <img class="img-fluid" src="Resources/assets/mypage/info.png" alt="내정보" /> <br> 내정보 수정하기
					</a>
				</div>
				<!-- 장바구니 -->
				<div class="col-md-6 col-lg-4 mb-5 auto">

					<a href="cart.jsp"> <img class="img-fluid center" src="Resources/assets/mypage/cart.png" alt="장바구니" /> <br> 장바구니
					</a>
				</div>
				<!-- 주문내역 -->
				<div class="col-md-6 col-lg-4 mb-5 auto">
					<a href="#"> <img class="img-fluid" src="Resources/assets/mypage/list.png" alt="주문내역" /> <br> 주문내역
					</a>

				</div>
				<!-- 회원탈퇴 -->
				<div class="col-md-6 col-lg-4 mb-5">
					<a href="deleteMem.jsp"> <img class="img-fluid" src="Resources/assets/mypage/bye.png" alt="회원탈퇴" /> <br> 회원탈퇴
					</a>
				</div>
			</div>
		</div>

	</section>
	<!-- 푸터-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">주소</h4>
					<p class="lead mb-0">
						전라북도 전주시 덕진구 <br /> 어딘가에서 자취중!!
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
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
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2022</small>
		</div>
	</div>
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
</html>