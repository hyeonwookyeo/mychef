package recipe.service;

import java.util.List;


import recipe.model.BoardDTO;

public interface BoardService {
	// List<Board> list(int startRow, int endRow);
	List<BoardDTO> list(BoardDTO board);

	int getTotal(BoardDTO board);

	int insert(BoardDTO board);

	BoardDTO select(int num);

	void selectUpdate(int num);

	int update(BoardDTO board);

	int delete(int num);

	int getMaxNum();

	void updateRe(BoardDTO board);
}