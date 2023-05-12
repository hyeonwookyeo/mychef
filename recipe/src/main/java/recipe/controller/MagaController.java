// 메인 컨트롤러
package recipe.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recipe.model.MagaBean;
import recipe.model.MagaRecomBean;
import recipe.service.MagaService;
import recipe.service.MagaServiceImpl;

@Controller
public class MagaController {
	@Autowired
	private MagaService magaService;
	
	
	@RequestMapping("/maga")
	public String maga() {
		return "redirect:/maga_list";
	}

	
	// 글 쓰기
	@RequestMapping("/maga_write")
	public String maga_write() {
		return "maga/maga_write";
	}


	// 글 목록
	@RequestMapping("/maga_list")
	public String maga_list(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		List<MagaBean> magalist = new ArrayList<MagaBean>();
		
		String master = "master";
		String customer = "customer";

		int page = 1;
		int limit = 10; // 화면 출력 수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 데이터 개수
		int listcount = magaService.getListCount();

		magalist = magaService.getMagaList(page);

		int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * limit + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("magalist", magalist);
		
		session.setAttribute("id", master);
		

		return "maga_list";
	}
	
	// 상세 페이지 출력
	@RequestMapping("/maga_cont")
	public String maga_cont(@RequestParam("maga_num") int maga_num,
			 				@RequestParam("page") String page,
			 				@RequestParam("state") String state, Model model) throws Exception {
		
		if(state.equals("cont")) {
			magaService.readcount(maga_num);
		}
		
		MagaBean maga = magaService.maga_cont(maga_num);
		
		model.addAttribute("maga",maga);
		model.addAttribute("page",page);
		
		return "maga/maga_cont";
	}
	
	// 글 작성
	@RequestMapping("/maga_write_ok")
	public String maga_write_ok(@RequestParam("magafile") MultipartFile mf,
								HttpServletRequest request, MagaBean maga) throws Exception {
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();
		String path = request.getRealPath("upload");
		System.out.println("path");
		String newfilename = "";
		System.out.println("path : "+path);
		
		if(filename != "") {
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			UUID uuid = UUID.randomUUID();
			newfilename = uuid.toString() + extension;	
		}

		mf.transferTo(new File(path + "/" + newfilename));
		
		maga.setMfile(newfilename);
		magaService.insert(maga);
		
		return "redirect:/maga_list";
	}
	
	// 글 삭제
	@RequestMapping("/maga_del_ok")
	public String maga_del_ok(HttpServletRequest request, int maga_num, String page) throws Exception {
		
		MagaBean maga = magaService.maga_cont(maga_num);
		
//		String path = request.getRealPath("WEB-INF/images");
//		String fname = maga.getMfile();
//		
//		if (fname != null) {		// 첨부파일이 있으면ㄴ
//			File file = new File(path +"/"+fname);
//			file.delete();			// 첨부파일 삭제
//		}
		
		int result = magaService.maga_del(maga_num);
		System.out.println(result);
		
		return "redirect:/maga_list?page="+page;
	}
	
	// 매거진 추천
	@RequestMapping("/maga_recom")
	public String maga_recom(HttpSession session, Model model, int maga_num, String page) throws Exception {
		
		// 세션id로 추천중복 확인
		String id = (String)session.getAttribute("id");
		MagaRecomBean magarecom = new MagaRecomBean();
		magarecom.setMagarecom_num(maga_num);
		magarecom.setNickname(id);
		
		// 중복 확인
		int result = magaService.maga_recomcheck(magarecom);
		String state = "recom";
		model.addAttribute("result", result);
		model.addAttribute("page",page);
		model.addAttribute("maga_num",maga_num);
		
		if(result == 0) {	// 중복이 없을 때(추천 가능)
			magaService.maga_recom(maga_num);
			magaService.maga_recominsert(magarecom);
			
			return "maga/recom_result";
		}
		else if(result == 1) {	// 중복이 있을 때(추천 불가능)
			
			return "maga/recom_result";
		}
		return null;
	}
	

}
