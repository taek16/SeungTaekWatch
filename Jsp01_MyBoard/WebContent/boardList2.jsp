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
<%
	MyDao dao = new MyDao();
	List<MyDto> list = dao.seleletAll();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<col width="50px">
		<col width="100px">
		<col width="300px">
		<col width="100px">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<%
		for(int i = 0; i < list.size(); i++){
			MyDto dto = list.get(i);

		%>
		<tr>
			<td><%=dto.getSeq() %></td>
		
		</tr>		
		<%
		}
		%>
		
	
	
	
	</table>

</body>
</html>