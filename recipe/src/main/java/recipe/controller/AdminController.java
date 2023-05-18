package recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import recipe.model.Admin;
import recipe.service.AdminService;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;
	
	// 관리자 등록폼
	@RequestMapping("a_insertForm")
	public String insertForm() {
		return "admin/a_insertForm";
	}
	
	// 관리자 등록
	@RequestMapping("a_insert")
	public String insert(Admin admin, Model model) {
		
		int insertResult = as.insert(admin);
		model.addAttribute("insertResult", insertResult);
		
		return "admin/result";
	}
	
	// 관리자 로그인
	@RequestMapping("a_loginform")
	public String a_loginform() {
		return "admin/a_loginForm";
	}
	
	// 관리자 정보 구해오기
	@RequestMapping("a_loginForm") 
	public String getAdmin(Admin admin, HttpSession session, Model model) {
	  
	Admin a_loginForm = as.getAdmin(admin);
	int result = 0;
	if(a_loginForm != null) {		// admin login 성공
		session.setAttribute("admin_id", admin.getAdmin_id());
		result = 1;
	}
	model.addAttribute("result", result);
	  
	return "admin/a_loginResult";
	}
	
	// 관리자 메인
	@RequestMapping("a_main")
	public String a_main() {
		return "admin/a_main";
	}
	
	// 로그아웃
	@RequestMapping("a_Logout")
	public String Logout() {
		return "admin/a_Logout";
	}	

}








