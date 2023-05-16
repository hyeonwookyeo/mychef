<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="recipe.dao.*" %>

<% 
 request.setCharacterEncoding("utf-8");
 
 String id=request.getParameter("memid"); 
 String pass=request.getParameter("mempass");
 System.out.println("id="+id);
 System.out.println("pass="+pass);
 
 MemberDAOImpl md = new MemberDAOImpl();

 int re=md.checkMemberId(id);


 out.println(re);

 
 %>
 