<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<script src="./js/jquery.js"></script>
<script src="./js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {				
			document.getElementById('zip').value = data.zonecode;
			document.getElementById('addr1').value = data.address;				
		}
	}).open();
}
</script>
</head>
<body>
  <div id="join_wrap">
  <h2 class="join_title">회원수정</h2>
  <form name="f" method="post" action="m_editForm.ok" onsubmit="return edit_check()" enctype="multipart/form-data">
   <input type="hidden" name="id" value="${editm.id}">
   <table id="join_t">
    <tr>
     <th>회원아이디</th>
     <td>${id}</td>
    </tr>
    		<tr>
					<th>회원닉네임</th>
					<td><input name="nickname" id="nickname" size="14" class="input_box" /> <input
						type="button" value="닉네임 중복체크" class="input_button"
						onclick="nickname_check()" />
						<div id="nickncheck"></div></td>
				</tr>
    <tr>
     <th>회원비번</th>
     <td>
      <input type="password" name="pwd" id="pwd" size="14"
      		class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원비번확인</th>
     <td>
      <input type="password" name="pwd2" id="pwd2" size="14"	class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원이름</th>
     <td>
      <input name="name" id="name" size="14" class="input_box" value="${editm.name}" />
     </td>
    </tr>
    
    <tr>
     <th>우편번호</th>
     <td>
      <input name="zip" id="zip" size="5" class="input_box"
      		readonly onclick="post_search()" value="${editm.zip}"/>
      <input type="button" value="우편번호검색" class="input_button"
      		onclick="openDaumPostcode()" />
     </td>
    </tr>
    
    <tr>
     <th>주소</th>
     <td>
      <input name="addr1" id="addr1" size="50" class="input_box"
      		readonly value="${editm.addr1}" onclick="post_search()" />
     </td>
    </tr>
    
    <tr>
     <th>나머지 주소</th>
     <td>
      <input name="addr2" id="addr2" size="37" 
      		value="${editm.addr2}" class="input_box" />
     </td>
    </tr>
        
    <tr>
     <th>휴대전화번호</th>
     <td>
     <%@ include file="./include/phone_number.jsp" %>
     <select name="phone1">
      <c:forEach var="p" items="${phone}" begin="0" end="5"> 
       	<option value="${p}"  <c:if test="${phone1 == p}"> </c:if>>${p} </option>
      </c:forEach>
     </select>-
     <input name="phone2" id="phone2" size="4" maxlength="4" class="input_box" value="${editm.phone2}"/>-
     <input name="phone3" id="phone3" size="4" maxlength="4" class="input_box" value="${editm.phone3}"/>
     </td>
    </tr>
    
    <tr>
     <th>이메일</th>
     <td>
      <input name="mailid" id="mailid" size="10" 
      class="input_box" value="${editm.mailid}"/>@<input name="domain" 
      id="domain" size="20" class="input_box" readonly value="${editm.domain}" />
      
      <!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 -->
      <select name="mail_list" onchange="domain_list()">
      <option value="">=이메일선택=</option>
      <option value="daum.net" 
      		<c:if test="${editm.domain == 'daum.net'}">${'selected'}
            </c:if>>daum.net</option>
      <option value="nate.com" 
      		<c:if test="${editm.domain == 'nate.com'}">${'selected'}
            </c:if>>nate.com</option>
      <option value="naver.com" 
      		<c:if test="${editm.domain == 'naver.com'}">${'selected'}
            </c:if>>naver.com</option>
      <option value="kakao.com" 
            <c:if test="${editm.domain == 'kakao.com'}">${'selected'}
            </c:if>>kakao.com</option>
      <option value="gmail.com" 
            <c:if test="${editm.domain == 'gmail.com'}">${'selected'}
            </c:if>>gmail.com</option>
      <option value="0">직접입력</option>
     </select> 
     </td>
    </tr>
    
    <tr>
     <th>프로필사진</th>
     <td>
      <input type="file" name="profile1"  id="profile"  />
     </td>
    </tr>
   </table>
   
   <div id="join_menu">
    <input type="submit" value="회원수정" class="input_button" />
    <input type="reset" value="수정취소" class="input_button" 
    		onclick="$('#pwd').focus();" />
   </div>
  </form>
 </div>
</body>
</html>