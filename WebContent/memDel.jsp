<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="userdao" class="user.UserDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int result = userdao.memDel(request.getParameter("id"));

String msg = "삭제 실패";
if(result > 0){
	msg = "삭제 완료되었습니다.";
}

%>

<script>
alert(" <%=msg%> ");
location.href="manageMem.jsp";
</script>
</body>
</html>