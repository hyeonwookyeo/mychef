package recipe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.MagaBean;
import recipe.model.RecipeBoard;

@Repository
public class MainDaoImpl implements MainDao{
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<RecipeBoard> main_list() {
		// TODO Auto-generated method stub
		return sst.selectList("mainns.select_recom");
	}

	@Override
	public List<MagaBean> main_magalist() {
		// TODO Auto-generated method stub
		return sst.selectList("mainns.select_maga");
	}

	@Override
	public List<RecipeBoard> new_rlist() {
		// TODO Auto-generated method stub
		return sst.selectList("mainns.select_new");
	}

}
