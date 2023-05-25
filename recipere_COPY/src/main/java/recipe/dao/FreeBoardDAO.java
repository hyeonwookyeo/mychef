package recipe.dao;

import java.util.List;

import recipe.model.BoardDTO;


public interface FreeBoardDAO {
	public int getListCount(BoardDTO board) throws Exception;

	public List<BoardDTO> getBoardList(BoardDTO board) throws Exception;

	public void insert(BoardDTO board) throws Exception;
	
	public void readcount(int comm_num) throws Exception;
	
	public BoardDTO board_cont(int comm_num) throws Exception;
	
	public int board_del(int comm_num) throws Exception;

	public void board_up(BoardDTO b) throws Exception;
	
}