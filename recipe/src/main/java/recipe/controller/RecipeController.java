package recipe.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import recipe.model.MemberBean;
import recipe.model.R_recomm;
import recipe.model.R_zzim;
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
	public String category(Model model, HttpServletRequest request) {

		// 임시 세션값 설정
		HttpSession session = request.getSession();
		String id = "aaaa";
		session.setAttribute("id", id);

		return "recipe/categoryForm";

	}

// 레시피 목록 폼		
	@RequestMapping("r_listForm")
	public String Recipelist(String pageNum, RecipeBoard board, Model model, R_recomm recomm) {


		final int rowPerPage = 12;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		if (board.getSort() == null || board.getSort().equals("")) {
			board.setSort("rnum");
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = service.getTotal(board); // 검색

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		
		board.setSort(board.getSort());
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		int number = total - startRow + 1;

		List<RecipeBoard> list = service.r_list(board);

		model.addAttribute("total", total);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("list", list);
		model.addAttribute("number", number);
		model.addAttribute("pp", pp);
		model.addAttribute("category", board.getCategory());

		// 검색
		model.addAttribute("search", board.getSearch());
		model.addAttribute("keyword", board.getKeyword());

		return "recipe/r_list";
	}

// 레시피 작성폼
	@RequestMapping("r_insertForm")
	public String insertform(String pageNum, Model model) {

		model.addAttribute("pageNum", pageNum);

		return "recipe/r_insertForm";
	}

// 레시피 작성	
	@RequestMapping(value = "r_insert", method = RequestMethod.POST)
	public String insert(@RequestParam("thumbnail1") MultipartFile mf1,
//						@RequestParam("r_file1") MultipartFile mf2,
			MultipartHttpServletRequest mhr, RecipeBoard board, HttpServletRequest request, Model model)
			throws Exception {

		SimpleDateFormat sf = new SimpleDateFormat("YYYY_MM_dd_");
		Date dt = new Date();

		// 조리사진 내용
		String[] contentList = request.getParameterValues("content1");
		String content = "";

		for (String i : contentList) {
			content += i + "-"; // 내용1-내용2
		}


		board.setContent(content);

		// 썸네일사진
		String thumbFileName = mf1.getOriginalFilename();
		int thumbFileSize = (int) mf1.getSize();
		String thumbpath = request.getRealPath("t_images");
		String thumbNewFileName = "";

		if (thumbFileName != "") {
			String extension = thumbFileName.substring(thumbFileName.lastIndexOf("."), thumbFileName.length());
			UUID uuid = UUID.randomUUID();
			thumbNewFileName = sf.format(dt) + uuid.toString() + extension;

			// 전달확인
		}

		mf1.transferTo(new File(thumbpath + "/" + thumbNewFileName));

		board.setThumbnail(thumbNewFileName);

		/*
		 * // 조리사진 String filename2 = mf2.getOriginalFilename(); int filesize2 = (int)
		 * mf2.getSize(); String newfilename2 = "";
		 * 
		 * // 전달확인 System.out.println("mf2=" + mf2); System.out.println("filename2=" +
		 * filename2); // filename="Koala.jpg" System.out.println("filesize2=" +
		 * filesize2); System.out.println("Path=" + path);
		 * 
		 * if(filename2!="") { String extension =
		 * filename2.substring(filename2.lastIndexOf("."), filename2.length()); UUID
		 * uuid = UUID.randomUUID(); newfilename2 = uuid.toString() + extension; }
		 * 
		 * mf2.transferTo(new File(path + "/" + newfilename2));
		 * 
		 * board.setRfile(newfilename2);
		 * 
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

			String multiNewFileName = sf.format(dt) + uuid.toString() + extension;


			finalFileName += multiNewFileName + "]";

			try {
				mf.transferTo(new File(multipath + "/" + multiNewFileName));
			} catch (Exception e) {

				e.printStackTrace();
			}
		}

		board.setRfile(finalFileName);

		// ip
		String ip = request.getRemoteAddr();
		board.setIp(ip);

		// 재료, 용량 '-' 접합자 추가해서 저장
		String ingre = "";
		String[] ingreEx = request.getParameterValues("ingre");

		for (String i : ingreEx) {
			ingre += i + "-"; // 재료1-재료2
		}

		String capacity = "";
		String[] capacityEx = request.getParameterValues("capacity");

		for (String i : capacityEx) {
			capacity += i + "-"; // 용량1-용량2
		}


		board.setIngre(ingre);
		board.setCapacity(capacity);

		int result = service.r_insert(board);

		model.addAttribute("category", board.getCategory());
		model.addAttribute("result", result);

		return "result/r_insertResult";
	}

// 레시피 상세페이지 
	@RequestMapping("r_view")
	public String rview(int rnum, String rpageNum, String pageNum, Model model, R_recomm recomm) {

		if (rpageNum == null || rpageNum.equals("")) {
			rpageNum = "1";
		}

		service.r_readcountUpdate(rnum);
		int recomm_state = service.r_recomm_count(recomm);

		RecipeBoard board = service.r_select(rnum);

		String ingre[] = (board.getIngre()).split("-");
		String capacity[] = (board.getCapacity()).split("-");
		String rfile[] = (board.getRfile()).split("]");
		String content[] = (board.getContent()).split("-");

		LinkedHashMap<String, String> map1 = new LinkedHashMap<>();
		LinkedHashMap<String, String> map2 = new LinkedHashMap<>();

		for (int i = 0; i < ingre.length; i++) {
			System.out.println("ingre"+i+" = "+ingre[i]);
			System.out.println("capacity"+i+" = "+capacity[i]);
			map1.put(ingre[i], capacity[i]);
		}
		for (int i = 0; i < rfile.length; i++) {
			System.out.println("rfile"+i+" = "+rfile[i]);
			System.out.println("content"+i+" = "+content[i]);
			map2.put(rfile[i], content[i]);
		}
		
		MemberBean member = service.m_select(board.getId());
		
		model.addAttribute("recomm_state", recomm_state);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("rpageNum", rpageNum);
		model.addAttribute("board", board);
		model.addAttribute("member", member);
		model.addAttribute("map1", map1);
		model.addAttribute("map2", map2);

		return "recipe/r_view";
	}

	// 상세페이지 - 추천
	@RequestMapping("r_recomm")
	public String r_recomm(R_recomm recomm) {


		int result;
		String id = recomm.getId();
		int rnum = recomm.getRnum();


		result = service.r_recomm(recomm);


		if (result == 0) {
			return "redirect:r_recomm_add?id=" + id + "&rnum=" + rnum;
		} else {
			return "redirect:r_recomm_remove?id=" + id + "&rnum=" + rnum;
		}
	}

	// 상세페이지 - 추천 증가
	@RequestMapping("r_recomm_add")
	public String r_recomm_add(R_recomm recomm, RecipeBoard board, Model model) {


		service.r_recomm_add(recomm);
		int result = service.r_recomm_count(recomm); // 추천갯수
		int number = service.r_recomm_plus(board.getRnum());

		model.addAttribute("result", result);

		return "result/r_recomm_result";
	}

	// 상세페이지 - 추천 감소
	@RequestMapping("r_recomm_remove")
	public String r_recomm_remove(R_recomm recomm, RecipeBoard board, Model model) {


		service.r_recomm_delete(recomm);
		service.r_recomm_minus(board.getRnum());
		int result = service.r_recomm_count(recomm);

		model.addAttribute("result", result);

		return "result/r_recomm_result";
	}
	
	// 찜 확인
	@RequestMapping("r_zzim")
	public String r_zzim(R_zzim zzim, Model model) {
		
		
		String id = zzim.getId();
		int  rnum = zzim.getRnum();
		
		
		int result = service.r_zzim(zzim);
		
		
		model.addAttribute("id", id);
		model.addAttribute("rnum", rnum);
		model.addAttribute("result", result);
		
		return "result/r_zzim_result";
		
	}
	
// 찜하기
	@RequestMapping("r_zzim_add")
	public String r_zzim_add(R_zzim zzim, Model model) {
		
		
		int rnum = zzim.getRnum();
		int result = service.r_zzim_add(zzim);
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("result", result);
		
		return "result/r_zzim_result_add";
	}
	
// 찜취소
	@RequestMapping("r_zzim_remove")
	public String r_zzim_remove(R_zzim zzim, Model model) {
		
		
		int rnum = zzim.getRnum();
		int result = service.r_zzim_remove(zzim);
		
		
		model.addAttribute("renum", rnum);
		model.addAttribute("result", result);
		
		return "result/r_zzim_result_delete";
	}

// 레시피 수정폼	
	@RequestMapping("r_updateForm")
	public String rupdate(String pageNum, int rnum, Model model) {

		RecipeBoard board = service.r_select(rnum);

		String ingre[] = (board.getIngre()).split("-");
		String capacity[] = (board.getCapacity()).split("-");
		String rfile[] = (board.getRfile()).split("]");
		String content[] = (board.getContent()).split("-");

		Map<String, String> map1 = new HashMap<>();
		Map<String, String> map2 = new HashMap<>();

		for (int i = 0; i < ingre.length; i++) {
			map1.put(ingre[i], capacity[i]);
		}
		for (int i = 0; i < rfile.length; i++) {
			map2.put(rfile[i], content[i]);
		}

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		model.addAttribute("map1", map1);
		model.addAttribute("map2", map2);

		return "recipe/r_updateForm";
	}

//	수정
	@RequestMapping("r_update")
	public String r_update(@RequestParam("thumbnail1") MultipartFile mf1, MultipartHttpServletRequest mhr,
			RecipeBoard board, HttpServletRequest request, Model model) throws Exception {


// 조리사진 내용
		String[] contentList = request.getParameterValues("content1");
		String content = "";

		for (String i : contentList) {
			content += i + "-"; // 내용1-내용2
		}


		board.setContent(content);

		// 썸네일사진
		String thumbFileName = mf1.getOriginalFilename();
		int thumbFileSize = (int) mf1.getSize();
		String thumbpath = request.getRealPath("t_images");
		String thumbNewFileName = "";

		if (thumbFileName != "") {
			String extension = thumbFileName.substring(thumbFileName.lastIndexOf("."), thumbFileName.length());
			UUID uuid = UUID.randomUUID();
			thumbNewFileName = uuid.toString() + extension;

			// 전달확인
		}

		mf1.transferTo(new File(thumbpath + "/" + thumbNewFileName));

		board.setThumbnail(thumbNewFileName);

		/*
		 * // 조리사진 String filename2 = mf2.getOriginalFilename(); int filesize2 = (int)
		 * mf2.getSize(); String newfilename2 = "";
		 * 
		 * // 전달확인 System.out.println("mf2=" + mf2); System.out.println("filename2=" +
		 * filename2); // filename="Koala.jpg" System.out.println("filesize2=" +
		 * filesize2); System.out.println("Path=" + path);
		 * 
		 * if(filename2!="") { String extension =
		 * filename2.substring(filename2.lastIndexOf("."), filename2.length()); UUID
		 * uuid = UUID.randomUUID(); newfilename2 = uuid.toString() + extension; }
		 * 
		 * mf2.transferTo(new File(path + "/" + newfilename2));
		 * 
		 * board.setRfile(newfilename2);
		 * 
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


			finalFileName += multiNewFileName + "]";

			try {
				mf.transferTo(new File(multipath + "/" + multiNewFileName));
			} catch (Exception e) {

				e.printStackTrace();
			}
		}

		board.setRfile(finalFileName);

		// 재료, 용량 '-' 접합자 추가해서 저장
		String ingre = "";
		String[] ingreEx = request.getParameterValues("ingre");

		for (String i : ingreEx) {
			ingre += i + "-"; // 재료1-재료2
		}

		String capacity = "";
		String[] capacityEx = request.getParameterValues("capacity");

		for (String i : capacityEx) {
			capacity += i + "-"; // 용량1-용량2
		}


		board.setIngre(ingre);
		board.setCapacity(capacity);

		int result = service.r_update(board);

		model.addAttribute("category", board.getCategory());
		model.addAttribute("result", result);

		return "result/r_updateResult";
	}

// 삭제
	@RequestMapping("r_delete")
	public String r_delete(RecipeBoard board, Model model, HttpServletResponse response) throws IOException {


		int result = service.r_delete(board.getRnum());

		model.addAttribute("category", board.getCategory());
		model.addAttribute("result", result);

		PrintWriter out = response.getWriter();
		out.print(result);

		return null;
	}

}
