// DAO 테스트
package recipe.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.Test;

@Repository
public class TestDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(Test test) {
		// TODO Auto-generated method stub
		return sst.insert("testns.insert", test);
	}

}
