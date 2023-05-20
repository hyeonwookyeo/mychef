package recipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	//마이페이지
	@RequestMapping("m_mypage")
	public String m_mypage() {
		return"m_mypage";
	}

}
