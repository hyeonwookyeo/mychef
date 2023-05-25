package recipe.service;

import java.util.List;

import recipe.model.MemberBean;

public interface MemberService {
	
	//관리자용 회원목록
	 List<MemberBean> getMemberList();


}
