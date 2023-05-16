<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#008000), to(#2ca38f));
      background: -webkit-linear-gradient(bottom left, #008000 0%, #2ca38f 100%);
      background: -moz-linear-gradient(bottom left, #008000 0%, #2ca38f 100%);
      background: -o-linear-gradient(bottom left, #008000 0%,#2ca38f 100%);
      background: linear-gradient(to top right, #008000 0%, #2ca38f 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
<title>회원정보 수정 폼</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
<body>
   <div class="input-form col-md-12 mx-auto">
<header>
<h1>회원정보 수정페이지</h1>
<nav>
</nav>
</header>
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
     <th>회원비번</th>
     <td>
      <input type="password" name="join_pwd" id="join_pwd1" size="14"
      		class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원비번확인</th>
     <td>
      <input type="password" name="join_pwd2" id="join_pwd2" size="14"
      		class="input_box" />
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
     <th>상세 주소</th>
     <td>
      <input name="addr2" id="addr2" size="37" 
      		value="${editm.addr2}" class="input_box" />
     </td>
    </tr>
    <tr>
     <th>휴대전화번호</th>
     <td>
     <%@ include file="../include/phone_number.jsp" %>
     <select name="phone1">
      <c:forEach var="p" items="${phone}" begin="0" end="5">
       <option value="${p}" <c:if test="${phone1 == p}">${'selected'}
          </c:if>>${p}
        </option>
      </c:forEach>
     </select>-
     <input name="phone2" id="phone2" size="4" maxlength="4" class="input_box" value="${phone2}"/>-
     <input name="phone3" id="phone3" size="4" maxlength="4" class="input_box" value="${phone3}"/>
     </td>
    </tr>

<tr>
     <th>이메일</th>
     <td>
      <input name="join_mailid" id="join_mailid" size="10" 
      class="input_box" value="${join_mailid}"/>@<input name="domain" 
      id="domain" size="20" class="input_box" readonly value="${domain}" />
      
      <!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 -->
      <select name="mail_list" onchange="domain_list()">
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
</div>

</body>
</html>