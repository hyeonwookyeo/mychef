package recipe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import recipe.model.BoardDTO;

@Repository
public class BoardDaoImpl implements BoardDao{

	private SqlSessionTemplate sst;
	
	@Autowired
	public List<BoardDTO> list(BoardDTO board) {
		// TODO Auto-generated method stub
		return sst.selectList("boardns.list", board);
	}

	
	public int getTotal(BoardDTO board) {
		// TODO Auto-generated method stub
		return sst.selectOne("boardns.getTotal", board);
	}

	
	public int insert(BoardDTO board) {
		// TODO Auto-generated method stub
		return sst.insert("boardns.insert", board);
	}

	
	public BoardDTO select(int num) {
		return sst.selectOne("boardns.select", num);
	}

	public void selectUpdate(int num) {
		sst.update("boardns.selectUpdate", num);
	}

	public int update(BoardDTO board) {
		return sst.update("boardns.update", board);
	}

	public int delete(int num) {
		return sst.update("boardns.delete", num);
	}

	public int getMaxNum() {
		return sst.selectOne("boardns.getMaxNum");
	}

	public void updateRe(BoardDTO board) {
		sst.update("boardns.updateRe", board);
	}
}
