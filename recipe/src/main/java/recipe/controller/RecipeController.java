package recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String Recipelist(String pageNum, RecipeBoard board, Model model) {
		
		System.out.println("r_list");
		
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// int total = bs.getTotal();
		int total = service.getTotal(board); // 검색
		System.out.println("total:"+total);
		
		System.out.println(total);
		System.out.println("rowPerPage"+rowPerPage);
		System.out.println("currentPage"+currentPage);		
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		System.out.println("startRow"+startRow);
		System.out.println("endRow"+endRow);
		
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int number = total - startRow + 1;
		
		List<RecipeBoard> list = service.r_list(board);
		System.out.println("list:"+list);
		
		System.out.println(startRow + "+" + endRow);
		
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
	
	
	
// 레시피 작성	
	@RequestMapping(value="r_insert",  method = RequestMethod.POST)
	public String insert(@RequestParam("thumbnail1") MultipartFile mf1,
//						@RequestParam("r_file1") MultipartFile mf2,
						MultipartHttpServletRequest mhr,
						RecipeBoard board, String pageNum,
						HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("진입");
		
		// 조리사진 내용
		String[] contentList = request.getParameterValues("content1");
		String content = "";
		
		for(String i : contentList) {
			content += i+"-";			// 내용1-내용2
		}	
		
		System.out.println("contentList:" + contentList);
		System.out.println("content:" + content);
		
		board.setContent(content);
		
		// 썸네일사진
		String thumbFileName = mf1.getOriginalFilename();
		int thumbFileSize = (int) mf1.getSize();
		String thumbpath = request.getRealPath("t_images");
		String thumbNewFileName = "";
		
		if(thumbFileName!="") {
			String extension = thumbFileName.substring(thumbFileName.lastIndexOf("."), thumbFileName.length());
			UUID uuid = UUID.randomUUID();
			thumbNewFileName = uuid.toString() + extension;
			
			// 전달확인
			System.out.println("thumbFileName=" + thumbFileName); 	// filename="Koala.jpg"
			System.out.println("thumbFileSize=" + thumbFileSize);
			System.out.println("thumbPath=" + thumbpath);
		}
		
		mf1.transferTo(new File(thumbpath + "/" + thumbNewFileName));
		
		board.setThumbnail(thumbNewFileName);
		
		
/*
		// 조리사진
		String filename2 = mf2.getOriginalFilename();
		int filesize2 = (int) mf2.getSize();
		String newfilename2 = "";
		
		// 전달확인
		System.out.println("mf2=" + mf2);
		System.out.println("filename2=" + filename2); 	// filename="Koala.jpg"
		System.out.println("filesize2=" + filesize2);
		System.out.println("Path=" + path);
		
		if(filename2!="") {
			String extension = filename2.substring(filename2.lastIndexOf("."), filename2.length());
			UUID uuid = UUID.randomUUID();
			newfilename2 = uuid.toString() + extension;
		}
		
		mf2.transferTo(new File(path + "/" + newfilename2));
		
		board.setRfile(newfilename2);
		
*/
		

		
		
		// 멀티 업로드
		List<MultipartFile> fileList = mhr.getFiles("r_file1");
		String multipath = request.getRealPath("r_images");
		String finalFileName = "";
		
		for (MultipartFile mf : fileList) {
            String multiFileName = mf.getOriginalFilename(); // 원본 파일 명
            long multiFileSize = mf.getSize(); // 파일 사이즈

            String extension = multiFileName.substring(multiFileName.lastIndexOf("."), multiFileName.length());
            UUID uuid = UUID.randomUUID();
            
            String multiNewFileName = uuid.toString() + extension;
            
            System.out.println("multiFileName : " + multiFileName);
            System.out.println("multiFileSize : " + multiFileSize);
            
            finalFileName += mf+"-";
            
            try {
                mf.transferTo(new File(multipath + "/" + multiNewFileName));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
		}
		
		System.out.println("finalFileName:" + finalFileName);
		board.setRfile(finalFileName);
		
		
		
		
		// ip
		String ip = request.getRemoteAddr();
		board.setIp(ip);
		System.out.println(ip);
		
		// 재료, 용량 '-' 접합자 추가해서 저장
		String ingre = "";
		String[] ingreEx = request.getParameterValues("ingre");

		for(String i : ingreEx) {
			ingre += i+"-";			// 재료1-재료2
		}		
		
		String capacity = "";
		String[] capacityEx = request.getParameterValues("capacity");

		for(String i : capacityEx) {
			capacity += i+"-";		// 용량1-용량2
		}		
		
		System.out.println("재료:"+ingre);
		System.out.println("용량:"+capacity);
		
		
		board.setIngre(ingre);
		board.setCapacity(capacity);
		
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
