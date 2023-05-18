<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정폼</title>
</head>
<body>
<script>
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {				
			document.getElementById('join_zip').value = data.zonecode;
			document.getElementById('join_addr1').value = data.address;				
		}
	}).open();
}
</script>
</head>
<body>
  <div id="join_wrap">
  <h2 class="join_title">회원수정폼</h2>
  <form name="f" method="post" action="member_edit_ok.do"
  		onsubmit="return edit_check()" enctype="multipart/form-data">
   <table id="join_t">
    <tr>
 <th>회원아이디</th>
     <td>${id}</td>
    </tr>
    
    <tr>
     <th>회원이름</th>
     <td>
      <input name="join_name" id="join_name" size="14" class="input_box"
      		value="${editm.join_name}" />
     </td>
    </tr>
    
    <tr>
     <th>우편번호</th>
     <td>
      <input name="join_zip" id="join_zip" size="5" class="input_box"
      		readonly onclick="post_search()" value="${editm.join_zip}"/>
      <input type="button" value="우편번호검색" class="input_button"
      		onclick="openDaumPostcode()" />
     </td>
    </tr>
    
    <tr>
     <th>주소</th>
     <td>
      <input name="join_addr1" id="join_addr1" size="50" class="input_box"
      		readonly value="${editm.join_addr1}" onclick="post_search()" />
     </td>
    </tr>
    
    <tr>
     <th>상세 주소</th>
     <td>
      <input name="join_addr2" id="join_addr2" size="37" 
      		value="${editm.join_addr2}" class="input_box" />
     </td>
    </tr>
     
   <tr>
     <th>휴대전화번호</th>
     <td>
     <select name="join_phone1">
      <c:forEach var="p" items="${phone}" begin="0" end="5">
       <option value="${p}" <c:if test="${join_phone1 == p}">
          </c:if>>${p}
        </option>
      </c:forEach>
     </select>-
     <input name="join_phone2" id="join_phone2" size="4" maxlength="4" class="input_box" value="${join_phone2}"/>-
     <input name="join_phone3" id="join_phone3" size="4" maxlength="4" class="input_box" value="${join_phone3}"/>
     </td>
    </tr>
    
    <tr>
     <th>Email</th>
     <td>
      <input name="join_mailid" id="join_mailid" size="10" 
      class="input_box" value="${join_mailid}"/>@<input name="join_maildomain" 
      id="join_maildomain" size="20" class="input_box" readonly value="${join_maildomain}" />
      
      <!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 -->
      <select name="mail_list" onchange="domain_list()">
      <option value="">=이메일선택=</option>
      <option value="daum.net" 
      		<c:if test="${join_maildomain == 'daum.net'}">${'selected'}
            </c:if>>daum.net</option>
      <option value="nate.com" 
      		<c:if test="${join_maildomain == 'nate.com'}">${'selected'}
            </c:if>>nate.com</option>
      <option value="naver.com" 
      		<c:if test="${join_maildomain == 'naver.com'}">${'selected'}
            </c:if>>naver.com</option>
      <option value="hotmail.com" 
            <c:if test="${join_maildomain == 'hotmail.com'}">${'selected'}
            </c:if>>hotmail.com</option>
      <option value="gmail.com" 
            <c:if test="${join_maildomain == 'gmail.com'}">${'selected'}
            </c:if>>gmail.com</option>
      <option value="0">직접입력</option>
     </select> 
     </td>
    </tr>
    
    <tr>
     <th>프로필사진 첨부</th>
     <td>
      <input type="file" name="join_profile1" />
     </td>
    </tr>
   </table>
   
   <div id="join_menu">
    <input type="submit" value="회원수정" class="input_button" />
    <input type="reset" value="수정취소" class="input_button" 
    		onclick="$('#join_pwd1').focus();" />
   </div>
  </form>
 </div>

</body>
</html>