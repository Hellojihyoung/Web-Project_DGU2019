<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />
<meta http-equiv="Context-Type" content="test/html" charset="UTF-8">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP 게시판 웹 사이트</title>
<style type="text/css">

</style>
<div align="right">
<%
String userID = null;
UserDAO userDAO = new UserDAO();
int result = userDAO.login(user.getUserID(), user.getUserPassword());
if(result == 1){ // 로그인이 성공 했을 경우
		session.setAttribute("userID", user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}

	if (session.getAttribute("userID") == null) { //세션이 설정되지 않을 경우
		result=0;
%>
<a href="join.jsp" title="회원가입">join us</a> <br>

</form>
<%
	} else {
%>
<form method="post" action="logoutAction.jsp">
	<%=session.getAttribute("userID")%>님 환영합니다! &nbsp;&nbsp; <a href="logoutAction.jsp" title="로그아웃">logout </a>&nbsp;&nbsp;&nbsp;&nbsp;  
</form>
<%
	}
%>

</div>
 <br>
<a href="main.jsp"><center> <img
	src="black-final.jpg"
	width="420" height="60"></center>
</a> 
<hr color="#ece6cc">

</head>

<body>
	
	<div class = "container">
		<div class = "col-lg-4"></div>
		<div class = "col-lg-4">
			<div class= "jumbortron" style = "padding-top : 20px;">
				<form method ="post" action ="loginAction.jsp"> <!-- 로그인액션이라는 페이지로 로그인 정보를 보냄-->
					<h3 style="text-align : center;">Login☺</h3>
					<div class = "form-group">
						<input type = "text" class = "form-control" placeholder ="ID" name ="userID" maxlength ="20">
					</div>
					<div class = "form-group">
						<input type = "password" class = "form-control" placeholder ="Password" name ="userPassword" maxlength ="20">
					</div>
					<input type = "submit" class = "btn btn-primary form-control" value = "Login">
				</form>
			</div>
		</div>
		<div class = "col-lg-4"></div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrp.js"></script>
</body>

</html>