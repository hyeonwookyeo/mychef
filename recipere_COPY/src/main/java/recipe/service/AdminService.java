package recipe.service;

import recipe.model.Admin;

public interface AdminService {
	
	// 관리자 등록
		public int insert(Admin admin);
		
		// 정보 구해오기
		public Admin getAdmin(Admin admin);

}
