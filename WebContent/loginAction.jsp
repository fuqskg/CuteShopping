<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"	 %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!-- 유즈빈, 프로퍼티로 객체를 갖고옴 -->
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPw"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 확인</title>
</head>
<body>
<%
//파라미터를 이용해서 아이디 비밀번호를 받는당.
String userID = request.getParameter("userID");
String userPw = request.getParameter("userPw");
String userName = request.getParameter("userName");
UserDAO userDAO = new UserDAO();
int result = userDAO.login(user.getUserID(), user.getUserPw());
if (result ==1){
	//로그인 성공하면 아읻를 세션에 저장
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

</body>
</html>