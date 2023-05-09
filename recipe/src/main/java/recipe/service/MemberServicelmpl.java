package recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import recipe.dao.MemberDAOImpl;
import recipe.model.MemberBean;

@Service
public class MemberServicelmpl {

	@Autowired
	private MemberDAOImpl memberDao;
	
	public int checkMemberId(String id)throws Exception {
		return memberDao.checkMemberId(id);
	}
	public MemberBean findpwd(MemberBean m)throws Exception {
		return memberDao.findpwd(m);
	}
	
	public void insertMember(MemberBean member) throws Exception{
		memberDao.insertMember(member);
	}
	
	public MemberBean userCheck(String id) throws Exception{
		return memberDao.userCheck(id);		
	}
	
	public void updateMember(MemberBean member) throws Exception{
		memberDao.updateMember(member);
	}
	
	public void deleteMember(MemberBean member) throws Exception{
		memberDao.deleteMember(member);
	}

}
