
package recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import recipe.service.RecipeReService;

@Controller
public class RecipeReController {

	@Autowired
	private RecipeReService reService;

	@RequestMapping("r_listRe")
	public String r_listRe(String rnum) {

		return "";
	}

	@RequestMapping("r_insertRe")
	public String r_insertRe() {

		return "redirect:rlistRe?rnum=";
	} //

	@RequestMapping("r_updateRe")
	public String r_updateRe() {

		return "";
	} //

	@RequestMapping("r_deleteRe") public String r_deleteRe() {
 
		return "";
	}
 
 } // class end
