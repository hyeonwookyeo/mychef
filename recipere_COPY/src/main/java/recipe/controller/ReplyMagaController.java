package recipe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recipe.model.MagaBean;
import recipe.model.ReplyMagaBean;
import recipe.service.MagaService;
import recipe.service.ReplyMagaService;

@Controller
public class ReplyMagaController {
	@Autowired
	private ReplyMagaService rms;
	@Autowired
	private MagaService ms;

	@RequestMapping("/slist")
	public String slist(int maga_num, Model model) throws Exception {
		MagaBean maga = ms.maga_cont(maga_num);
		List<ReplyMagaBean> slist = rms.slist(maga_num);

		model.addAttribute("slist", slist);
		model.addAttribute("maga", maga);
		return "maga/slist";
	}

	@RequestMapping("/sInsert")
	public String sInsert(ReplyMagaBean rmaga, Model model) throws Exception {
		rms.insert(rmaga);
		if(rmaga.getRef_lev().equals("0"))
		ms.re_cnt(rmaga.getMaga_num());

		return "redirect:slist?maga_num=" + rmaga.getMaga_num();
	}

	@RequestMapping("/repDelete")
	public String delete(ReplyMagaBean rmaga, Model model) throws Exception {	
		System.out.println(rmaga.getRef_lev());
		if(rmaga.getRef_lev().equals("0"))
			ms.re_cnt2(rmaga.getMaga_num());
		
		rms.delete(rmaga.getMagare_num());
		
		return "redirect:slist?maga_num=" + rmaga.getMaga_num();
	}
	
	@RequestMapping("/repUpdate")
	public String repUpdate(ReplyMagaBean rmaga, Model model) {
		rms.update(rmaga);
		
		
		return "redirect:slist?maga_num=" + rmaga.getMaga_num();
	}
}