package recipe.controller;

import java.io.File;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recipe.model.MemberBean;
import recipe.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberServiceImpl service;
	
	// ID 중복검사
	@RequestMapping (value = "/m_idCheck", method = RequestMethod.POST)
		public String join_idCheck(@RequestParam("memid") String id, Model model) throws Exception{
		System.out.println("id:"+id);
		
		int result = service.IdCheck(id);
		model.addAttribute("result", result);
		
		return "m_idcheckResult";
	}
	
	// 닉네임 중복검사
	@RequestMapping (value = "/m_nicknCheck", method = RequestMethod.POST)
		public String join_nickCheck(@RequestParam("memnick") String nickname, Model model) throws Exception{
		System.out.println("닉네임:"+nickname);
		
		int result = service.NicknameCheck(nickname);
		model.addAttribute("result", result);
		
		return "m_nicknCheckResult";
	}
	
	//로그인폼
	@RequestMapping(value = "/m_loginForm")
	public String member_login() {
		System.out.println("로그인폼 컨트롤러");
		return "m_loginForm";
	}
	
	// 회원가입 폼 
	@RequestMapping(value = "/m_joinForm")
	public String member_join() {
		return "m_joinForm";
	}
	
	/* 회원 가입 저장(fileupload) */
	@RequestMapping(value = "/m_joinOk", method = RequestMethod.POST)
	public String member_join_ok(@RequestParam("profile1") MultipartFile mf, 
								 MemberBean member,
								 HttpServletRequest request,
								 Model model) throws Exception {

		System.out.println("컨트롤로 진입");
		
		String filename = mf.getOriginalFilename();		// 첨부파일명
		int size = (int) mf.getSize(); 					// 첨부파일의 크기 (단위:Byte) 

		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); 	// filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int result=0;
		
		String file[] = new String[2];
