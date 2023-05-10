<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 폼</title>
</head>
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
<body>
<style type="text/css">

html {
     background-color: #F8F8FF;
}

#join_wrap {
    background-color: 	#FFFFE0;
    display: table;
    width: 850px;
    height: 750px;
    margin: 0 auto;
    top: 500px;
    bottom: 500px;
    border: solid 2px #D8D8D8;
    
    display: flex;
    flex-direction: colum;
    justify-content: center;
    align-items: center;
}
header{height: 75px; background-color: #008000; border: 1px solid #253342;
                position: fixed; width: 100%; z-index; 9999; top:0; left:0;}
                h1{color: white; line-height: 75px; float; left;}


</style>
<header>
<h1>회원정보 수정페이지</h1>
<nav>

</nav>
</header>
</head>
<body>
  <div id="join_wrap">
  <h2 class="join_title">회원수정</h2>
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
      <input name="name" id="name" size="14" class="input_box"
      		value="${editm.name}" />
     </td>
    </tr>
    
    <tr>
     <th>우편번호</th>
     <td>
      <input name="zip" id="zip" size="5" class="input_box"
      		readonly onclick="post_search()" value="${editm.join_zip}"/>
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
     <th>상세 주소</th>
     <td>
      <input name="addr2" id="addr2" size="37" 
      		value="${editm.addr2}" class="input_box" />
     </td>
    </tr>
<tr>
<th>휴대전화번호</th>
<td>
<select name="tel1">
<c:forEach var="t" items=${tel } begin="0" end="5">
<option value=${t } <c:if test="${tel1==t }">
</c:if>>${t }
</c:forEach>
</select>-
<input name="tel2" id="tel2" size="4" maxlength="4" class="input_box" value="${tel2 }"/>-
<input name="tel3" id="tel3" size="4" maxlength="4" class="input_box" value="${tel3 }"/>
</td>
<tr>
   <th>Email</th>
     <td>
  <input name="email" id="email" size="10" 
      class="input_box" value="${email}"/>@<input name="domain" 
      id="domain" size="20" class="input_box" readonly value="${domain}" />
  <select name="email_list" onchange="domain_list()">
      <option value="">=이메일선택=</option>
      <option value="daum.net" 
      		<c:if test="${domain == 'daum.net'}">${'selected'}
            </c:if>>daum.net</option>
      <option value="nate.com" 
      		<c:if test="${domain == 'nate.com'}">${'selected'}
            </c:if>>nate.com</option>
      <option value="naver.com" 
      		<c:if test="${domain == 'naver.com'}">${'selected'}
            </c:if>>naver.com</option>
      <option value="hotmail.com" 
            <c:if test="${domain == 'hotmail.com'}">${'selected'}
            </c:if>>hotmail.com</option>
      <option value="gmail.com" 
            <c:if test="${domain == 'gmail.com'}">${'selected'}
            </c:if>>gmail.com</option>
      <option value="0">직접입력</option>
</select>
  </td>
    </tr>
    <tr>
     <th>프로필사진 첨부</th>
     <td>
      <input type="file" name="profile" />
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