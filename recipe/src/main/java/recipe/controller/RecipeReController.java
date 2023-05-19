
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
	public String r_listRe(String rpageNum, int rnum, Model model) {

		System.out.println("r_listRe 도착");

		final int rowPerPage = 5;
		if (rpageNum == null || rpageNum.equals("")) {
			rpageNum = "1";
		}
		int currentPage = Integer.parseInt(rpageNum);

		int total = reService.getTotalRe(rnum);

		System.out.println("total:" + total);
		System.out.println("rowPerPage" + rowPerPage);
		System.out.println("currentPage" + currentPage);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		System.out.println("startRow" + startRow);
		System.out.println("endRow" + endRow);
		System.out.println("pp는 " + pp);

		RecipeReBoard reboard = new RecipeReBoard();
		reboard.setStartRow(startRow);
		reboard.setEndRow(endRow);
		reboard.setRnum(rnum);

		List<RecipeReBoard> rlist = reService.listRe(reboard);
		System.out.println("rlist:" + rlist);

		model.addAttribute("rpageNum", rpageNum);
		model.addAttribute("total", total);
		model.addAttribute("rlist", rlist);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pp", pp);

		return "rlist";
	}

	// 댓글 등록
	@RequestMapping("r_insertRe")
	public String r_insertRe(RecipeReBoard reboard, String pageNum, MultipartHttpServletRequest mhr,
			HttpServletRequest request, HttpServletResponse response, MultipartFile[] uploadFile, Model model)
			throws Exception {

		System.out.println("r_insertRe에 도착했습니다");

		String re_multipath = request.getRealPath("reply_images");
		String finalFileName = "";
		
		System.out.println("path:"+re_multipath);

		for (MultipartFile multipartFile : uploadFile) {
			String re_multiFileName = multipartFile.getOriginalFilename();
			int re_multiFileSize = (int) multipartFile.getSize();

			String extension = re_multiFileName.substring(re_multiFileName.lastIndexOf("."), re_multiFileName.length());
			UUID uuid = UUID.randomUUID();

			String re_multiNewFileName = uuid.toString() + extension;

			System.out.println("multiFileName : " + re_multiFileName);
			System.out.println("multiNewFileName : " + re_multiNewFileName);
			System.out.println("multiFileSize : " + re_multiFileSize);

			finalFileName += re_multiNewFileName + "]";

			try {
				multipartFile.transferTo(new File(re_multipath + "/" + re_multiNewFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		reboard.setRe_rfile(finalFileName);
		System.out.println("finalFileName:" + finalFileName);


		int result = reService.r_insertRe(reboard);
		if (result == 1)
			System.out.println("댓글 작성 성공");
		
		int rnum = reboard.getRnum();

		return "redirect:r_listRe?rnum=" + rnum;
	}

// 댓글수정	
	@RequestMapping("r_updateRe")
	public String r_updateRe(RecipeReBoard reboard, String pageNum, MultipartHttpServletRequest mhr,
			HttpServletRequest request, HttpServletResponse response, MultipartFile[] uploadFile, Model model)
			throws Exception {
		
		System.out.println("r_updateRe 진입");
		
		String re_multipath = request.getRealPath("reply_images");
		String finalFileName = "";
		
		System.out.println("path:"+re_multipath);

		for (MultipartFile multipartFile : uploadFile) {
			String re_multiFileName = multipartFile.getOriginalFilename();
			int re_multiFileSize = (int) multipartFile.getSize();

			String extension = re_multiFileName.substring(re_multiFileName.lastIndexOf("."), re_multiFileName.length());
			UUID uuid = UUID.randomUUID();

			String re_multiNewFileName = uuid.toString() + extension;

			System.out.println("multiFileName : " + re_multiFileName);
			System.out.println("multiNewFileName : " + re_multiNewFileName);
			System.out.println("multiFileSize : " + re_multiFileSize);

			finalFileName += re_multiNewFileName + "]";

			try {
				multipartFile.transferTo(new File(re_multipath + "/" + re_multiNewFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		reboard.setRe_rfile(finalFileName);
		System.out.println("finalFileName:" + finalFileName);


		int result = reService.r_updateRe(reboard);
		if (result == 1)
			System.out.println("댓글 작성 성공");
		
		int rnum = reboard.getRnum();

		return "redirect:r_listRe?rnum=" + rnum;
	}

	
// 댓글삭제	
	@RequestMapping("r_deleteRe")
	public String r_deleteRe(int rre_num, int rnum, Model model, HttpServletResponse response) throws IOException {

		System.out.println("r_deleteRe 진입");

		reService.r_deleteRe(rre_num);

		return "redirect:r_listRe?rnum=" + rnum;
	}

} // class end
