package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.BoardDao;
import recipe.model.Board;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao dao;

	public int insert(Board board) {
		// TODO Auto-generated method stub
		return dao.insert(board);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}

	/*
	 * public List<Board> getBoards(int page) { // TODO Auto-generated method stub
	 * return dao.getn_BoardList(page); }
	 */

	public void updatecount(int ann_Num) {
		// TODO Auto-generated method stub
		dao.updatecount(ann_Num);
		
	}

	public Board getBoard(int ann_Num) {
		// TODO Auto-generated method stub
		return dao.getBoard(ann_Num);
	}
	
	public int update(Board board) {
		return dao.update(board);
	}

	public int delete(int ann_Num) {
		// TODO Auto-generated method stub
		return dao.delete(ann_Num);
	}

	public List<Board> getn_boardlist(int page) {
		// TODO Auto-generated method stub
		return dao.getn_BoardList(page);
	}

	

}











