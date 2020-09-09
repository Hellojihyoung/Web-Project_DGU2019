<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%>
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
<style type="text/css">
footer {
   top: 78%;
   width: 100%;
   background-color: #ece6cc;
}
#main_move {
   color: black;
   text-align: center;
   font-family: '상상토끼 신비는일곱살';
   font-size: 200%
}
</style>
<title>information</title>
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
<br>
<a href="login.jsp" title="로그인">login </a>&nbsp;&nbsp; 
<a href="join.jsp" title="회원가입">join us</a>&nbsp;&nbsp; <br>

</form>
<%
   } else {
%>
<form method="post" action="logoutAction.jsp">
   <%=session.getAttribute("userID")%>님 환영합니다! &nbsp;&nbsp;  <a href="logoutAction.jsp" title="로그아웃">logout </a>&nbsp;&nbsp;&nbsp;&nbsp; 
</form>
<%
   }
%>
</div>
<center>
   <br>
   <a href="main.jsp"> <img src="black-final.jpg" width="650" height="90"></a>
</center>
</head>
<body>
   <br>
   <br>
   <br>
   <br>
   <center>
      <img src="final-1.jpg" alt="" usemap="#map">
      <div id="main_move">
         <p>원하시는 장소로 이동하세요!</p>
      </div>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
   </center>
   <map name="map" id="map">
      <area shape="rect" coords="384,157,515,292" href="introduce.jsp" alt="">
      <area shape="rect" coords="151,75,281,177" href="bbs.jsp" alt="">
      <area shape="rect" coords="617,72,745,196" href="petshop.jsp"
         alt="">
      <area shape="rect" coords="74,265,187,396" href="doctorinfo.jsp" alt=" ">
      <area shape="rect" coords="718,309,859,431" href="selection.jsp" alt=" ">
   </map>
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
