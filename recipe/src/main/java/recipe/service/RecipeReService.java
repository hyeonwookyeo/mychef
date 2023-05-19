package recipe.service;

import java.util.List;


import recipe.model.RecipeBoard;
import recipe.model.RecipeReBoard;

public interface RecipeReService {
	
	int getTotalRe(int rnum);
	
	List<RecipeReBoard> listRe(RecipeReBoard reboard);
	
	int r_insertRe(RecipeReBoard reboard);
	
	int r_updateRe(RecipeReBoard reboard);
	
	int r_deleteRe(int rre_num);

	RecipeReBoard r_selectRe(int rre_num);

}
