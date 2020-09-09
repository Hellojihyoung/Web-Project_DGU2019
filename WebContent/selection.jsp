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
   <head> <title> information </title>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" type="text/css" href="info.css">
   <style type="text/css">
footer {
   top: 78%;
   width: 100%;
   background-color: #ece6cc;
}
</style>
<div = "all">
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
<a href="join_us.jsp" title="회원가입">join us</a> <br>

<%
   } else {
%>
<div id = "title">
<form method="post" action="logoutAction.jsp">
   <%=session.getAttribute("userID")%>님 환영합니다! &nbsp;&nbsp; <a href="logoutAction.jsp" title="로그아웃">logout </a>&nbsp;&nbsp;&nbsp;&nbsp;  
</form>
<%
   }
%>
</div>

 <br>
<a href="main.jsp"> <center><img
	src="black-final.jpg"
	width="420" height="60"></center>
</a> 
<hr color="#ece6cc">
</div>
</div>
</head>
<style type="text/css">
a, a:hover {
   color: #00000;
   text-decoration: none;
}
</style>
   <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script type="text/javascript"> 
   $(function(){
      $("#dog").click(function(){
         $("#res").load("dog_main.jsp");
         $("#location").hide();
         $("#title").hide();
         $("#foot").hide();
         });
      })
   $(function(){
      $("#cat").click(function(){
         $("#res2").load("cat_main.jsp");
         $("#location").hide();
         $("#title").hide();
         $("#foot").hide();
         $("#all").hide();
         });
      })
   </script>
   <style>
   h1{color:#bfa680; text-align:center; font-family :'상상토끼 신비는일곱살';}
   #location{text-align:center;}
   </style>
   </head>
   <body>
   <div id = "location">
   <h1>어떤 아이들의 정보를 알고싶으세요?</h1>
   <input type="image" id="dog" src="반려견.PNG"
   width="300" height="200"><br/>
   <input type="image" id="cat" src="반려묘.PNG" 
   width="300" height="200">
   </div>
   <div id="res"></div>
   <div id="res2"></div>
   </body>
   <br><br><br>
   <div id = "foot">
<footer>
   <br>
   <br>
   <center>
      <font size="2" face="돋움체"> <a href="main.jsp" title="메인">메인</a>
         <a href="    " title="petshop">Pet Shop</a> <a href="    "
         title="게시판">게시판</a> <a href="    " title="게시판">Q & A</a> <a
         href="main_txt4.html" title="about Pet">about Pet</a> <br>Web
         Programming 2019.12.10 <br> @Copyright_ Kangseonghee/
         Kwonjihyoung/ Kimjunkyung/ Leesieun<br><br><br>
      </font>
   </center>
</footer></div>
</html>