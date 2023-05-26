package recipe.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.Admin;
import recipe.model.MemberBean;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Admin admin) {
		return sst.insert("adminns.insert", admin);
	}

	@Override
	public Admin getAdmin(Admin admin) {
		return sst.selectOne("adminns.select", admin);
	}

	@Override
	public int change_member(MemberBean member) {
		// TODO Auto-generated method stub
		return sst.update("adminns.update_member", member);
	}
	
	
}
