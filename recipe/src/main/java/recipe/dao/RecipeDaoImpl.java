package recipe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.RecipeBoard;

@Repository
public class RecipeDaoImpl implements RecipeDao{
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int r_insert(RecipeBoard board) {
		// TODO Auto-generated method stub
		return sst.insert("boardns.insert", board);
	}

	@Override
	public int getTotal(RecipeBoard board) {
		// TODO Auto-generated method stub
		return sst.selectOne("boardns.getTotal", board);
//		return sst.selectOne("boardns.getTotal");
	}

	@Override
	public List<RecipeBoard> r_list(RecipeBoard board) {
		// TODO Auto-generated method stub
		return sst.selectList("boardns.list", board);
	}

	@Override
	public void r_readcountUpdate(int rnum) {
		// TODO Auto-generated method stub
		sst.update("boardns.readcountUpdate", rnum);
	}

	@Override
	public RecipeBoard r_select(int rnum) {
		// TODO Auto-generated method stub
		return sst.selectOne("boardns.select", rnum);
	}

	@Override
	public int r_update(RecipeBoard board) {
		// TODO Auto-generated method stub
		return sst.update("boardns.update", board);
	}

	@Override
	public int r_delete(int rnum) {
		// TODO Auto-generated method stub
		return sst.update("boardns.delete", rnum);
	}
	
	
}
