package recipe.service;

import java.util.List;

import recipe.model.MagaBean;
import recipe.model.MagaRecomBean;

public interface MagaService {

	public int getListCount() throws Exception;

	public List<MagaBean> getMagaList(int page) throws Exception;

	public void insert(MagaBean maga) throws Exception;
	
	public void readcount(int maga_num) throws Exception;
	
	public MagaBean maga_cont(int maga_num) throws Exception;
	
	public int maga_del(int maga_num) throws Exception;
	
	public void maga_recom(int maga_num) throws Exception;
	
	public int maga_recomcheck(MagaRecomBean magarecom) throws Exception;
	
	public void maga_recominsert(MagaRecomBean magarecom) throws Exception;
}
