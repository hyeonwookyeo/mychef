
package recipe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import recipe.model.RecipeReBoard;
import recipe.service.PagingPgm;
import recipe.service.RecipeReService;
import recipe.service.RecipeService;

@Controller
public class RecipeReController {

	@Autowired
	private RecipeReService reService;

// 댓글목록	
	@RequestMapping("r_listRe")
	public String r_listRe(String pageNum, int rnum, Model model) {
		
		final int rowPerPage = 5;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = reService.getTotalRe(rnum);
		
		System.out.println("total:"+total);
		System.out.println("rowPerPage"+rowPerPage);
		System.out.println("currentPage"+currentPage);		
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		System.out.println("startRow"+startRow);
		System.out.println("endRow"+endRow);
		
		
		List<RecipeReBoard> rlist = reService.listRe(rnum);
		
		model.addAttribute("total", total);
		model.addAttribute("rlist", rlist);
		model.addAttribute("pp", pp);

		return "r_listRe";
	}

// 댓글 등록	
	@RequestMapping("r_insertRe")
	public String r_insertRe() {

		return "redirect:rlistRe?rnum=";
	} //

// 댓글수정	
	@RequestMapping("r_updateRe")
	public String r_updateRe() {

		return "";
	} 

// 댓글삭제	
	@RequestMapping("r_deleteRe") 
	public String r_deleteRe() {
 
		return "";
	}
 
 } // class end
