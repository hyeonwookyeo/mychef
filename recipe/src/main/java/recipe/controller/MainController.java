// 메인 컨트롤러
package recipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
     
	}
	
