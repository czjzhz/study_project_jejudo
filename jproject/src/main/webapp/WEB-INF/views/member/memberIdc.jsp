<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.project.jeju.dao.MemberDao" %>
<%
 request.setCharacterEncoding("utf-8");
 
 String id=request.getParameter("mid"); 
 String pass=request.getParameter("mpass");
 System.out.println("id="+id);
 System.out.println("pass="+pass);
 
 MemberDao md = new MemberDao();

 int re=md.checkMemberId(id);
 //1이면 중복 -1이면 사용가능 아이디

 out.println(re);
%>
 