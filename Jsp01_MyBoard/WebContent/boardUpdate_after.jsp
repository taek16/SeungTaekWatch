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
<body>
<%
	//1. update.jsp에서 보낸 값들을 저장한다. (변수에)
	int seq = Integer.parseInt(request.getParameter("seq"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//2. 변수에 있는 값들을 dto에 저장한다.
	MyDto dto = new MyDto(seq,title,content);
	
	//3. dto를 dao.update에 전달한다.
	MyDao dao = new MyDao();
	boolean res = dao.update(dto);
	
	//4. db의 성공여부를 받아서 "수정하였습니다." or "수정 실패하였습니다.".를
	//	 alert으로 띄운다.
	//4-1. 성공여부에 따라 detail.jsp(성공)로 보내거나, update.jsp(실패)로 보낸다.
	if(res == true){
	%>	
		<script type="text/javascript">
			alert("수정 성공하였습니다.");
			location.href="boardList.jsp";
		</script>	
	<%	
	}else{
	%>
	<script type="text/javascript">
		alert("수정 실패하였습니다.");
		location.href="boardUpdate.jsp?seq=<%=dto.getSeq()%>";
	</script>
	<%
	}
	%>
</body>
</html>