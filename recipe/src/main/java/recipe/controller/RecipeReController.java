
package recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import recipe.model.RecipeReBoard;
import recipe.service.PagingPgm;
import recipe.service.RecipeReService;

@Controller
public class RecipeReController {

	@Autowired
	private RecipeReService reService;

// 댓글목록	
	@RequestMapping("r_listRe")
	public String r_listRe(String pageNum, int rnum, Model model) {
		
		System.out.println("r_listRe 도착");
		
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
		
		RecipeReBoard reboard = new RecipeReBoard();
		reboard.setStartRow(startRow);
		reboard.setEndRow(endRow);
		reboard.setRnum(rnum);		
		
		List<RecipeReBoard> rlist = reService.listRe(reboard);
		System.out.println("rlist:"+rlist);
		
		model.addAttribute("total", total);
		model.addAttribute("rlist", rlist);
		model.addAttribute("pp", pp);

		return "r_listRe";
	}

// 댓글 등록	
	@RequestMapping("r_insertRe")
	public String r_insertRe(String pageNum, RecipeReBoard reboard
								,@RequestParam("re_rfile1") MultipartFile mf) {
		
		
		
		
		
		reService.r_insertRe(reboard);

		return "";
	}

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
