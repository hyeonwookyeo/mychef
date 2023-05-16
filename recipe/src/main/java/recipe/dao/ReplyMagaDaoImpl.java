package recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.ReplyMagaBean;

@Repository
public class ReplyMagaDaoImpl implements ReplyMagaDao {

	@Autowired
	private SqlSession session;

	public List<ReplyMagaBean> slist(int maga_num) {

		return session.selectList("MagaReply.slist", maga_num);
	}

	public void insert(ReplyMagaBean rmaga) {

		session.insert("MagaReply.insert", rmaga);
	}

	@Override
	public void delete(int magare_num) {

		session.delete("MagaReply.delete", magare_num);
	}

	@Override
	public void update(ReplyMagaBean rmaga) {

		session.update("MagaReply.update",rmaga);
	}
}
