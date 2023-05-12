package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.RecipeReDao;
import recipe.model.RecipeBoard;
import recipe.model.RecipeReBoard;

@Service
public class RecipeReServiceImpl implements RecipeReService{
	
	@Autowired
	private RecipeReDao redao;

	@Override
	public int getTotalRe(int rnum) {
		// TODO Auto-generated method stub
		return redao.getTotalRe(rnum);
	}

	@Override
	public List<RecipeReBoard> listRe(int rnum) {
		// TODO Auto-generated method stub
		return redao.listRe(rnum);
	}

	@Override
	public int r_insertRe(RecipeReBoard reboard) {
		// TODO Auto-generated method stub
		return redao.r_insertRe(reboard);
	}

	@Override
	public int r_updateRe(RecipeReBoard reboard) {
		// TODO Auto-generated method stub
		return redao.r_updateRe(reboard);
	}

	@Override
	public int r_deleteRe(int rre_num) {
		// TODO Auto-generated method stub
		return redao.r_deleteRe(rre_num);
	}

}