//		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);
		
		String newfilename = "";
	
	if(filename != ""){	 // 첨부파일이 전송된 경우	
		
		// 파일 중복문제 해결
		String extension = filename.substring(filename.lastIndexOf("."), filename.length());
		System.out.println("extension:"+extension);
		
		UUID uuid = UUID.randomUUID();
		extension = filename.substring(filename.lastIndexOf("."), filename.length());
		System.out.println("extension:"+extension);
		
		newfilename = uuid.toString() + extension;
		System.out.println("newfilename:"+newfilename);		
		
		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		// 파일명		Koala
		file[1] = st.nextToken();		// 확장자	    jpg
		
		if(size > 100000){				// 100KB
			result=1;
			model.addAttribute("result", result);
			
			return "m_uploadResult";
			
		}else if(!file[1].equals("jpg")  &&
				 !file[1].equals("jpeg") &&
				 !file[1].equals("gif")  &&
				 !file[1].equals("png") ){
			
			result=2;
			model.addAttribute("result", result);
			
			return "m_uploadResult";
		}
	}	

		if (size > 0) { 	// 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}

//		String phone1 = request.getParameter("phone1").trim();
//		String phone2 = request.getParameter("phone2").trim();
//		String phone3 = request.getParameter("phone3").trim();
//		String phone = phone1 + "-" + phone2 + "-" + phone3;
//		
//		String mailid = request.getParameter("mailid").trim();
//		String maildomain = request.getParameter("domain").trim();
//		String email = mailid + "@" + maildomain;

		member.setProfile(newfilename);

		int result1 = service.insertMember(member);
		if(result1 == 1) System.out.println("회원가입 성공");
		
		return "redirect:m_loginForm";
	}
	
	// 로그인 인증
	@RequestMapping(value = "/m_loginOk", method = RequestMethod.POST)
	public String member_login_ok(@RequestParam("id") String id, 
			                                          @RequestParam("pwd") String pwd,
			                                         HttpSession session, 
			                                        Model model) throws Exception {
		int result=0;		
		MemberBean m = service.userCheck(id);

		if (m == null) {	// 등록되지 않은 회원일때
			
			result = 1;
			model.addAttribute("result", result);
			
			return "m_loginResult";
			
		} else {			// 등록된 회원일때
			if (m.getPwd().equals(pwd)) {			// 비번이 같을때
				session.setAttribute("id", id);

				String name = m.getName();
				String profile = m.getProfile();

				model.addAttribute("name", name);
				model.addAttribute("profile", profile);

				return "main";
				
			} else {									// 비번이 다를때
				result = 2;
				model.addAttribute("result", result);
				
				return "m_loginResult";				
			}
		}

	}
	
	// ID찾기
	@RequestMapping(value = "/m_idfindForm")
	public String id_find() {
		return "m_idfindForm";
	}
	
	// ID 찾기 완료
	@RequestMapping(value = "/m_idfindokForm", method = RequestMethod.POST)
	public String id_find_ok(@ModelAttribute MemberBean mem, Model model) throws Exception{
		MemberBean member = service.findid(mem);
		if (member == null) { // 해당 id가 없는 경우 
			return "m_idfindResult";
		} else {
			model.addAttribute("member", member);
			return "m_idfindForm";
		}
		
	}
	
	// 비번찾기
		@RequestMapping(value = "/m_pwdfindForm")
		public String pwd_find() {
			return "m_pwdfindForm";
		}
		

	// 비번찾기 완료 
		@RequestMapping(value = "/m_pwdfindokForm", method = RequestMethod.POST)
		public String pwd_find_ok(@ModelAttribute MemberBean mem, Model model)
				throws Exception {

			MemberBean member = service.findpwd(mem);
//난수발생 ->update
			if (member == null) {// 값이 없는 경우
				return "m_pwdResult";

			} else {

				// 임시비밀번호
				UUID uuid = UUID.randomUUID();
				String newpwd = uuid.toString();
				System.out.println("newpwd:"+newpwd);
				member.setPwd(newpwd);
				
				int result = service.updateNewpwd(member);   //  임시비번 수정
				
				// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "ymj2677@naver.com";
				String hostSMTPpwd = "nav0211##"; 		// 비밀번호 입력해야함

				// 보내는 사람 EMail, 제목, 내용
				String fromEmail = "ymj2677@naver.com";
				String fromName = "관리자";
				String subject = "비밀번호 찾기";

				// 받는 사람 E-Mail 주소
				String mail = member.getMailid()+"@"+member.getDomain();
				System.out.println(mail);

				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(587);

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호 : "
							+ member.getPwd() /*보낼 내용*/+ "</div>");
					email.send();
				} catch (Exception e) {
					e.printStackTrace();
				}

				model.addAttribute("pwdok", "등록된 email을 확인 하세요~!!");
				return "m_pwdfindForm";
			}
		}
			


			/* 회원정보 수정 폼 */
			@RequestMapping(value = "/m_editForm")
			public String m_editForm(HttpSession session, Model m) throws Exception {

				String id = (String) session.getAttribute("id");

				MemberBean editm = service.userCheck(id);	

				m.addAttribute("editm", editm);				

				return "m_editForm";
			}
			
			/* 회원정보 수정(fileupload) */
			@RequestMapping(value = "/m_editForm.ok", method = RequestMethod.POST)
			public String m_editForm_ok(@RequestParam("profile1") MultipartFile mf, 
										 MemberBean member,
										 HttpServletRequest request, 
										 HttpSession session, 
										 Model model) throws Exception {

				String filename = mf.getOriginalFilename();
				int size = (int) mf.getSize();		
				
				String path = request.getRealPath("upload");
				System.out.println("path:"+path);
				
				int result=0;		
				String file[] = new String[2];

				String newfilename = "";
				
			if(filename != ""){	 // 첨부파일이 전송된 경우		
				
				// 파일 중복문제 해결
				String extension = filename.substring(filename.lastIndexOf("."), filename.length());
				System.out.println("extension:"+extension);
						
				UUID uuid = UUID.randomUUID();
						
				newfilename = uuid.toString() + extension;
				System.out.println("newfilename:"+newfilename);			
				
				StringTokenizer st = new StringTokenizer(filename, ".");
				file[0] = st.nextToken();		// 파일명
				file[1] = st.nextToken();		// 확장자	
				
				if(size > 1000000){
					result=1;
					model.addAttribute("result", result);
					
					return "m_uploadResult";
					
				}else if(!file[1].equals("jpg")  &&
						 !file[1].equals("jpeg") &&
						 !file[1].equals("gif")  &&
						 !file[1].equals("png") ){
					
					result=2;
					model.addAttribute("result", result);
					
					return "m_uploadResult";
				}	
				
			}
				
				if (size > 0) { // 첨부파일이 전송된 경우
					mf.transferTo(new File(path + "/" + newfilename));
				}		

//				String id = (String) session.getAttribute("id");
				
				MemberBean editm = service.userCheck(member.getId());	
				
				if (size > 0 ) { 			// 첨부 파일이 수정되면
					member.setProfile(newfilename);			
				} else { 					// 첨부파일이 수정되지 않으면
					member.setProfile(editm.getProfile());
				}

				service.updateMember(member);		// 수정 메서드 호출

				model.addAttribute("name", member.getName());
				model.addAttribute("profile", member.getProfile());

				return "main";
			}
			/* 회원정보 삭제 폼 */
			@RequestMapping(value = "/m_delForm")
			public String m_delForm(HttpSession session, Model dm) throws Exception {

				String id = (String) session.getAttribute("id");
				MemberBean deldate = service.userCheck(id);
				dm.addAttribute("id", id);
				dm.addAttribute("name", deldate.getName());

				return "m_delForm";
			}  
			/* 회원정보 삭제 완료 */
			@RequestMapping(value = "/m_delForm_ok", method = RequestMethod.POST)
			public String m_delForm_ok(MemberBean md,  HttpSession session, Model model) throws Exception {

				MemberBean member = service.userCheck(md.getId());

				
				if (!member.getPwd().equals(md.getPwd())) {
					model.addAttribute("result", -1);
					
					return "deleteResult";
					
				} else {				// 비번이 같은 경우
					
					String path = session.getServletContext().getRealPath("upload");
					String fname = member.getProfile();
					System.out.println("path:"+path);
					
					// 디비에 저장된 첩부파일명을 가져옴
					if (fname != null) {		// 첨부파일이 있으면ㄴ
						File file = new File(path +"/"+fname);
						file.delete();			// 첨부파일 삭제
					}
					
					service.deleteMember(md);

					session.invalidate();				// 세션삭제
					
					model.addAttribute("result", 1);

					return "deleteResult";
				}
     }
}
			
		
