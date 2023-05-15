package recipe.dao;

import java.util.List;

import recipe.model.RecipeBoard;
import recipe.model.RecipeReBoard;

public interface RecipeReDao {

	int getTotalRe(int rnum);
	
	List<RecipeReBoard> listRe(int rnum);
	
	int r_insertRe(RecipeReBoard reboard);
	
	int r_updateRe(RecipeReBoard reboard);
	
	int r_deleteRe(int rre_num);
}
