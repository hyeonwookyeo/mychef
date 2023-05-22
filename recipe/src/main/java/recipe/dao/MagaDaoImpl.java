package recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recipe.model.MagaBean;
import recipe.model.MagaRecomBean;

@Repository
public class MagaDaoImpl implements MagaDao {
	
	@Autowired
	private SqlSession session;

	public int getListCount(MagaBean maga) throws Exception {
		int count = 0;
		count = ((Integer)session.selectOne("Maga.maga_count",maga)).intValue();
		
		return count;
	}

	@Override
	public List<MagaBean> getMagaList(MagaBean maga) throws Exception {
		List<MagaBean> list = session.selectList("Maga.maga_list",maga);
		
		return list;
	}

	@Override
	public void insert(MagaBean maga) throws Exception {
		session.insert("Maga.maga_insert",maga);
	}

	@Override
	public void readcount(int maga_num) throws Exception {
		session.update("Maga.maga_readcount",maga_num);
	}

	@Override
	public MagaBean maga_cont(int maga_num) throws Exception {
		return (MagaBean) session.selectOne("Maga.maga_cont",maga_num);
	}

	@Override
	public int maga_del(int maga_num) throws Exception {
		session.update("Maga.maga_del",maga_num);
		int result = 1;
		
		return result;
	}

	@Override
	public void maga_recom(int maga_num) throws Exception {
		session.update("Maga.maga_recom",maga_num);
	}

	@Override
	public int maga_recomcheck(MagaRecomBean magarecom) throws Exception {
		int result = 0;
		result = (Integer) session.selectOne("MagaRecom.maga_recomcheck",magarecom);
		
		return result;
	}

	@Override
	public void maga_recominsert(MagaRecomBean magarecom) throws Exception {
		session.insert("MagaRecom.maga_recominsert",magarecom);
	}

	public void re_cnt(int maga_num) {
		session.update("Maga.maga_re_cnt",maga_num);
	}

	public void re_cnt2(int maga_num) {
		System.out.println("여기1");
		session.update("Maga.maga_re_cnt2",maga_num);
	}

}
