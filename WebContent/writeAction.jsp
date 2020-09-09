<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%	request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Context-Type" content="test/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("<script>");
		} else { // 로그인이 되어 있는 사람의 경우 else 하위 항목 실행
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) { // 제목이나 글 작성 안했을 경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO(); // 인스턴스 생성
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent()); // 실제로 글 작성하기
				
				if (result == -1) { // 데이터베이스 오류 생성
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()"); // 이전 페이지로 이동
					script.println("</script>");
				} else { // 글쓰기에 성공했을 경우
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'"); // 게시판 메인 화면으로 이동
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>