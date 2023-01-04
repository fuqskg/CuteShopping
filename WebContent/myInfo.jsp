<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%-- <jsp:useBean id="productDAO" class="product.ProductRepository" scope="session" />--%>
<%
	request.setCharacterEncoding("UTF-8");
String userID = (String) session.getAttribute("userID");
%>
<!-- 내정보(수정가능) -->
<!DOCTYPE html>
<html>
<head>
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
	</script>
	</head>
	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>귀여운 건 다파는 쇼핑몰-내정보-</title>
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
	<!-- 본문 -->
	<%
	UserDAO userdao = new UserDAO();
	User user = userdao.getMember(userID);
	
	if( user != null ){
	
	%>
	<section class="page-section portfolio" id="portfolio">
		<div class="container" style="margin-top: 50px">
			<!-- 마이페이지 Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">내 정보 수정</h2>

			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<!-- 회원정보 테이블 	-->
						<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">

					<form  name="myInfo" method="post" action="updateInfo.jsp">
						<!-- 이름 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" name="userName" type="text" value="<%=user.getUserName()%>"readonly/> <label for="name">이름</label>
						</div>
						<!-- 아이디 입력-->
						<div class="form-floating mb-3">
							<input class="form-control" name="userID" type="text" value="<%=user.getUserID() %>" readonly /> <label for="userID">아이디</label> <br />
						</div>
						<!-- 비밀번호 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userPw" name="userPw" type="password" placeholder="비밀번호를 입력하세요." data-sb-validations="required" /> <label for="uspw">비밀번호</label>
						</div>
						<!-- 비밀번호 확인 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="uspw2" name="userPW2" type="password" placeholder="비밀번호를 입력하세요." data-sb-validations="required" /> <label for="uspw">비밀번호 확인</label>
						</div>

						<!-- 이메일 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userEmail" name="userEmail" value="<%=user.getUserEmail()%>"type="email"  /> <label for="email">이메일</label>
							<div class="invalid-feedback" data-sb-feedback="email:email">유효하지 않은 이메일입니다.</div>
						</div>
						<!-- 핸드폰번호 입력 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="userPhone" name="userPhone" type="tel"  value="<%=user.getUserPhone()%>"data-sb-validations="required" /> <label for="phone">휴대전화번호</label>
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
						<button class="btn btn-primary btn-xl" type="submit">회원정보 수정하기</button>
					</form>
				</div>
			</div>
		

<%} else { %>
<script type="text/javascript">
alert("로그인 후 이용바랍니다.");
location.href="login.jsp";
</script>
<%} %>
</div>
</section>
			<!-- 푸터-->
			<footer class="footer text-center">
				<div class="container">
					<div class="row">

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