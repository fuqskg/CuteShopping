<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Vector"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductRepository"%>
<%@ page import="product.ProductDAO"%>
<jsp:useBean id="productdao" class="product.ProductDAO" scope="session" />
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style>
.portfolio-item {
	overflow: hidden;
	display: inline-block;
}

.portfolio-item img {
	-webkit-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s ease-in-out;
	transition: .3s ease-in-out;
	opacity: 1;
}

.portfolio-item:hover img {
	transform: scale(1.2);
	transition: 1s;
	opacity: 0.5;
}
</style>
<title>귀여운 건 다파는 쇼핑몰 -상품목록-</title>
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
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="service.jsp">고객센터</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="cart.jsp">장바구니</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="mypage.jsp">마이페이지</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout.jsp">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 헤더 끝 -->
	<section class="page-section portfolio" id="portfolio">
		<!-- Portfolio Section-->
		<section class="page-section portfolio" id="portfolio">
			<div class="container">
				<!-- Portfolio Section Heading-->
				<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">상품목록</h2>
				<!-- Icon Divider-->
				<div class="divider-custom">
					<div class="divider-custom-line"></div>
					<div class="divider-custom-icon">
						<i class="fas fa-star"></i>
					</div>
					<div class="divider-custom-line"></div>
				</div>
				<!-- Portfolio Grid Items-->
				<div class="row justify-content-center">
					<%
//싱글톤 객체 사용
ProductRepository repo= ProductRepository.getInstance();

//상품 목록 가져옴
ArrayList<Product> listOfProducts = repo.getAllProducts();
%>
					<%
						for (int i = 0; i < listOfProducts.size(); i++){
							Product product = listOfProducts.get(i);
					
					%>
					<div class="col-md-6 col-lg-4 mb-5">
						<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
							<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<div class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div>
							<a href="product.jsp?id=<%=product.getProductId() %>">
							 <img id="p1" class="img-fluid" src="Resources/assets/img/portfolio/<%=product.getPimg()%>" alt="..." />
							</a>
						</div>
					</div>
					<%
									}
								%>
				</div>
		</section>
		<!-- 푸터-->
		<footer class="footer text-center">
			<div class="container">
				<div class="row">
					<!-- Footer Location-->

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