<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="recipe.dao.*"%>
<%
 request.setCharacterEncoding("utf-8");
 
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
System.out.println("id="+id);
System.out.println("password="+pwd);

MemberDAOImpl md=new MemberDAOImpl();

int re=md.checkMemberId(id); //중복 1 ,사용가능 -1

out.println(re);
 
 %>
