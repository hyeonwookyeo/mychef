package recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.MemberDAOImpl;
import recipe.model.MemberBean;

@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDAOImpl memberDao;
	
	public int IdCheck(String id) throws Exception{
		return memberDao.IdCheck(id);
	}
	
	public MemberBean findid(MemberBean im) throws Exception{
		return memberDao.findid(im);
	}
	
	public MemberBean findpwd(MemberBean pm) throws Exception{
		return memberDao.findpwd(pm);
	}

	public void insertMember(MemberBean member) throws Exception{
		memberDao.insertMember(member);
	}
	
	public MemberBean userCheck(String id) throws Exception{
		return memberDao.userCheck(id);		
	}
}

