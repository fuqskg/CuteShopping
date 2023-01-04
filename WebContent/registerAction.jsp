<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="user" class="user.User"/>
<jsp:useBean id="userdao" class="user.UserDAO"/>
<jsp:setProperty  name="user" property="*"/>
<%@ page import="java.io.PrintWriter"%>

<%
int result = userdao.join(user);
if(result >0){
%>
<script type="text/javascript">
alert("회원이 되신 것을 환영합니다.");
location.href="login.jsp";
</script>
<% } else { %>
<script type="text/javascript">
alert("잘못 입력된 항목이 있는지 확인해주세요.");
history.back();
</script>
</script>
<%} %>