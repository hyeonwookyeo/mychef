package recipe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recipe.model.RecipeBoard;
import recipe.service.PagingPgm;
import recipe.service.RecipeService;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	HttpSession session;

// 카테고리 폼
	@RequestMapping("categoryForm")
	public String category() {
		return "categoryForm";
	}
	
	
// 레시피 목록 폼	
	@RequestMapping("r_listForm")
	public String listform() {
		
		return "r_list";
	}

// 목록	
	@RequestMapping("r_list")
	public String Recipelist(String pageNum, RecipeBoard board, Model model) {
		
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// int total = bs.getTotal();
		int total = service.getTotal(board); // 검색
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int number = total - startRow + 1;
		List<RecipeBoard> list = service.r_list(board);
		model.addAttribute("list", list);
		model.addAttribute("number", number);
		model.addAttribute("pp", pp);
		// 검색
//		model.addAttribute("search", board.getSearch());
//		model.addAttribute("keyword", board.getKeyword());
		
		return "r_list";
	}
	
// 레시피 작성폼
	@RequestMapping("r_insertForm")
	public String insertform(String pageNum, Model model) {
		
		model.addAttribute("pageNum", pageNum);
		
		return "r_insertForm";
	}
	
// 작성	
	@RequestMapping(value="r_insert",  method = RequestMethod.POST)
//	public String insert(@RequestParam("rfile1")  MultipartFile mf, RecipeBoard board, String pageNum,
			public String insert(RecipeBoard board, String pageNum,
						 HttpServletRequest request, Model model) {
		System.out.println("진입");
		
//		String filename = mf.getOriginalFilename();
//		int filesize = (int) mf.getSize();
//		System.out.println("filename:"+filename);
		
		String path = request.getRealPath("upload");
		System.out.println("path:"+path);
		
		String ip = request.getRemoteAddr();
		
		board.setIp(ip);
		
		System.out.println(ip);
		
		String ingre = "";
		String[] ingreEx = request.getParameterValues("ingre");

		for(String i : ingreEx) {
			ingre += i+"-";			// 재료1-재료2
		}		
		
		System.out.println("재료:"+ingre);
		
		String capacity = "";
		String[] capacityEx = request.getParameterValues("ingre");

		for(String i : capacityEx) {
			capacity += i+"-";		// 용량1-용량2
		}		
		
		System.out.println("용량:"+capacity);
		
		
		int result = service.r_insert(board);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		
		return "result/r_insertResult";
	}
	
// 레시피 상세페이지 
	@RequestMapping("r_view")
	public String rview(String pageNum, int rnum, Model model) {
		
		service.r_readcountUpdate(rnum);
		
		RecipeBoard board = service.r_select(rnum);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		
		return "r_view";
	}
	
// 레시피 수정폼	
	@RequestMapping("r_updateForm")
	public String rupdate(String pageNum, int rnum, Model model) {
		
		RecipeBoard board = service.r_select(rnum);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		
		return "r_updateForm";
	}
	
//	수정
	@RequestMapping("r_update")
	public String r_update(String pageNum, RecipeBoard board, Model model) {
		
		service.r_update(board);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		
		return "result/r_updateResult";
	}
	
// 레시피 삭제폼 
	@RequestMapping("r_deleteForm")
	public String rselect(String pageNum, int rnum, Model model) {
		
		RecipeBoard board = service.r_select(rnum);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		
		return "r_delete";
	}
// 삭제
	@RequestMapping("r_delete")
	public String r_delete(String pageNum, RecipeBoard board, Model model) {
		
		int result = service.r_delete(board.getRnum());
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		
		return "result/r_deleteResult";
	}

}
