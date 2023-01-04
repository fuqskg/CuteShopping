
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="product.Product"%>
<%@ page import="java.util.ArrayList"%>

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
	<%
		//userID에 받아온 아이디세션값을 ..
		String userID = (String) session.getAttribute("userID");
		String userName = (String) session.getAttribute("userName");
	%>
	
	<script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function check(){
            if(!document.deleteForm.userPw.value){
                alert("비밀번호를 입력해주세요.");
                return false;
            }
        }
    </script>
</head>
<body id="page-top">
	<!-- 네비바 -->
	<jsp:include page="nav.jsp" />
	<!-- 네비바 끝 -->

	<!-- 상단 제목  회웡탈퇴 -->
	<div class="container" style="margin-top: 120px">
		<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원탈퇴</h2>
		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"><%=userID%>님
		</h2>
		<p class="page-section-heading text-center  text-secondary mb-0">정말 탈퇴하시겠어요?</p>

	</div>
	<!-- 상단 제목 끝 -->

	<div class="container" align="center" style="padding-top: 50px; padding-bottom: 80px">
		<div class="col-md-4 col-me-offset-4">
			<h4>비밀번호를 입력해주세요.</h4> 
			<h4>탈퇴가 완료됩니다.</h4>
			<form class="deleteForm" action="deleteMemProc.jsp" method="post" 
			onsubmit="return check()">
				<div class="form-group" style="padding-bottom: 10px">
					<input type="password" name="userPw" class="form-control" placeholder="비밀번호를 입력하세요" required>
				</div>
				<button class="btn btn-lg btn-primary" type="submit">탈퇴하기</button>
				

			</form>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="foot.jsp" />

</body>
</html>