<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User" %>
<jsp:useBean id="userdao" class="user.UserDAO"/>
<jsp:useBean id="user" class="user.User"/>
<<jsp:setProperty property="*" name="user"/>
<%
//회원정보 수정하는 페이지
String userID = (String) session.getAttribute("userID");
User userinfo = userdao.getMember(userID);
//로그인상태 아니면 로그인페이지로 가거랏
if (userID == null) {
	response.sendRedirect("login.jsp");

}
int update = userdao.updateMember(user); 
if(update > 0){
%>
<script type="text/javascript">
alert("회원정보 수정완료");
location.href="myInfo.jsp";

</script>
<%} else { %>
<script type="text/javascript">
alert("수정 실패");
history.back();
</script>
<%} %>
