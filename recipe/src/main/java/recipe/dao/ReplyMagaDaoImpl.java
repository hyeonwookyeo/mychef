package recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import recipe.model.MagaBean;
import recipe.model.ReplyMagaBean;

public class ReplyMagaDaoImpl implements ReplyMagaDao {
	private SqlSession session;
	
	public List<ReplyMagaBean> slist(int maga_num){
		
		return session.selectOne("MagaReply.slist",maga_num);	
		
	}
}
