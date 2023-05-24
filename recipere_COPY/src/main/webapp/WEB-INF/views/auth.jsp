<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String memberLevel = "admin"; // 저장할 memberLevel 값
    String admin_id = "admin"; // 저장할 admin_id 값
    String admin_pwd = "1234"; // 저장할 admin_pwd 값

    // 세션에 memberLevel 변수 저장
    session.setAttribute("memberLevel", memberLevel);
    // 세션에 admin_id 변수 저장
    session.setAttribute("admin_id", admin_id);
    // 세션에 admin_pwd 변수 저장
    session.setAttribute("admin_pwd", admin_pwd);
    
    if (memberLevel.equals("admin")) {
        // 관리자 권한 로직 처리
        // ...
    }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <%
    String memberLevel = "admin"; // 저장할 memberLevel 값
    String adminId = "admin"; // 저장할 admin_id 값
    String adminPwd = "1234"; // 저장할 admin_pwd 값

    // 세션에 memberLevel 변수 저장
    session.setAttribute("memberLevel", memberLevel);
    // 세션에 admin_id 변수 저장
    session.setAttribute("admin_id", adminId);
    // 세션에 admin_pwd 변수 저장
    session.setAttribute("admin_pwd", adminPwd);
    
    if (memberLevel.equals("admin")) {
        // 관리자 권한 로직 처리
        // ...
    }
%>
 --%>
 
 <script>
    var sessionId = "<%= session.getAttribute("memberLevel") %>";
  </script>

  <!-- JavaScript 코드를 넣을 부분 -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function() {
      if (sessionId != "") {
        $("#m_mypage").css("display", "block");
        $("#m_logOut").css("display", "block");
        $("#SessionCheckInter").css("display", "none");
        $("#m_loginForm").css("display", "none");
      } else {
        $("#m_mypage").css("display", "none");
        $("#m_logOut").css("display", "none");
        $("#SessionCheckInter").css("display", "block");
        $("#m_loginForm").css("display", "block");
      }
    });
  </script>


 <!-- JavaScript 코드를 넣을 부분 -->
  <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function() {
      if (sessionId != "") {
        $("#a_main").css("display", "block");
        $("#a_Logout").css("display", "block");
        $("#a_loginResult").css("display", "none");
        $("#a_loginForm").css("display", "none");
      } else {
        $("#a_main").css("display", "none");
        $("#a_Logout").css("display", "none");
        $("#a_loginResult").css("display", "block");
        $("#a_loginForm").css("display", "block");
      }
    });
  </script> -->



</body>
</html>