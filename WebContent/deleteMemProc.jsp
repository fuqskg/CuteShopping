<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>

<%

String id = (String) session.getAttribute("userID");

UserDAO userdao = new UserDAO();
int check = userdao.memDel(id);

if(check > 0) {
	session.invalidate();
%>
<script type="text/javascript">
alert("ȸ�� Ż�� �Ϸ�.");
location.href='index.jsp';
</script>
<%} else { %>
<script type="text/javascript">
alert("��й�ȣ�� �ٽ� Ȯ�����ּ���.");
history.go(-1);
</script>

<%}%>