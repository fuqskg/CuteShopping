# CuteShopping

# 🖤 빠르게 보는 [귀여운 건 다 파는 쇼핑몰]

### 💗 [귀여운 건 다 파는 쇼핑몰]?

- jsp를 이용한 캐릭터 쇼핑몰 (Bootstrap이용)

### 💗 일정

- 11/20 ~ 12/21
- 참여도: 100% (1명)

### 💗 제작 목적

- DB연동 및 홈페이지 제작 흐름을 경험하기 위해 프로젝트 시작

### 💗 사용기술 및 환경

- OS : Window
- Server : Apache Tomcat 9.0
- DB : mySQL
- Language : JavaScript / JAVA / HTML5 / CSS3
- Tool : Eclipse

### 💗 주요 기능 구현

- **로그인 / 로그아웃**
- loginAction.jsp
    
    ```jsx
    <%
    //파라미터를 이용해서 아이디 비밀번호를 받는당.
    String userID = request.getParameter("userID");
    String userPw = request.getParameter("userPw");
    String userName = request.getParameter("userName");
    UserDAO userDAO = new UserDAO();
    int result = userDAO.login(user.getUserID(), user.getUserPw());
    if (result ==1){
    	//로그인 성공하면 아이디를 세션에 저장
    	session.setAttribute("userID",userID);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'index.jsp'");
        script.println("</script>");
    }
    else if (result == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호를 다시 확인해주세요.')");
        script.println("history.back()");   //이전 페이지로 사용자를 보냄
        script.println("</script>");
    }
    else if (result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다.')");
        script.println("history.back()");    //이전 페이지로 사용자를 보냄
        script.println("</script>");
    }
    else if (result == -2){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('DB 오류가 발생했습니다.')");
        script.println("history.back()");    //이전 페이지로 사용자를 보냄
        script.println("</script>");
    }
    
    %>
    ```
    
- UserDAO.java
    
    ```jsx
    // 로그인
    	public int login(String userID, String userPw) {
    		String SQL = "SELECT userPw FROM pers_admin WHERE userID = ?";
    
    		try {
    
    			pstmt = conn.prepareStatement(SQL);
    			pstmt.setString(1, userID);
    			rs = pstmt.executeQuery(); // 쿼리 실행
    
    			if (rs.next()) {
    				if (rs.getString(1).equals(userPw)) // select 된 첫 칼럼
    					return 1; // 로그인 성공
    				else
    					return 0; // 비밀번호 오류
    			} // if문 끝
    			return -1; // 아이디 없음
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		return -2; // db오류
    	}
    ```
    

![로그인화면.PNG](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4f6c8bb2-cb42-4b04-ac90-f51a3d67485c/%EB%A1%9C%EA%B7%B8%EC%9D%B8%ED%99%94%EB%A9%B4.png)

- **회원가입**
- index.jsp
    
    ```jsx
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
    ```
    
    회원가입란을 메인페이지 아래에 배치, 로그인 시 회원가입 섹션은 보이지 않게 처리 / 중복체크 구현 및 카카오우편번호 api 사용.
    
- UserDAO.java
    
    ```java
    //회원가입
    	public int join(User user) {
    		String SQL = "INSERT INTO pers_admin (userID, userPw, userEmail, userPhone, userPost, userAddress, userDaddress, userName) VALUES (?,?,?,?,?,?,?,?)";
    
    		try {
    
    			pstmt = conn.prepareStatement(SQL);
    			pstmt.setString(1, user.getUserID());
    			pstmt.setString(2, user.getUserPw());
    			pstmt.setString(3, user.getUserEmail());
    			pstmt.setString(4, user.getUserPhone());
    			pstmt.setString(5, user.getUserPost());
    			pstmt.setString(6, user.getUserAddress());
    			pstmt.setString(7, user.getUserDaddress());
    			pstmt.setString(8, user.getUserName());
    
    			return pstmt.executeUpdate();
    				
    		}catch(Exception e) {
    			e.printStackTrace();
    		} 
    		return -1; //db오류
    	}
    ```
    

