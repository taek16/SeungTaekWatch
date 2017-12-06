<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 추가 시작 -->
<%@ page import="com.dto.MyDto" %>
<%@ page import="com.dao.MyDao" %>
<%@ page import="java.util.List"%>

<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!-- 추가 끝 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insert</title>
</head>
<body>
	<h1>글 작성</h1>
	<form action="boardWrite_after.jsp" method="post">
		<table border="1">
			<col width="100px"><col width="400px">
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" /></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" /></td>
			</tr>
		</table>
	
	
	
	</form>
	
	
</body>
</html>