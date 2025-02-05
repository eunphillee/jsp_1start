<%@page import="vo.UserAccountVO"%>
<%@page import="dao.UserAccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5_loginProc.jsp</title>
</head>
<body>
     <%
     	String userid = request.getParameter("userid");
     	String password = request.getParameter("password");
     	
     	//SQL 실행을 위해 UserAccountDao의 객체를 가여오기 
     	UserAccountDao dao = UserAccountDao.getInstance();
     	// 로그인 sql 실행을 위한 메소드 호출 
     	UserAccountVO vo = dao.SelectForLogin(userid, password);
     	if(vo !=null) {
     		out.print("<h2>로그인 성공 했습니다.</h2>");
     		
     	}else{
     		out.print("<h2>로그인 실패 했습니다.</h2>");
     		out.print("로그인 정보를 확인해 주세요");
     	}
     %>
</body>
</html>