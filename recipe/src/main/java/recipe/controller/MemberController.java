package recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import recipe.model.MemberBean;
import recipe.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberServiceImpl service;
	
	//로그인폼
	@RequestMapping(value = "/member_login")
	public String member_login() {
		System.out.println("로그인폼 컨트롤러");
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
}

