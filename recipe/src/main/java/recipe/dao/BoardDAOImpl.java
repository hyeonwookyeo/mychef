package recipe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.BoardDTO;


@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	/* 게시판 총 갯수  */
	public int getListCount(BoardDTO board){
		return session.selectOne("boardns.board_count",board);
		
	}

	
	public List<BoardDTO> getBoardList(BoardDTO board) {
		List<BoardDTO> list = session.selectList("boardns.board_list", board);

		return list;
	}

	@Override
	public void insert(BoardDTO board) {
		session.insert("boardns.board_insert",board);
	}

	@Override
	public void readcount(int comm_num) {
		session.update("boardns.board_readcount",comm_num);
	}

	@Override
	public BoardDTO board_cont(int comm_num){
		return session.selectOne("boardns.board_cont",comm_num);
	}

	@Override
	public int board_del(int comm_num) {
		session.update("boardns.board_del",comm_num);
		int result = 1;
		
		return result;	
		
	}


	public void board_up(BoardDTO board) {
		session.update("boardns.board_up", board);
	}


	public void board_idel(int comm_num) {
		session.update("boardns.board_idel", comm_num);
		
	}

}
