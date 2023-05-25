package recipe.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recipe.model.Board;
import recipe.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
// 글작성폼
	@RequestMapping("n_boardform")
	public String n_boardform() {
		return"n_boardform";
	}
	
	
	// 글작성
	@RequestMapping("boardwrite")
	public String boardwrite(@RequestParam("aFile1") MultipartFile mf ,
							 @ModelAttribute Board notice, 
							 HttpServletRequest request,
							 Model model ) throws Exception{
		System.out.println("boardwrite in");		
	
		String filename = mf.getOriginalFilename();
		int size = (int)mf.getSize();
		System.out.println("filename:"+filename);
		
		String path = request.getRealPath("upload");
		System.out.println("path:"+path);
		
		String newfilename = "";
		
		if(size > 0) {
			
			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:"+extension);
			
			UUID uuid = UUID.randomUUID();
			
			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:"+newfilename);		
			
			//  첨부파일 업로드
			mf.transferTo(new File(path + "/" + newfilename));			
			
		}
			
		notice.setaFile(newfilename);
		
		int result = service.insert(notice);
		if(result == 1) System.out.println("글작성 성공");
		
		return "a_main";
	}
	
	
	// 글목록
	@RequestMapping("n_boardlist")
	public String n_boardlist(@RequestParam(value="page",defaultValue = "1" ) int page,
			                Model model) {
		
		int limit = 10;  // 한 페이지에 출력한 데이터 갯수
		
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		
		int listcount = service.getCount();  // 총데이터 수 
		System.out.println("listcount:"+listcount);
		
		List<Board> n_boardlist = service.getn_boardlist(page);
		System.out.println("n_boardlist:"+n_boardlist);
		
		// 총페이지 수 
		int pageCount = listcount/limit + ((listcount % limit ==0)?0:1);
		
		int startPage = ((page -1) / 10) * limit + 1;   // 1, 11, 21...
		int endPage = startPage + 10 - 1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("n_boardlist", n_boardlist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		
		return "n_boardlist";
	}
	
	// 상세 페이지 : 조회수 1증가 + 상세정보 구하기
	@RequestMapping("n_boardcontent")
	public String n_boardcontent(@RequestParam("ann_Num") int ann_Num,
			@RequestParam("page") String page,
			Model model) {
		
		service.updatecount(ann_Num);  // 조회수 1증가
		Board notice = service.getBoard(ann_Num);  // 상세정보 구하기
		String content = notice.getContent().replace("\n", "<br>");
		
		model.addAttribute("notice", notice);
		model.addAttribute("content", content);
		model.addAttribute("page", page);
		
		return "n_boardcontent";
	}
	
	// 수정 폼
	
	
	  @RequestMapping("n_boardupdateform") 
	  public String n_boardupdateform(int ann_Num,
	  String page, Model model ) {
	  
	  Board notice = service.getBoard(ann_Num); // 상세정보 구하기
	  model.addAttribute("notice", notice); 
	  model.addAttribute("page", page);
	  
	  return"n_boardupdateform";
	  
	  }
	 
	
	// 글수정
	@RequestMapping("boardupdate")
	public String boardupdate(@ModelAttribute Board notice,
							  @RequestParam("page") String page,
							  Model model) {
		int result = service.update(notice);
//		Board old = service.getBoard(board.getAnn_Num());
//		Board old = service.getBoard(board.getAnn_Num());  // 상세정보구하기(비번)
		
		model.addAttribute("result", result);
//		model.addAttribute("board", board);
		model.addAttribute("page", page);
	
	return "n_updateresult"; 
	
	}
	
	// 글삭제 폼
//	@RequestMapping("boarddeleteform")
//	public String boarddeleteform() {
//		return"board/boarddeleteform";
//	}
	
	// 글삭제 
	@RequestMapping("boarddelete")
	public String boarddelete(@ModelAttribute Board notice,
						      @RequestParam("page") String page,
							  Model model) {
		
		int result = service.delete(notice.getAnn_Num());
		
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		
		return "n_deleteresult";
		
	}
	

	
	
	}
	























