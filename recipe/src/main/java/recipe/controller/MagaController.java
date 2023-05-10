// 메인 컨트롤러
package recipe.controller;

import java.io.File;
import java.util.ArrayList;
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

import recipe.model.MagaBean;
import recipe.service.MagaService;
import recipe.service.MagaServiceImpl;

@Controller
public class MagaController {
	@Autowired
	private MagaServiceImpl magaService;
	
	
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
	public String maga_list(HttpServletRequest request, Model model) throws Exception {

		List<MagaBean> magalist = new ArrayList<MagaBean>();

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

		return "maga_list";
	}
	
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
	
	@RequestMapping("/maga_write_ok")
	public String maga_write_ok(@RequestParam("magafile") MultipartFile mf,
								HttpServletRequest request, MagaBean maga) throws Exception {
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();
		String path = "images";
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
		System.out.println(newfilename);
		
		return "redirect:/maga_list";
	}
	

}
