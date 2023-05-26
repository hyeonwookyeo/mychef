package recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.AdminDao;
import recipe.model.Admin;
import recipe.model.MemberBean;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao ad;
	
	// 관리자 등록
	public int insert(Admin admin) {
		return ad.insert(admin);
	}
	
	// 정보 구해오기
	public Admin getAdmin(Admin admin) {
		return ad.getAdmin(admin);
	}

	@Override
	public int change_member(MemberBean member) {
		// TODO Auto-generated method stub
		return ad.change_member(member);
	}
	
}
