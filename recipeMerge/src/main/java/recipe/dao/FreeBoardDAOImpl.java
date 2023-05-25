package recipe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.BoardDTO;


@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	/* 게시판 총 갯수  */
	public int getListCount(BoardDTO board){
		return session.selectOne("fboardns.board_count",board);
		
	}

	
	public List<BoardDTO> getBoardList(BoardDTO board) {
		List<BoardDTO> list = session.selectList("fboardns.board_list", board);

		return list;
	}

	@Override
	public void insert(BoardDTO board) {
		session.insert("fboardns.board_insert",board);
	}

	@Override
	public void readcount(int comm_num) {
		session.update("fboardns.board_readcount",comm_num);
	}

	@Override
	public BoardDTO board_cont(int comm_num){
		return session.selectOne("fboardns.board_cont",comm_num);
	}

	@Override
	public int board_del(int comm_num) {
		session.update("fboardns.board_del",comm_num);
		int result = 1;
		
		return result;	
		
	}


	public void board_up(BoardDTO b) {
		session.update("fboardns.board_up", b);
	}

}
