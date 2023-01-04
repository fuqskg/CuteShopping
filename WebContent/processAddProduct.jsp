<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="productdao" class="product.ProductDAO"/>
<jsp:useBean id="product" class="product.Product"/>
<jsp:setProperty  name="product" property="*"/>
<%
	  boolean result = productdao.Product_Insert(product);
	  if(result) {
%>
<script type="text/javascript">
		alert("상품등록완료");
		location.href="productList.jsp";
</script>
<% } else { %>
<script type="text/javascript">
		alert("등록실패");
		history.back();
</script>
<% } %>