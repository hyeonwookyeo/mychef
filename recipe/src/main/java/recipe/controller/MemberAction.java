package recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberAction {
	

	/*회원정보 수정 폼*/
	@RequestMapping("/member_edit")
	public String member_edit() {
		
		return "member_edit";
	}
	/*로그인 폼*/
	@RequestMapping("/member_login")
	public String member_login() {
		
		return "member_login";
	}
    /* 회원정보 삭제 폼 */
		@RequestMapping("/member_del")
		public String member_del(HttpSession session, Model dm ) throws Exception {
	
			return "member_del";
		}
	

}
