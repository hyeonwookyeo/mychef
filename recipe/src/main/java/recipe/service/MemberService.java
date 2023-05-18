package recipe.service;

import recipe.model.MemberBean;

public interface MemberService {
	
	
	 int checkMemberId(String id) throws Exception;

	    int checkMemberNickname(String nickname) throws Exception;

	    MemberBean findid(MemberBean member) throws Exception;

	    MemberBean findpwd(MemberBean member) throws Exception;

	    int insertMember(MemberBean member) throws Exception;

	    int updateNewpwd(MemberBean member) throws Exception;

	    MemberBean userCheck(String id) throws Exception;

}
