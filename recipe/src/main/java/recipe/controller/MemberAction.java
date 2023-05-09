package recipe.controller;

import java.io.File;
import java.util.StringTokenizer;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import recipe.dao.MemberDAOImpl;
import recipe.model.MemberBean;
import recipe.service.MemberServicelmpl;

@Controller
public class MemberAction {

	private MemberServicelmpl memberSerivce;
	private Object memberService;
	
	    @RequestMapping(value="/member_idcheck.do", method = RequestMethod.POST)
        public String member_idcheck(@RequestParam("memid") String id, Model model) throws Exception {
        	System.out.println("id:" + id);
        	
        	int result = memberSerivce.checkMemberId(id);
        	model.addAttribute("result", result);
        	
        	return "member/idcheckResult";
        }
	    /*회원정보 수정 폼*/
	    @RequestMapping(value="/member_edit.do")
	    public String member_edit(HttpSession session,Model m) throws Exception {
	    	
	    	String id = (String) session.getAttribute("id");
	    	
	    	MemberBean editm = memberSerivce.userCheck(id);
	    	
	    	String join_tel = editm.getJoin_tel();
	    	StringTokenizer st01 = new StringTokenizer(join_tel,"-");
	    	String join_tel1 = st01.nextToken();
	    	String join_tel2 = st01.nextToken();
	    	
	    	String join_email = editm.getJoin_email();
	    	StringTokenizer st03 = new StringTokenizer(join_email, "@");
			String join_mailid = st03.nextToken();
			String join_maildomain = st03.nextToken(); 

			m.addAttribute("editm", editm);
			m.addAttribute("join_tel1", join_tel1);
			m.addAttribute("join_tel2", join_tel2);
			m.addAttribute("join_mailid", join_mailid);
			m.addAttribute("join_maildomain", join_maildomain);
			
			return "member/member_edit";
	    
	    }
	    /* 회원정보 삭제 폼 */
		@RequestMapping(value = "/member_del.do")
		public String member_del(HttpSession session, Model dm) throws Exception {

			String id = (String) session.getAttribute("id");
			MemberBean deleteM = memberSerivce.userCheck(id);
			dm.addAttribute("d_id", id);
			dm.addAttribute("d_name", deleteM.getJoin_name());

			return "member/member_del";
		}
		/* 회원정보 삭제 완료 */
		@RequestMapping(value = "/member_del_ok.do", method = RequestMethod.POST)
		public String member_del_ok(@RequestParam("pwd") String pass, 
								    @RequestParam("del_cont") String del_cont,
								    HttpSession session) throws Exception {

			String id = (String) session.getAttribute("id");
			MemberBean member = this.memberSerivce.userCheck(id);

			if (!member.getJoin_pwd().equals(pass)) {

				return "member/deleteResult";
				
			} else {				// 비번이 같은 경우
				
				String path = session.getServletContext().getRealPath("upload");
				String fname = member.getJoin_profile();
				System.out.println("path:"+path);
				
				// 디비에 저장된 첩부파일명을 가져옴
				if (fname != null) {		// 첨부파일이 있으면
					File file = new File(path +"/"+fname);
					file.delete();			// 첨부파일 삭제
				}
				
				MemberBean delm = new MemberBean();
				delm.setJoin_id(id);
				delm.setJoin_delcont(del_cont);

				memberSerivce.deleteMember(delm);	// 삭제 메서드 호출

				session.invalidate();				// 세션삭제

				return "redirect:member_login.do";
			}
		}
		// 로그아웃
		@RequestMapping("member_logout.do")
		public String logout(HttpSession session) {
			session.invalidate();

			return "member/member_logout";
		}
		
		
}
