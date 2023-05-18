package recipe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.R_recomm;
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
	
	@Override
	public int r_recomm(R_recomm recomm) {
		// TODO Auto-generated method stub
		return sst.selectOne("r_recommns.select", recomm);
	}

	@Override
	public void r_recomm_add(R_recomm recomm) {
		// TODO Auto-generated method stub
		sst.insert("r_recommns.insert", recomm);
	}

	@Override
	public int r_recomm_count(R_recomm recomm) {
		// TODO Auto-generated method stub
		return sst.selectOne("r_recommns.count", recomm);
	}

	@Override
	public void r_recomm_delete(R_recomm recomm) {
		// TODO Auto-generated method stub
		sst.delete("r_recommns.delete", recomm);
	}

	@Override
	public int r_recomm_plus(int rnum) {
		// TODO Auto-generated method stub
		return sst.update("r_recommns.plus", rnum);
	}

	@Override
	public void r_recomm_minus(int rnum) {
		// TODO Auto-generated method stub
		sst.update("r_recommns.minus", rnum);
	}

	
	
}
