package recipe.dao;

import recipe.model.Admin;
import recipe.model.MemberBean;

public interface AdminDao {
	
	// 관리자 등록
		public int insert(Admin admin);
		
		// 정보 구해오기
		public Admin getAdmin(Admin admin);

		public int change_member(MemberBean member);


}
