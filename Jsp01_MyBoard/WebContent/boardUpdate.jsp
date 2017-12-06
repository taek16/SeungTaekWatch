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
<title>Insert title here</title>
</head>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	MyDao dao = new MyDao();
	MyDto dto = dao.selectOne(seq);

%>
<body>
	<h1>글 수정</h1>
	<form action="boardUpdate_after.jsp" method="post">
		<input type="hidden" name="seq" value="<%=dto.getSeq() %>" />
		<table border="1">
		<col width="100px"><col width="400px">
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
				<th>제목</th>
				<!-- .jst?seq=값&title=값&... -->
				<td><input type="text" name="title" value="<%=dto.getTitle() %>" /></td>
			</tr>
			<tr>
				<th>내  용</th>
				<td><textarea rows="10" cols="60" name="content"><%=dto.getContent() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" value="수정완료">수정완료</button>
					<input type="button" value="취소" onclick="location.href='boardDetail.jsp?seq=<%=dto.getSeq() %>'" />
				</td>
			</tr>
		</table>
	
	
	
	</form>
	
	
</body>
</html>