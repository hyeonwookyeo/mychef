package recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.Recipe_Jjim;

@Repository
public class JjimDao {
	
	@Autowired
    private SqlSession session;

	public int insert(Recipe_Jjim jjim) {
		// TODO Auto-generated method stub
		return session.insert("jjimns.insert", jjim);
	}

	public List<Recipe_Jjim> getList() {
		// TODO Auto-generated method stub
		return session.selectList("jjimns.list");
	}

   

}