
package recipe.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		return "rlist";
	}

// 댓글 등록	
	@RequestMapping("r_insertRe")
	public String r_insertRe(RecipeReBoard reboard, int rnum,
								MultipartHttpServletRequest mtfRequest,Model model,
								HttpServletRequest request, HttpServletResponse response) throws IOException  {
		
		List<MultipartFile> fileList = mtfRequest.getFiles("re_rfile1");
		if(fileList.isEmpty()) {
			System.out.println("업로드할 사진이 없습니다");
		}else {
			
		
		
		String path = request.getRealPath("reply_images");
		String finalFileName = "";
		
		System.out.println("path:"+path);
		for (MultipartFile mf : fileList) {
            String fileName = mf.getOriginalFilename(); // 원본 파일 명
            int multiFileSize = (int)mf.getSize(); // 파일 사이즈

            String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length());
            UUID uuid = UUID.randomUUID();
            
            String multiNewFileName = uuid.toString() + extension;
            
            System.out.println("multiFileName : " + fileName);
            System.out.println("multiNewFileName : " + multiNewFileName);
            System.out.println("multiFileSize : " + multiFileSize);
            
            finalFileName += multiNewFileName+"]";
            
            try {
                mf.transferTo(new File(path + "/" + multiNewFileName));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
		}
		
		System.out.println("finalFileName:" + finalFileName);
		reboard.setRe_rfile(finalFileName);
		}
		
		int result = reService.r_insertRe(reboard);
		if(result == 1) System.out.println("댓글 작성 성공");		
//		model.addAttribute("result", result);
//		
//		PrintWriter out = response.getWriter();
//		out.print(result);

		return "redirect:r_listRe?rnum="+rnum+"&pageNum="+1;
	}

// 댓글수정	
	@RequestMapping("r_updateRe")
	public String r_updateRe(RecipeReBoard reboard,int rnum, Model model,
							HttpServletResponse response) throws IOException {
		
		System.out.println("r_updateRe 진입");
		
		reService.r_updateRe(reboard);
		
		return "redirect:r_listRe?rnum="+rnum+"&pageNum="+1;
	} 

// 댓글삭제	
	@RequestMapping("r_deleteRe") 
	public String r_deleteRe(int rre_num,int rnum, Model model,
							HttpServletResponse response) throws IOException {
								
		System.out.println("r_deleteRe 진입");					
		
		reService.r_deleteRe(rre_num);
 
		return "redirect:r_listRe?rnum="+rnum+"&pageNum="+1;
	}
 
 } // class end
