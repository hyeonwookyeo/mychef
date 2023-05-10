package recipe.dao;

import java.util.List;

import recipe.model.MagaBean;

public interface MagaDao {
	public int getListCount() throws Exception;

	public List<MagaBean> getMagaList(int page) throws Exception;

	public void insert(MagaBean maga) throws Exception;
	
	public void readcount(int maga_num) throws Exception;
}
