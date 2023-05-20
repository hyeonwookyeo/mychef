package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.NoticeDao;
import recipe.model.Board;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDao dao;

	public int insert(Board notice) {
		// TODO Auto-generated method stub
		return dao.insert(notice);
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
	
	public int update(Board notice) {
		return dao.update(notice);
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











