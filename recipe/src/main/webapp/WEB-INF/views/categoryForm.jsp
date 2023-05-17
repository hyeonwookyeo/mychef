<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String korean = "korean";
	String chinese = "chinese";
	String japanese = "japanese";
	String western = "western";
%>
<h2>
카테고리 폼
</h2> <br><br>

<a href="r_listForm?category=<%=korean%>&pageNum=1">
<img src="images/korean.jpg" width=300 height=300 title="한식">
</a>&nbsp;&nbsp;&nbsp;


<a href="r_listForm?category=<%=chinese%>&pageNum=1">
<img src="images/chinese.jpg" width=300 height=300 title="중식">
</a>&nbsp;&nbsp;&nbsp;

<a href="r_listForm?category=<%=japanese%>&pageNum=1">
<img src="images/japanese.jpg" width=300 height=300 title="일식">
</a>&nbsp;&nbsp;&nbsp;

<a href="r_listForm?category=<%=western%>&pageNum=1">
<img src="images/western.jpg" width=300 height=300 title="양식">
</a>

<h2>
<pre>	    한식			  중식			        일식			      양식</pre>
</h2>

</body>
</html>