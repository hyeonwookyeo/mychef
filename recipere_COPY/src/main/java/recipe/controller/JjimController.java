package recipe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recipe.model.Recipe_Jjim;
import recipe.service.JjimService;

@Controller
public class JjimController {	

	@Autowired
	private JjimService  service;
	
	//찜등록
		@RequestMapping(value="/m_jjimregister")
	 	public String m_Jjim(@ModelAttribute Recipe_Jjim jjim , Model model) {
				
			// insert sql실행
			int result = service.insert(jjim);
			if(result == 1) System.out.println(" 찜등록 완료");
			
		return "redirect:m_jjimlist";
		}
	
	//찜목록
	@RequestMapping(value="/m_jjimlist")
 	public String m_Jjim(Model model) {
		
	List<Recipe_Jjim> jlist = service.getList();
	System.out.println(" 찜목롣:"+  jlist);

	model.addAttribute("jlist", jlist);	
	
	return "m_jjimlist";
	}

}