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
<title>boardList</title>
</head>

<%
	//java코드 영역(실행부)
	MyDao dao = new MyDao();
	List<MyDto> list = dao.seleletAll();
%>

<body>
	<form action="boardDetail.jsp" method="get">
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
			<td><%=dto.getWriter() %></td>
			<td><a href="boardDetail.jsp?seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></td>
			<td><%=dto.getRegDate() %></td>
		</tr>
		<%
		}
		%>
		<tr>
			<td colspan="4"><a href="boardWrite.jsp">글쓰기</a></td>		
		</tr>
	</table>
	</form>
	
</body>
</html>