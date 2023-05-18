package recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession session;

	public int insert(Board board) {
		// TODO Auto-generated method stub
		return session.insert("boardns.insert", board);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return session.selectOne("boardns.count");
	}

	public List<Board> getBoardList(int page) {
		// TODO Auto-generated method stub
		return session.selectList("boardns.list", page);
	}

	public void updatecount(int ann_Num) {
		// TODO Auto-generated method stub
		session.update("hit", ann_Num);
	}

	public Board getBoard(int ann_Num) {
		// TODO Auto-generated method stub
		return session.selectOne("content", ann_Num);
	}

	public int update(Board board) {
		// TODO Auto-generated method stub
		return session.update("update", board);
	}

	public int delete(int ann_Num) {
		// TODO Auto-generated method stub
		return session.delete("delete", ann_Num);
	}
	

}









