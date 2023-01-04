
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
	//세션  id값 가져오기
	String cartId = session.getId();
	DecimalFormat dF = new DecimalFormat("###,###"); //숫자단위
%>

</head>
<body id="page-top">
	<!-- 네비바 -->
	<jsp:include page="nav.jsp" />
	<!-- 네비바 끝 -->

	<!-- 상단 제목 장바구니 -->
	<div class="container" style="margin-top: 120px">
		<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">장바구니</h2>
		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
	</div>
	<!-- 상단 제목 끝 -->

	<div class="container">
		<!-- 삭제버튼 -->
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>
					</td>
					<td align="right">
						<a href="shippingInfo?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
					</td>

				</tr>
			</table>
		</div>

		<!--장바구니 표  -->
		<div style="padding-top: 50px;">
			<table class="table table-hover">
				<!-- 마우스 대면 변함 -->
				<tr>
					<!-- 1열 제목들 -->
					<th>상품</th>
					<th>가격</th>
					<th>개수</th>
					<th>합계</th>
					<th>비고</th>
				</tr>

				<%
					//세션 이름이 cartList인 정보를 ArrayList에 넣는다. (장바구니에 담긴 상품을)
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
					//out.print("cartList 크기 : " + cartList.size());
					
					//deleteCart.jsp에서  session.incalidate() 호출하면 카트리스트가 null이 됨
					//if문으로 커버해주기
					if (cartList == null) {
						cartList = new ArrayList<Product>();
					}
					
					int sum = 0;
					//상품리스트 for문으로 출력
					for (int i = 0; i < cartList.size(); i++) {
						Product product = cartList.get(i);
						int total = product.getPcost() * product.getQuantity();
						sum += total;
				%>

				<tr>
					<td><%=product.getProductId()%>-<%=product.getPname()%></td>
					<td><%=dF.format(product.getPcost())%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=dF.format(total)%></td>
					<td>
						<a herf="removeFromCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a>
				</tr>
				<%
					}
				%>
				<!-- 상품리스트 출력 끝 -->

				<tr>
					<th></th>
					<th></th>
					<th>총 금액</th>
					<th><%=dF.format(sum)%></th>
					<th></th>
			</table>

			<button class="btn btn-secondary" type="button" onclick="location.href='productList.jsp'">쇼핑 계속하기 &raquo;</button>

		</div>
		<hr />
	</div>

	<!-- 푸터 -->
	<jsp:include page="foot.jsp" />

</body>
</html>