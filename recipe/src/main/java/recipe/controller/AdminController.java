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
	@RequestMapping("admin_insertForm")
	public String insertForm() {
		return "admin/insertForm";
	}
	
	// 관리자 등록
	@RequestMapping("admin_insert")
	public String insert(Admin admin, Model model) {
		
		int insertResult = as.insert(admin);
		model.addAttribute("insertResult", insertResult);
		
		return "admin/result";
	}
	
	// 관리자 로그인
	@RequestMapping("admin_loginform")
	public String admin_loginform() {
		return "admin/admin_login";
	}
	
	// 관리자 정보 구해오기
	@RequestMapping("admin_login") 
	public String getAdmin(Admin admin, HttpSession session, Model model) {
	  
	Admin loginadmin = as.getAdmin(admin);
	int result = 0;
	if(loginadmin != null) {		// admin login 성공
		session.setAttribute("admin_id", admin.getAdmin_id());
		result = 1;
	}
	model.addAttribute("result", result);
	  
	return "admin/adminlogin";
	}
	
	/*
	 * // 관리자 메인
	 * 
	 * @RequestMapping("admin_main") public String admin_main() { return
	 * "admin/admin_main"; }
	 */
	
	// 관리자 메인
	@RequestMapping("admin_view")
	public String admin_view() {
		return "admin/admin_view";
	}
	
	// 로그아웃
	@RequestMapping("Logout")
	public String Logout() {
		return "Login/Logout";
	}
	

}








