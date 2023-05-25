package recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.ReplyBoardDTO;


@Repository
public class FreeReplyBoardDAOImpl implements FreeReplyBoardDAO {

	@Autowired
	private SqlSession session;

	public List<ReplyBoardDTO> slist(int comm_num) {

		return session.selectList("fboardreply.slist", comm_num);
	}

	public void insert(ReplyBoardDTO reboard) {

		session.insert("fboardreply.insert", reboard);
	}

	@Override
	public void delete(int commre_num) {

		session.delete("fboardreply.delete", commre_num);
	}

	@Override
	public void update(ReplyBoardDTO reboard) {

		session.update("fboardreply.update",reboard);
	}
}
