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
	width="420" height="60"></center>
</a>
<hr color="#ece6cc">

</head>
<style type="text/css">
a, a:hover {
	color: #00000;
	text-decoration: none;
}
</style>
<body>
	<%
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">No</th>
						<th style="background-color: #eeeeee; text-align: center;">Title</th>
						<th style="background-color: #eeeeee; text-align: center;">ID</th>
						<th style="background-color: #eeeeee; text-align: center;">Date</th>
					</tr>
				</thead>

				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
			<center>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left">이전</a>
				</center>
			<%
				}
				if (bbsDAO.nextPage(pageNumber + 1)) { //다음 페이지 존재 여부 확인
			%>
			<center>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success btn-arrow-left">다음</a>
			</center>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrp.js"></script>
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