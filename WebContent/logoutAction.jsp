<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Context-Type" content="test/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트(로그아웃)</title>
</head>
<body>
 <%
	session.invalidate(); // 세션을 가져가서 로그아웃 시켜주기
 %>
 <script>
 	location.href = "main.jsp";
 </script>
</body>
</html>