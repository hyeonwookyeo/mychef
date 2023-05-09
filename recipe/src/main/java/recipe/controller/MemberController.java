package recipe.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recipe.model.MemberBean;
import recipe.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberServiceImpl service;
	
	// ID 중복검사
	@RequestMapping (value = "/join_idCheck", method = RequestMethod.POST)
		public String join_idCheck(@RequestParam("id") String id, Model model) throws Exception{
		System.out.println("id:"+id);
		
		int result = service.IdCheck(id);
		model.addAttribute("result", result);
		
		return "member/idcheckResult";
	}
	
	//로그인폼
	@RequestMapping(value = "/member_login")
	public String member_login() {
		return "member/member_login";
	}
	
	/* 회원가입 폼 */
	@RequestMapping(value = "/member_join")
	public String member_join() {
		return "member/member_join";
	}
	
//	// 로그인 인증
//	@RequestMapping(value = "/member_login_ok.do", method = RequestMethod.POST)
//	public String member_login_ok(@RequestParam("id") String id, 
//			                      @RequestParam("pwd") String pwd,
//			                      HttpSession session, 
//			                      Model model) throws Exception {
//		int result=0;		
//		MemberBean m = service.userCheck(id);
//
//		if (m == null) {	// 등록되지 않은 회원일때
//			
//			result = 1;
//			model.addAttribute("result", result);
//			
//			return "member/loginResult";
//			
//		} else {			// 등록된 회원일때
//			if (m.getJoin_pwd().equals(pwd)) {			// 비번이 같을때
//				session.setAttribute("id", id);
//
//				String join_name = m.getJoin_name();
//				String join_profile = m.getJoin_profile();
//
//				model.addAttribute("name", name);
//				model.addAttribute("profile", profile);
//
//				return "member/main";
//				
//			} else {									// 비번이 다를때
//				result = 2;
//				model.addAttribute("result", result);
//				
//				return "member/loginResult";				
//			}
//		}
//
//	}
	
	// ID찾기
	@RequestMapping(value = "/id_find")
	public String id_find() {
		return "member/id_find";
	}
	
	// ID 찾기 완료
	@RequestMapping(value = "/id_find_ok", method = RequestMethod.POST)
	public String id_find_ok(@ModelAttribute MemberBean mem, Model model) throws Exception{
		MemberBean member = service.findid(mem);
		if (member == null) { // 해당 id가 없는 경우 
			return "member/idResult";
		} else {
			model.addAttribute("member", member);
			return "member/id_find";
		}
		
	}
	
	// 비번찾기
		@RequestMapping(value = "/pwd_find")
		public String pwd_find() {
			return "member/pwd_find";
		}
		

	// 비번찾기 완료 
		@RequestMapping(value = "/pwd_find_ok", method = RequestMethod.POST)
		public String pwd_find_ok(@ModelAttribute MemberBean mem, Model model)
				throws Exception {

			MemberBean member = service.findpwd(mem);

			if (member == null) {// 값이 없는 경우
				return "member/pwdResult";

			} else {

				// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "ymj2677@naver.com";
				String hostSMTPpwd = "nav0211##"; 		// 비밀번호 입력해야함

				// 보내는 사람 EMail, 제목, 내용
				String fromEmail = "ymj2677@naver.com";
				String fromName = "관리자";
				String subject = "비밀번호 찾기";

				// 받는 사람 E-Mail 주소
				String mail = member.getEmail()+"@"+member.getDomain();
				System.out.println(mail);

				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(587);

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호 : "
							+ member.getPwd() /*보낼 내용*/+ "</div>");
					email.send();
				} catch (Exception e) {
					e.printStackTrace();
				}

				model.addAttribute("pwdok", "등록된 email을 확인 하세요~!!");
				return "member/pwd_find";

			}

		}
}

