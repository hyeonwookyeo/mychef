// 메인 컨트롤러
package recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import recipe.model.MagaBean;
import recipe.service.MagaServiceImpl;

@Controller
public class MagaController {
	@Autowired
	private MagaServiceImpl magaService;

	@RequestMapping("/maga")
	public String maga() {
		return "redirect:/maga_list";
	}

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

		System.out.println("11");
		System.out.println(listcount);
		System.out.println(magalist);
		return "maga_list";
	}

}
