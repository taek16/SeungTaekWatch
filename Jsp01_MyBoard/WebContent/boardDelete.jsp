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
<title>delete</title>
</head>
<body>

<% 
	//1.가져오기
	int seq = Integer.parseInt(request.getParameter("seq"));

	//2.dao.delete();
	MyDao dao = new MyDao();
	boolean res = dao.delete(seq);
	
	//3.성공 : "삭제하였습니다." boardList로..
	if(res){
%>
	<script type="text/javascript">
		alert("삭제를 성공하였습니다.")
		location.href = "boardList.jsp";
	</script>
	
	<% 
	}else{
	%>
	<script type="text/javascript">
		alert("삭제를 실패하였습니다.")
		location.href = "boardDetail.jsp?seq=<%=seq%>";
	</script>
	<%
	}
	%>
	



%>

</body>
</html>