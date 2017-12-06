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
<title>Insert</title>
</head>
<body>
	
<%
	//Jsp01_myboard/boardWrite_after.jsp?writer=...&
	//writher==... 이 값을.
	//(boardWrite.jsp/form/input name="writer 가 가지고 있는 값")
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	MyDto dto = new MyDto(writer,title,content);
	MyDao dao = new MyDao();
	
	int res = dao.insert(dto);
	
	if(res > 0){
%>

<script type="text/javascript">
	alert("새로운 글 등록 완료!");
	location.href = "boardList.jsp";
</script>		
<% 
	}else{
%>
	<script type="text/javascript">
		alert("글 등록에 실패!!");
		location.href = "boardList.jsp";
	</script>
<%
	}
%>




</body>
</html>