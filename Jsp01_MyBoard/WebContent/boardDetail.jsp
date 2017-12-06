<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 추가 시작 -->
<%@ page import="com.dto.MyDto" %>
<%@ page import="com.dao.MyDao" %>

<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!-- 추가 끝 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selectOne</title>
</head>
<%
	String seqNo = request.getParameter("seq");
	int seq = Integer.parseInt(seqNo);
	
	MyDao dao = new MyDao();
	MyDto dto = dao.selectOne(seq);
%>
<body>

	<h1>게시글 상세보기</h1>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<td><%=dto.getSeq() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegDate() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><textarea rows="10" cols="60" readonly="readonly"><%=dto.getContent() %></textarea>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='boardUpdate.jsp?seq=<%=dto.getSeq() %>'"/>
				<input type="button" value="삭제" onclick="location.href='boardDelete.jsp?seq=<%=dto.getSeq() %>'"/>
				<input type="button" value="목록" onclick="location.href='boardList.jsp'"/>
			</td>
		</tr>
	</table>

</body>
</html>