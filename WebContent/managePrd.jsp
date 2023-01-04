<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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

	<section class="page-section portfolio" id="portfolio">
		<div class="container" style="margin-top: 50px">
			<!-- 마이페이지 Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">상품등록</h2>

			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<form name="newProduct" action="processAddProduct.jsp" class="form-horizontal" method="post">

				<div class="form-group row">
					<label class="col-sm-2">상품 아이디</label>
					<div class="com-sm-3">
						<input type="text" id="productId" name="productId" class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">상품 이름</label>
					<div class="com-sm-3">
						<input type="text" id="pname" name="pname" class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">가격</label>
					<div class="com-sm-3">
						<input type="text" id="pcost" name="pcost" class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">상세 내용</label>
					<div class="com-sm-5">
						<textarea name="pdes" cols="50" rows="2" class="form-control"></textarea>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">카테고리</label>
					<div class="com-sm-3">
						<input type="text" name="pcate" class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">재고 수</label>
					<div class="com-sm-3">
						<input type="text" id="pstock" name="pstock" class="form-control">
					</div>
				</div>
				<!--<div class="form-group row">
				<label class="col-sm-2">상품 이미지</label>
				<div>
					<input type="file" name="pimg" class="form-control">
				</div>
			</div>
				  -->

				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-primary btn-xl" type="submit">등록</button>

					</div>
				</div>

			</form>




		</div>
	</section>


	<!-- 푸터 -->
	<jsp:include page="foot.jsp" />

</body>
</html>