- **장바구니 (상품상세페이지에서 주문하기 누르면 카트에 담김)**
- product.jsp (상품상세페이지)
    
    ![상품상세페이지.PNG](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b89bf889-be87-4999-ade2-b4be733a1c0d/%EC%83%81%ED%92%88%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%80.png)
    
    ```java
    <%
    						//클릭한 상품 아이디값 얻기
    						String id = request.getParameter("id");
    						ProductRepository repo = ProductRepository.getInstance();
    
    						//얻은 상품 아이디값으로 해당되는 Product 객체 얻기
    						Product product = repo.getProductById(id);
    						
    					
    						
    					%>
    					<div class="container">
    						<div class="row">
    							<div class="col-md-5">
    								<img alt="" src="Resources/assets/img/portfolio/<%=product.getPimg()%>" style="width: 100%">
    							</div>
    
    							<div class="col-md-6">
    							
    								<h3><%=product.getPname()%></h3>
    								<p><%=product.getPdes()%></p>
    								<p>
    									<b>카테고리 : </b>
    									<%=product.getPcate()%>
    								</p>
    								<p>
    
    									<b>가격 : </b><%=product.getPcost()%>원
    								</p>
    								<p>
    									<b>재고 : </b><%=product.getPstock()%>개
    								</p>
    								
    								<form name="addCartForm" action="addCart.jsp?id=<%=product.getProductId()%>" method="post">
    									<a href="#" class="btn btn-info" onclick="addToCart()")>주문하기 &raquo;</a>
    									<a href="cart.jsp" class="btn btn-primary">장바구니 &raquo;</a>
    								</form>
    							</div>
    
    						</div>
    					</div>
    
    				</div>
    		</section>
    		<script type="text/javascript">
    		function addToCart(){
    			if(confirm('장바구니에 추가하시겠습니까?')){ // 확인 / 취소
    				document.addCartForm.submit();
    			}
    			else{
    				document.addCartForm.reset();
    			}
    			
    		}
    		</script>
    ```
    
- cart.jsp(장바구니)
    
    ![장바구니.PNG](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6518bbdb-cf4b-4b0c-b3f7-2f881acbd9d7/%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%88.png)
    
    ```java
    <%
    	//세션  id값 가져오기
    	String cartId = session.getId();
    	DecimalFormat dF = new DecimalFormat("###,###"); //숫자단위
    %>
    
    <!--중략 -->
    
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
    					
    					//deleteCart.jsp에서  session.invalidate() 호출하면 카트리스트가 null이 됨
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
    ```
    

- **상품등록(관리자)**
- productDAO.java
    
    ```java
    public boolean Product_Insert(Product bean) {
    		Connection con = null;
    		PreparedStatement pstmt = null;
    		String sql = null;
    		boolean flag = false;
    		try {
    			con = pool.getConnection();
    			sql = "insert pers_product(productId,pname,pcost,pdes,pcate"
    					+ ",pstock,pimg)values(?,?,?,?,?,?,?)";
    			pstmt = con.prepareStatement(sql);
    			pstmt.setString(1, bean.getProductId());
    			pstmt.setString(2, bean.getPname());
    			pstmt.setInt(3, bean.getPcost());
    			pstmt.setString(4, bean.getPdes());
    			pstmt.setString(5, bean.getPcate());
    			pstmt.setInt(6, bean.getPstock());
    			pstmt.setString(7, bean.getPimg());
    			if (pstmt.executeUpdate() == 1)
    				flag = true;
    		} catch (Exception e) {
    			e.printStackTrace();
    		} finally {
    			pool.freeConnection(con, pstmt);
    		}
    		return flag;
    	}
    ```
    
- processAddProduct.jsp
    
    ```java
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
    ```
