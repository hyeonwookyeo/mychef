<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="recipe.dao.*"%>
<%
 request.setCharacterEncoding("utf-8");
 
String nickname = request.getParameter("memnick");
System.out.println("nickname="+nickname);

MemberDAOImpl md=new MemberDAOImpl();

int re = md.checkMemberNickname(nickname);//중복 1 ,사용가능 -1

out.println(re);
 
 %>
