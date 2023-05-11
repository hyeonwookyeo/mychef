package recipe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.RecipeBoard;
import recipe.model.RecipeReBoard;

@Repository
public class RecipeReDaoImpl implements RecipeReDao{
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getTotalRe(RecipeBoard board) {
		// TODO Auto-generated method stub
		return sst.selectOne("reboardns.getTotal", board);
	}

	@Override
	public List<RecipeReBoard> listRe(RecipeReBoard reboard) {
		// TODO Auto-generated method stub
		return sst.selectList("reboardns.list", reboard);
	}

	@Override
	public int r_insertRe(RecipeReBoard reboard) {
		// TODO Auto-generated method stub
		return sst.insert("reboardns.insert", reboard);
	}

	@Override
	public int r_updateRe(RecipeReBoard reboard) {
		// TODO Auto-generated method stub
		return sst.update("reboardns.update", reboard);
	}

	@Override
	public int r_deleteRe(int rre_num) {
		// TODO Auto-generated method stub
		return sst.delete("reboardns.delete", rre_num);
	}

}
