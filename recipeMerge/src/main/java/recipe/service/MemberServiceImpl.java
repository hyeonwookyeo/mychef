package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.MemberDAOImpl;
import recipe.model.MemberBean;


@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDAOImpl memberDao;
	
	public int IdCheck(String id) throws Exception{
		return memberDao.checkMemberId(id);
	}
	
	public int NicknameCheck(String nickname) throws Exception {
		return memberDao.checkMemberNickname(nickname);
	}
	
	public MemberBean findid(MemberBean im) throws Exception{
		return memberDao.findid(im);
	}
	
	public MemberBean findpwd(MemberBean pm) throws Exception{
		return memberDao.findpwd(pm);
	}

	public int insertMember(MemberBean member) throws Exception{
		return memberDao.insertMember(member);
	}
	public int updateNewpwd(MemberBean member) throws Exception{
		return memberDao.updateNewpwd(member);
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

	public List<MemberBean> getMemberList(MemberBean member) throws Exception {
	    return memberDao.getMemberList(member);
	}

	public int getMemberCount() {
		// TODO Auto-generated method stub
		return memberDao.getMemberCount();
	}
	

	

}
