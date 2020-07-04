<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device -width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){ // 로그인을 하지 않았다면 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) { // 글의 번호가 파라미터로 들어오지 않았다면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다..')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(bbsID); // 세션 체크
		if (!userID.equals(board.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('접근 권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
	    <div class="row">
		    <form method="post" action="updateAction.jsp?bbsID=<%= bbsID%>">
			    <table class="table table-striped" style="text-align:center; border : 1px solid #dddddd;">
			    	<thead>
			    		<tr>
			    		   <th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글 수정 양식</th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<tr>
			    		   <td>
			    		      <input type="text" class="form-control" placeholder="글 제목" 
			    	               name="bbsTitle" maxlength="50" value="<%= board.getBbsTitle()%>">
			    	       </td>
			    	    </tr>
			    	    <tr>
			    		   <td>
			    		   	   <textarea class="form-control" placeholder="글 내용" name="bbsContent" 
			    		   	   			 maxlength="2048" style="height : 350px;"><%= board.getBbsContent()%>
			    		   	   </textarea>
			    		   </td>
			    		</tr>
			    	</tbody>
			    </table>
		    <input type="submit" class="btn btn-primary pull-right" value="글수정"/>
		    </form>
	    </div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>