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
<br>
<a href="main.jsp"> <center><img
	src="black-final.jpg"
	width="420" height="60"><center>
</a> 
<hr color="#ece6cc">
   <style>
      .my-box { border:1px solid #bfa680; padding:50px; margin:20px 200px 20px 200px; }
      #spa{color:#bfa680; font-family :'상상토끼 신비는일곱살'; font-size:150%; background-color:#fbceb1;}
      #sp{color:#e0c096; font-family :'상상토끼 신비는일곱살'; font-size:170%; background-color:#f5f5dc;}
      h4{color:#bfa680;font-family :'DX경필명조B';font-size:40%;}
      h3{color:black; font-family :'DX경필명조B';font-weight:bold; font-size:60%;}
      h1{color:#e0c096; text-align:center;font-family :'Amatic SC'; font-size:350%;}
      h2{color:#bfa680; font-family :'상상토끼 신비는일곱살'; font-size:200%;}
      #p{font-family :'DX경필명조B';font-size:90%; font-weight:bold;}
      #a{font-family :'DX경필명조B'; font-size:120%;}
   </style>
   </head>
   <body>
   <form action="#">
   <h1>PET VILLAGE</h1>
   <center><h2>는 이런 곳입니다.</h2 ></center>
   <h4 style="text-align:center;">------------------------------------------------------------</h4>
   <div class="my-box">
   <span id="sp">* 이런 분들에게 추천합니다 </span><br/><br/><br/>
   <div id="p"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;멍멍이를 처음 기르시는분
   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;야옹이를 처음 기르시는분</div><br/>
   <div id="p"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
   건강하고 특별한 간식을 만들어주고 싶은 분</div><br/>
   <div id="p">&emsp;&emsp;내 펫의 이상한 행동을 알고싶으신 분&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;내 펫과 의사소통을 하고싶으신 분</div><br/>
   <div id="p">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;동물들을 위한 착한 사이트를 알고싶으신 분</div><br/><br/><br/><br/><br/>
   <span id="sp">* 자신의 멍멍이('ㅈ')&nbsp;&nbsp;야옹이('ㅅ')를 자랑하세요! </h3><br/><br/>
   <h3> 수의사의 조언을 얻을 수 있습니다.</h3>
   <h3> 커뮤니티를 통해 자신의 펫을 자랑하실 수 있습니다.</h3><br/>
   <h3> 또한, 자신의 애기에 대한 고민이 있으시다면</h3>
   <h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자신의 애기의 건강이 걱정되시다면</h3>
   <h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자신의 애기를 더 잘 관리하고 싶으시다면</h3><br/><br/>
   <center><span id="spa"> Pet Village에 잘 오셨습니다:) </span><br/><br/><br/></center>
   <h4 style="text-align:center;">------------------------------------------------------------</h4>
   </div>
   </form>
   </body>
   <footer>
	<br>
	<br>
	<center>
		<font size="2" face="돋움체"> <a href="main.jsp" title="메인">메인</a>
			<a href="petshop.jsp" title="petshop">Pet Shop</a> 
			<a href="bbs.jsp" title="게시판">게시판</a> <a href="    " title="게시판">Q & A</a> 
			<a href="selection.jsp" title="about Pet">about Pet</a> <br>Web Programming 2019.12.10 <br>
			@Copyright_ Kangseonghee/ Kwonjihyoung/ Kimjunkyung/ Leesieun<br>
		<br>
		<br>

		</font>
	</center>
</footer>
</html>
   
   