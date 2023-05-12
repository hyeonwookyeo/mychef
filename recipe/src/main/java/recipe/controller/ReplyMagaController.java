package recipe.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping("/slist/num/{num}")
	public String slist(@PathVariable int maga_num, Model model) throws Exception {
		MagaBean maga = ms.maga_cont(maga_num);
		
		List<ReplyMagaBean> slist = new ArrayList<ReplyMagaBean>();
		slist = rms.slist(maga_num);
		
		model.addAttribute("slist", slist);
		model.addAttribute("board", maga);
		return "slist";
	}
}
