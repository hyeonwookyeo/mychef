package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.RecipeDao;
import recipe.model.MemberBean;
import recipe.model.R_recomm;
import recipe.model.R_zzim;
import recipe.model.RecipeBoard;

@Service
public class RecipeServiceImpl implements RecipeService{
	
	@Autowired
	private RecipeDao dao;

	@Override
	public int r_insert(RecipeBoard board) {
		// TODO Auto-generated method stub
		return dao.r_insert(board);
	}

	@Override
	public int getTotal(RecipeBoard board) {
		// TODO Auto-generated method stub
		return dao.getTotal(board);
	}

	@Override
	public List<RecipeBoard> r_list(RecipeBoard board) {
		// TODO Auto-generated method stub
		return dao.r_list(board);
	}

	@Override
	public void r_readcountUpdate(int rnum) {
		// TODO Auto-generated method stub
		dao.r_readcountUpdate(rnum);
	}

	@Override
	public RecipeBoard r_select(int rnum) {
		// TODO Auto-generated method stub
		return dao.r_select(rnum);
	}

	@Override
	public int r_update(RecipeBoard board) {
		// TODO Auto-generated method stub
		return dao.r_update(board);
	}

	@Override
	public int r_delete(int rnum) {
		// TODO Auto-generated method stub
		return dao.r_delete(rnum);
	}
	
	@Override
	public int r_recomm(R_recomm recomm) {
		// TODO Auto-generated method stub
		return dao.r_recomm(recomm);
	}

	@Override
	public void r_recomm_add(R_recomm recomm) {
		// TODO Auto-generated method stub
		dao.r_recomm_add(recomm);
	}

	@Override
	public int r_recomm_count(R_recomm recomm) {
		// TODO Auto-generated method stub
		return dao.r_recomm_count(recomm);
	}

	@Override
	public void r_recomm_delete(R_recomm recomm) {
		// TODO Auto-generated method stub
		dao.r_recomm_delete(recomm);
	}

	@Override
	public int r_recomm_plus(int rnum) {
		// TODO Auto-generated method stub
		return dao.r_recomm_plus(rnum);
	}

	@Override
	public void r_recomm_minus(int rnum) {
		// TODO Auto-generated method stub
		dao.r_recomm_minus(rnum);
	}

	@Override
	public MemberBean m_select(String id) {
		// TODO Auto-generated method stub
		return dao.m_select(id);
	}

	@Override
	public int r_zzim(R_zzim zzim) {
		// TODO Auto-generated method stub
		return dao.r_zzim(zzim);
	}
	
	@Override
	public int r_zzim_add(R_zzim zzim) {
		// TODO Auto-generated method stub
		return dao.r_zzim_add(zzim);
	}




}
