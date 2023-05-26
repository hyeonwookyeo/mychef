package recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recipe.model.Admin;
import recipe.model.MemberBean;
import recipe.service.AdminService;
import recipe.service.MemberServiceImpl;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;
	@Autowired
	private MemberServiceImpl service;
	
	// 관리자 등록폼
	@RequestMapping("a_insertForm")
	public String insertForm() {
		return "a_insertForm";
	}
	
	// 관리자 등록
	@RequestMapping("a_insert")
	public String insert(Admin admin, Model model) {
		
		int insertResult = as.insert(admin);
		model.addAttribute("insertResult", insertResult);
		
		return "result";
	}
	
	// 관리자 로그인
	@RequestMapping("a_loginform")
	public String a_loginform() {
		return "a_loginForm";
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
	  
	return "a_loginResult";
	}
	
	/* 관리자용 회원 목록 */
	@GetMapping("/memberlist")
	public String listGET(HttpSession session, Model model,
	        @RequestParam(defaultValue = "1") int page,
	        @RequestParam(defaultValue = "10") int limit) throws Exception {

	    // 1. 관리자 세션 제어
	    String id = (String) session.getAttribute("admin_id");
	    if (id == null || id.equals("")) {
	        System.out.println("C: 관리자 아닌 접근 ID - " + id);
	        return "redirect:/main";
	    }
	    
	    // 2. 페이징 처리를 위한 변수 계산
	    int startRow = (page - 1) * limit + 1;
	    int endRow = page * limit;

	    // 3. 전체 멤버 수 계산
	    int totalCount = service.getMemberCount();
	    System.out.println("totalCount:"+ totalCount);
	    
	    // 4. 회원 목록 가져오기
	    MemberBean member = new MemberBean();
	    member.setStartRow(startRow);
	    member.setEndRow(endRow);
	    
	    List<MemberBean> memberList = service.getMemberList(member);
	    System.out.println("memberList:"+ memberList);
	    
	    // 5. 페이지 수 계산
	    int pageCount = totalCount / limit + ((totalCount % limit == 0) ? 0 : 1);

	    // 6. 시작 페이지와 끝 페이지 계산
	    int startPage = ((page - 1) / 10) * 10 + 1;
	    int endPage = startPage + 9;
	    if (endPage > pageCount) {
	        endPage = pageCount;
	    }
	    //번호 지정
	    int no = totalCount - startRow + 1;
	    // 7. 정보 저장 및 뷰로 전달
	    model.addAttribute("memberlist", memberList);
	    model.addAttribute("no", no);
	    model.addAttribute("page", page);
	    model.addAttribute("limit", limit);
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("pageCount", pageCount);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);

	    // 8. 페이지 이동
	    return "memberlist";
	}
	
	
	
	// 로그아웃
	@RequestMapping("a_Logout")
	public String Logout() {
		return "a_Logout";
	}	
	
	
	@RequestMapping("a_main")
	public String a_main() {
		return "a_main";
	}
	
	@RequestMapping("manage_member")
	public String manage_member(String id,Model model) {
		
		System.out.println("manage_member 진입");
		System.out.println("id는 "+id);
		
		model.addAttribute("id", id);
		
		return "admin/a_manage_member";
	}
	
	@RequestMapping("a_change_member")
	public String a_change_member(MemberBean member,Model model) {
		
		System.out.println("a_change_member 진입");
		
		int result = as.change_member(member);
		System.out.println("result는 "+result);
		
		model.addAttribute("result", result);
		
		return "admin/manage_member_result";
	}
	
	@RequestMapping("a_delete_member")
	public String a_delete_member(MemberBean member,Model model) throws Exception {
		
		System.out.println("a_delete_member 진입");
		
		member.setDelcontent("관리자에 의해 삭제됨");
		
		service.deleteMember(member);
		
		model.addAttribute("result", 1);
		
		return "admin/delete_member_result";
	}	
	
	
	
}








