package recipe.controller;

import java.io.File;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recipe.model.MemberBean;
import recipe.service.MemberServicelmpl;


@Controller
public class MemberAction{
	
	@Autowired
	private MemberServicelmpl memberService;

	// ID중복검사 ajax함수로 처리부분
	@RequestMapping(value = "/member_idcheck.do", method = RequestMethod.POST)
	public String member_idcheck(@RequestParam("memid") String id, Model model) throws Exception {
		System.out.println("id:"+id);
		
		int result = memberService.checkMemberId(id);
		model.addAttribute("result", result);

		return "idcheckResult";
	}
			
	/*회원정보 수정 폼*/
	@RequestMapping("/member_edit")
	public String member_edit()  {
		
		return "member_edit";
	}
	/*로그인 폼 뷰*/
	@RequestMapping("/member_login")
	public String member_login() {
		
		return "member_login";
	}
    /* 회원정보 삭제 폼 */
		@RequestMapping("/member_del")
		public String member_del(HttpSession session, Model dm ) throws Exception {
	
			return "member_del";
		}
		
		/*회원가입 폼*/
     @RequestMapping("/member_join")
     public String member_join() {
    	 
    	 return "member_join";

		}
        
        /*비번찾기 폼*/
        @RequestMapping("/pwd_find")
        public String pwd_find() {
        	
        	return "pwd_find";
        }
        /* 회원 가입 저장(fileupload) */
    	@RequestMapping(value = "/member_join_ok.do", method = RequestMethod.POST)
    	public String member_join_ok(@RequestParam("join_profile1") MultipartFile mf, 
    								 MemberBean member,
    								 HttpServletRequest request,
    								 Model model) throws Exception {

    		String filename = mf.getOriginalFilename();		// 첨부파일명
    		int size = (int) mf.getSize(); 					// 첨부파일의 크기 (단위:Byte) 

    		String path = request.getRealPath("upload");
    		System.out.println("mf=" + mf);
    		System.out.println("filename=" + filename); 	// filename="Koala.jpg"
    		System.out.println("size=" + size);
    		System.out.println("Path=" + path);
    		int result=0;
    		
    		String file[] = new String[2];
//    		file = filename.split(".");
//    		System.out.println(file.length);
//    		System.out.println("file0="+file[0]);
//    		System.out.println("file1="+file[1]);
    		
    		String newfilename = "";
    	
    	if(filename != ""){	 // 첨부파일이 전송된 경우	
    		
    		// 파일 중복문제 해결
    		String extension = filename.substring(filename.lastIndexOf("."), filename.length());
    		System.out.println("extension:"+extension);
    		
    		UUID uuid = UUID.randomUUID();
    		
    		newfilename = uuid.toString() + extension;
    		System.out.println("newfilename:"+newfilename);		
    		
    		StringTokenizer st = new StringTokenizer(filename, ".");
    		file[0] = st.nextToken();		// 파일명		Koala
    		file[1] = st.nextToken();		// 확장자	    jpg
    		
    		if(size > 100000){				// 100KB
    			result=1;
    			model.addAttribute("result", result);
    			
    			return "uploadResult";
    			
    		}else if(!file[1].equals("jpg")  &&
    				 !file[1].equals("jpeg") &&
    				 !file[1].equals("gif")  &&
    				 !file[1].equals("png") ){
    			
    			result=2;
    			model.addAttribute("result", result);
    			
    			return "uploadResult";
    		}
    	}	

    		if (size > 0) { 	// 첨부파일이 전송된 경우

    			mf.transferTo(new File(path + "/" + newfilename));

    		}
    		
    		String phone1 = request.getParameter("phone1").trim();
    		String phone2 = request.getParameter("phone2").trim();
    		String phone3 = request.getParameter("phone3").trim();
    		String phone = phone1 + "-" + phone2 + "-" + phone3;
    
    				
    		String mailid = request.getParameter("mailid").trim();
    		String domain = request.getParameter("domain").trim();
    		String mailid1 = mailid + "@" + domain;

    		member.setPhone1(phone);
    		member.setMailid(mailid1);
    		member.setProfile(newfilename);

    		memberService.insertMember(member);

    		return "redirect:member_login.do";
    	}
    	/* 회원정보 수정 폼 */
    	@RequestMapping(value = "/member_edit.do")
    	public String member_edit(HttpSession session, Model m) throws Exception {

    		String id = (String) session.getAttribute("id");

    		MemberBean editm = memberService.userCheck(id);

    		String phone = editm.getPhone1();
    		StringTokenizer st02 = new StringTokenizer(phone, "-");
    		String phone1 = st02.nextToken();
    		String phone2 = st02.nextToken();
    		String phone3 = st02.nextToken();

    		String mailid = editm.getMailid();
    		StringTokenizer st03 = new StringTokenizer(mailid, "@");
    		String mailid1 = st03.nextToken();
    		String domain = st03.nextToken(); 

    		m.addAttribute("editm", editm);
    		m.addAttribute("phone1", phone1);
    		m.addAttribute("phone2", phone2);
    		m.addAttribute("phone3", phone3);
    		m.addAttribute("mailid", mailid);
    		m.addAttribute("domain", domain);

    		return "member_edit";
    	}
    	// 로그아웃
    	@RequestMapping("member_logout.do")
    	public String logout(HttpSession session) {
    		session.invalidate();

    		return "member_logout";
    	}
}

        



