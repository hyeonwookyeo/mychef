<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제</title>
</head>
<body>
ann_Num : ${param.ann_Num } <br>
page : ${param.page }
admin_id : ${param.admin_id }


<form method="post" action="deleteForm">
<input type="hidden" name="ann_Num" value="${param.ann_Num }">
<input type="hidden" name="page" value="${param.page }">
	


<table border=1 width=400 align=center>
  <caption>글삭제</caption>
  <tr>
  <th>삭제</th>
  <td>      
  
  <td>
<a href="boarddeleteform?ann_Num=${board.ann_Num }}" class="btn btn-danger"
  onclick="event.preventDefault(); 
           document.getElementById(boarddeleteform?ann_Num=${board.ann_Num }').submit();">
  Delete
</a>
<form id="boarddeleteform?ann_Num=${board.ann_Num }" method="post" 
  action="/board/deleteresult"> />
</form>

</td>
  <input type="button" onclick="boarddelete" required="required"> </td>
  </tr>
  <tr>
   <td colspan="2" align="center">
     <input type="submit" value="글삭제">
     <input type="reset" value="취소">
   </td>
  </tr>
</table>



</form>
</body>
</html>








































