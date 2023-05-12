// Controller 클래스 테스트
package recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import recipe.model.Test;
import recipe.service.TestService;

@Controller
public class TestController {
	@Autowired
	private TestService ts;
	
	@RequestMapping("/main_test")
	public String main_test(@ModelAttribute Test test, Model model) {
		
		int result = ts.insert(test);
		if(result == 1) System.out.println("DB 입력 테스트 성공");
		
		model.addAttribute("result", result);	// result : 1
		
		return "result/main_test";
	}
	
	
	
	
}
