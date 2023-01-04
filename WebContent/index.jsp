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

<!-- 메소드 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//카카오 우편번호
	function kakaopost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#userPost").value = data.zonecode;
				document.querySelector("#userAddress").value = data.address;
				document.querySelector("input[name=userDaddress]").focus();
			}
		}).open();
	}
	// 아이디 중복체크
	function idCheck(userID) {
		frm = document.joinForm; //회원가입form name
		if (userID == "") {
			alert("아이디를 입력해 주세요.");
			frm.userID.focus();
			return;
		}
		url = "idCheckForm.jsp?userID=" + userID;
		window.open(url, "IdCheck", "width=500,height=300");
	}

	//중복체크 후 새로운 아이디를 다시 입력했을때 다시 또 중복체크하도록
	function inputIdChk() {
		document.joinForm.idDuplication.value = "idUncheck";
	}

	//아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	//중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때 다시 중복체크를 하도록
	//function inputIdChk(){
	//    document.userInfo.idDuplication.value ="idUncheck";
	//}
</script>


</head>
<body id="page-top">
	<%
		//userID에 받아온 아이디세션값을 ..
		String userID = (String) session.getAttribute("userID");
	%>
	<!-- 헤더 시작 -->
	<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">귀여운 건 다 파는 쇼핑몰</a>
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
	<!-- 맨위-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- 상단 이미지-->
			<img class="masthead-avatar mb-5" src="Resources/assets/img/cat.png" alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">귀여운 건 다 파는 쇼핑몰</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">문구 - 어쩌구 - 음식까지팔수도</p>
		</div>
	</header>
	<!-- Portfolio Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">베스트</h2>
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
				<!-- 베스트아이템 1-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
						<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="Resources/assets/img/portfolio/xxxz.jpg" alt="..." />
					</div>
				</div>
				<!-- 베스트아이템 2-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto " data-bs-toggle="modal" data-bs-target="#portfolioModal2">
						<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="Resources/assets/img/portfolio/ham.jpg" alt="..." />
					</div>
				</div>
				<!-- 베스트아이템 3-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
						<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="Resources/assets/img/portfolio/zjzj.jpg" alt="..." />
					</div>
				</div>
				<!-- 베스트아이템 4-->
				<div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
						<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="Resources/assets/img/portfolio/rld.png" alt="..." />
					</div>
				</div>
				<!-- 베스트아이템 5-->
				<div class="col-md-6 col-lg-4 mb-5 mb-md-0">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
						<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="Resources/assets/img/portfolio/maru.jpg" alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 6-->
				<div class="col-md-6 col-lg-4">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
						<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="Resources/assets/img/portfolio/bab.jpg" alt="..." />
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-white">귀여운 건 다 파는 쇼핑몰은</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content 뒤에 이미지 흘러가게 해서 (어둡게) 상품더보러가기 누르면 아무튼-->
			<div class="row">
				<div class="col-lg-4 ms-auto">
					<p class="lead">안귀여운 건 안 팝니다.</p>
				</div>
				<div class="col-lg-4 me-auto">
					<p class="lead">왜냐면 안귀엽기 때문이죠</p>
				</div>
			</div>
			<!-- About Section Button-->
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light" href="productList.jsp"> <i class="fas fa-download me-2"></i> 상품 더 보러 가기
				</a>
			</div>
		</div>
	</section>

	<!-- 회원가입 Section -->
	<section class="page-section" id="join">
		<%
				if (userID == null) { //미로그인시 회원가입란이 나타나게(로그인 상태에선 이 화면이 안보임)
			%>
		<div class="container">
			<!-- 간편회원가입 Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">간편회원가입</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- 간편회원가입 Form-->

			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form id="joinForm" name="joinForm" method="post" action="registerAction.jsp">
						<!-- 이름 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userName" name="userName" type="text" placeholder="이름을 입력하세요." data-sb-validations="required" /> <label for="name">이름</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">이름은 필수 입력사항입니다.</div>
						</div>
						<!-- 아이디 입력-->
						<div class="form-floating mb-3">
							<input class="form-control" id="userID" name="userID" type="text" placeholder="사용할 아이디를 입력하세요." data-sb-validations="required" /> <label for="userID">아이디</label> <br />

							<button type="button" class="btn btn-outline-info" onClick="idCheck(this.form.userID.value)">중복확인</button>
							<!-- 아이디 중복체크 여부 -->
							<input type="hidden" name="idDuplication" value="idUncheck">

							<div class="invalid-feedback" data-sb-feedback="id:required">아이디는 필수 입력사항입니다.</div>
						</div>
						<!-- 비밀번호 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userPw" name="userPw" type="password" placeholder="비밀번호를 입력하세요." data-sb-validations="required" /> <label for="uspw">비밀번호</label>
							<div class="invalid-feedback" data-sb-feedback="id:required">비밀번호는 필수 입력사항입니다.</div>
						</div>
						<!-- 비밀번호 확인 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="uspw2" name="userPW2" type="password" placeholder="비밀번호를 입력하세요." data-sb-validations="required" /> <label for="uspw">비밀번호 확인</label>
							<div class="invalid-feedback" data-sb-feedback="id:required">비밀번호는 필수 입력사항입니다.</div>
						</div>

						<!-- 이메일 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userEmail" name="userEmail" type="email" placeholder="name@example.com" data-sb-validations="required,email" /> <label for="email">이메일</label>
							<div class="invalid-feedback" data-sb-feedback="email:required">이메일은 필수 입력사항입니다.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">유효하지 않은 이메일입니다.</div>
						</div>
						<!-- 핸드폰번호 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userPhone" name="userPhone" type="tel" placeholder="010-1111-2222" data-sb-validations="required" /> <label for="phone">휴대전화번호</label>
							<div class="invalid-feedback" data-sb-feedback="phone:required">전화번호는 필수 입력사항입니다.</div>
						</div>
						<!-- 우편번호 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userPost" name="userPost" type="text" onclick="kakaopost()" readonly placeholder="우편번호를 입력하세요" data-sb-validations="required" /> <label for="post">우편번호</label>

							<button class="btn btn-outline-dark" type="button" onclick="kakaopost()">우편번호 찾기</button>
							<div class="invalid-feedback" data-sb-feedback="id:required">우편번호는 필수 입력사항입니다.</div>

						</div>
						<!-- 주소 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userAddress" name="userAddress" type="text" placeholder="주소를 입력하세요" data-sb-validations="required" /> <label for="address">주소</label>
							<div class="invalid-feedback" data-sb-feedback="id:required">주소는 필수 입력사항입니다.</div>
						</div>


						<!-- 상세주소 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userDaddress" name="userDaddress" type="text" placeholder="상세주소를 입력하세요" data-sb-validations="required" /> <label for="address_detail">상세 주소</label>
							<div class="invalid-feedback" data-sb-feedback="id:required">상세주소는 필수 입력사항입니다.</div>
						</div>

						<!-- 회원가입 버튼-->
						<button class="btn btn-primary btn-xl" type="submit">회원가입</button>
					</form>
				</div>
			</div>

		</div>
		<%
				}
			%>
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
								 <a href="manage.jsp">관리자페이지</a>
				
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2022</small>
		</div>
	</div>


	<!-- 베스트 이미지 클릭시-->
	<!-- 베스트이미지 1-->
	<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- 제목-->
								<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">틴틴팅클</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- 이미지-->
								<img class="img-fluid rounded mb-5" src="Resources/assets/img/portfolio/xxxz.jpg" alt="..." />
								<!-- 내용-->
								<p class="mb-4">귀여워요</p>
								<button class="btn btn-primary" style="margin-bottom: 10px" 
								onclick="location.href='product.jsp?id=1'">
									<i class="fas fa-xmark fa-fw"></i>  주문하러 가기
								</button>
								<br>
								<button class="btn btn-primary" data-bs-dismiss="modal">
									<i class="fas fa-xmark fa-fw"></i> 창닫기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 베스트이미지 2-->
	<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- 제목-->
								<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">햄터</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- 이미지-->
								<img class="img-fluid rounded mb-5" src="Resources/assets/img/portfolio/ham.jpg" alt="..." />
								<!-- 내용-->
								<p class="mb-4">꽤귀여워요</p>
								<button class="btn btn-primary" style="margin-bottom: 10px"
								onclick="location.href='product.jsp?id=2'">
									<i class="fas fa-xmark fa-fw"></i> 주문하러 가기
								</button>
								<br>
								<button class="btn btn-primary" data-bs-dismiss="modal">
									<i class="fas fa-xmark fa-fw"></i> 창닫기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 베스트이미지 3-->
	<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- 제목-->
								<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">크리스마스</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- 이미지-->
								<img class="img-fluid rounded mb-5" src="Resources/assets/img/portfolio/zjzj.jpg" alt="..." />
								<!-- 내용-->
								<p class="mb-4">크리스마스를맞은햄스터</p>
								<button class="btn btn-primary" style="margin-bottom: 10px"
								onclick="location.href='product.jsp?id=3'">
									<i class="fas fa-xmark fa-fw"></i> 주문하러 가기
								</button>
								<br>
								<button class="btn btn-primary" data-bs-dismiss="modal">
									<i class="fas fa-xmark fa-fw"></i> 창닫기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 베스트이미지 4-->
	<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- 제목-->
								<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">햄깅이</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- 이미지-->
								<img class="img-fluid rounded mb-5" src="Resources/assets/img/portfolio/rld.png" alt="..." />
								<!-- 내용-->
								<p class="mb-4">울지망</p>
								<button class="btn btn-primary" style="margin-bottom: 10px"\
								onclick="location.href='product.jsp?id=4'">
									<i class="fas fa-xmark fa-fw"></i> 주문하러 가기
								</button>
								<br>
								<button class="btn btn-primary" data-bs-dismiss="modal">
									<i class="fas fa-xmark fa-fw"></i> 창닫기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 베스트이미지 5-->
	<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- 제목-->
								<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">마루</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- 이미지-->
								<img class="img-fluid rounded mb-5" src="Resources/assets/img/portfolio/maru.jpg" alt="..." />
								<!-- 내용-->
								<p class="mb-4">마루는강쥐</p>
								<button class="btn btn-primary" style="margin-bottom: 10px"
								onclick="location.href='product.jsp?id=5'">
									<i class="fas fa-xmark fa-fw"></i> 주문하러 가기
								</button>
								<br>
								<button class="btn btn-primary" data-bs-dismiss="modal">
									<i class="fas fa-xmark fa-fw"></i> 창닫기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 베스트이미지 6-->
	<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" aria-labelledby="portfolioModal6" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- 제목-->
								<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">먹밥이</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- 이미지-->
								<img class="img-fluid rounded mb-5" src="Resources/assets/img/portfolio/bab.jpg" alt="..." />
								<!-- 내용-->
								<p class="mb-4">탄수화물보충</p>
								<button class="btn btn-primary" style="margin-bottom: 10px"
								onclick="location.href='product.jsp?id=6'">
									<i class="fas fa-xmark fa-fw"></i> 주문하러 가기
								</button>
								<br>
								<button class="btn btn-primary" data-bs-dismiss="modal">
									<i class="fas fa-xmark fa-fw"></i> 창닫기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
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