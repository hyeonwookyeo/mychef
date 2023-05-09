package recipe.dao;

import java.util.List;

import recipe.model.RecipeBoard;

public interface RecipeDao {

// 글작성
	int r_insert(RecipeBoard board);

// 리스트
	int getTotal(RecipeBoard board);

	List<RecipeBoard> r_list(RecipeBoard board);

// 글조회
	void r_readcountUpdate(int rnum);

	RecipeBoard r_select(int rnum);

// 글수정
	int r_update(RecipeBoard board);

// 글삭제
	int r_delete(int rnum);

}
