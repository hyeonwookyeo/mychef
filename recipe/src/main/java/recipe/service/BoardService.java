package recipe.service;

import java.util.List;

import recipe.model.BoardDTO;


public interface BoardService {

	public int getListCount(BoardDTO board) throws Exception;

	public List<BoardDTO> getBoardList(BoardDTO board) throws Exception;

	public void insert(BoardDTO board) throws Exception;
	
	public void readcount(int comm_num) throws Exception;
	
	public BoardDTO board_cont(int maga_num) throws Exception;
	
	public int board_del(int maga_num) throws Exception;
	
	/*
	 * public void maga_recom(int maga_num) throws Exception;
	 * 
	 * public int maga_recomcheck(MagaRecomBean magarecom) throws Exception;
	 * 
	 * public void maga_recominsert(MagaRecomBean magarecom) throws Exception;
	 * 
	 * public void re_cnt(int maga_num);
	 */

}
