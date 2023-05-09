package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.RecipeDao;
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
	



}
