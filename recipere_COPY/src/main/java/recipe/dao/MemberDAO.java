package recipe.dao;

import java.util.List;

import recipe.model.MemberBean;

public interface MemberDAO {
	
	//회원정보리스트 출력
	public List<MemberBean> getMemberList();


}
