package recipe.service;

import org.springframework.stereotype.Service;

import recipe.model.RecipeBoard;
import recipe.model.RecipeReBoard;

@Service
public interface RecipeReService {
	
	int getTotalRe(RecipeBoard board);
	
	int r_insertRe(RecipeReBoard reboard);
	
	int r_updateRe(RecipeReBoard reboard);
	
	int r_deleteRe();

}
