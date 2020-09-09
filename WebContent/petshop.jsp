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
	<head> <title> petshop </title>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="info.css">
	<style type="text/css">
footer {
	top: 78%;
	width: 100%;
	background-color: #ece6cc;
}
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
<a href="login.jsp" title="로그인">login </a>&nbsp;&nbsp; 
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
<left> <br>
<a href="main.jsp"> <center><img
	src="black-final.jpg"
	width="420" height="60"></center>
</a> </left>
<hr color="#ece6cc">

</head>
<style type="text/css">
a, a:hover {
	color: #00000;
	text-decoration: none;
}
</style>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"> 

   
   $(function(){
      $("#Button").click(function(){
         $.ajax({ type: "post",
         url: "dog4.html",
         dataType:"html",
         success:function(data){
         $("#info_one").html(data);}
         });
         $('#info_two').empty();
      })
   })
   $(function(){
      $("#Button2").click(function(){
         $.ajax({ type: "post",
         url: "cat4.html",
         dataType:"html",
         success:function(data){
         $("#info_two").html(data);}
         });
         $('#info_one').empty();
      })
   })
   </script>
   <style>
   </style>
   </head>
   <body>
   <div id="container">
   <div id="navi">
   <ul class="h">
      <div id="Button"><li class="h" ><a class="h">멍멍이 상점</a></li></div>
      <div id="Button2"><li class="h" ><a class="h">야옹이 상점</a></li></div>
   </ul>
   </div>
   <div id="info_one"></div>
   <div id="info_two"></div>
   </div>
   </body>

<footer>
   <br>
   <br>
   <center>
      <font size="2" face="돋움체"> <a href="introduce.jsp" title="메인">메인</a>
         <a href="petshop.jsp" title="petshop">Pet Shop</a> 
         <a href="bbs.jsp" title="게시판">게시판</a> <a href="doctorinfo.jsp" title="게시판">Doctor's Advice</a> 
         <a href="selection.jsp" title="about Pet">about Pet</a> <br>Web Programming 2019.12.10 <br>
         @Copyright_ Kangseonghee/ Kwonjihyoung/ Kimjunkyung/ Leesieun<br>
      <br>
      <br>

      </font>
   </center>
</footer>
</html>