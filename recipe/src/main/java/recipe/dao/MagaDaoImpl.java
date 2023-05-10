package recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.MagaBean;

@Repository
public class MagaDaoImpl implements MagaDao {
	
	@Autowired
	private SqlSession session;

	public int getListCount() throws Exception {
		int count = 0;
		count = ((Integer)session.selectOne("Maga.maga_count")).intValue();
		
		return count;
	}

	public List<MagaBean> getMagaList(int page) throws Exception {
		List<MagaBean> list = session.selectList("Maga.maga_list",page);
		
		return list;
	}

	public void insert(MagaBean maga) throws Exception {
		session.insert("Maga.maga_insert",maga);
	}

	public void readcount(int maga_num) throws Exception {
		session.update("Maga.maga_readcount",maga_num);
	}

	public MagaBean maga_cont(int maga_num) throws Exception {
		return (MagaBean) session.selectOne("Maga.maga_cont",maga_num);
	}


}
