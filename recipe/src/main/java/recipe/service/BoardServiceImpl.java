package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.BoardDao;
import recipe.model.BoardDTO;




@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;

	// public List<Board> list(int startRow, int endRow) {
	public List<BoardDTO> list(BoardDTO board) {
		return bd.list(board);
		// return bd.list(startRow, endRow);
	}

	public int getTotal(BoardDTO board) {
		return bd.getTotal(board);
	}

	public int insert(BoardDTO board) {
		return bd.insert(board);
	}

	public BoardDTO select(int num) {
		return bd.select(num);
	}

	public void selectUpdate(int num) {
		bd.selectUpdate(num);
	}

	public int update(BoardDTO board) {
		return bd.update(board);
	}

	public int delete(int num) {
		return bd.delete(num);
	}

	public int getMaxNum() {
		return bd.getMaxNum();
	}

	public void updateRe(BoardDTO board) {
		bd.updateRe(board);
	}
}