<%@ page import="java.util.ArrayList"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="product.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문~</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
	<%
    String id = request.getParameter("id");

	 //상품 데이터 접근 인스턴스 생성
    ProductRepository repo = ProductRepository.getInstance();
    //레포에 있는 id 값을 통해 상세정보 얻기
    Product product = repo.getProductById(id);
    

    //상품이 없다? 예외처리
    if (product == null) {
       response.sendRedirect("exceptionNoProductId.jsp");
    }
    
  //모든 상품 가져오기
    ArrayList<Product> goodslist = repo.getAllProducts();
    Product goods = new Product();
    for (int i = 0; i < goodslist.size(); i++) {
       //상품목록 중 사용자가 주문한 상품id와 일치하는 값을 Product에 넣기
       goods = goodslist.get(i);
       if (goods.getProductId().equals(id)) {
          break;
       }
    }
    
    //요청 파라미터 아이디 상품을 담은 장바구니 초기화
    //세션 속성이 cartlist인 세션정보를 가져와서 ArrayList에 넣기 (장바구니목록)
    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	out.print("list의 크기: " + list);

    //장바구니에 암것도 없다면 새 ArrayList 생성,세션에 list값을 cartlist란 이름으로 넣기.
    if (list == null) {
       list = new ArrayList<>();
       session.setAttribute("cartlist", list);
    }
    

    //이미 담긴 물품 -> 수량 증가시키기(list : 장바구니에 담긴 상품 목록)
    int count = 0;
    Product goodsQ = new Product();
    for (int i = 0; i < list.size(); i++) {
       goodsQ = list.get(i);
       if (goodsQ.getProductId().equals(id)) {
          count++;
          int orderQ = goodsQ.getQuantity() + 1;
          goodsQ.setQuantity(orderQ);
       }
    }

    //장바구니에 처음 넣는다 -> 수량 1로 변경, ArrayList에 추가
    if (count == 0) {
       goods.setQuantity(1);
       list.add(goods);
    }

	%>

	<script type="text/javascript">
	alert("장바구니에 추가되었습니다.");
	history.go(-1);
	</script>

</body>
</html>