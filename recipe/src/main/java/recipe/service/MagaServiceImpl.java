package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.MagaDaoImpl;
import recipe.model.MagaBean;
import recipe.model.MagaRecomBean;

@Service
public class MagaServiceImpl implements MagaService {
	
	@Autowired
	private MagaDaoImpl magaDao;

	@Override
	public int getListCount() throws Exception {
		return magaDao.getListCount();
		
	}

	public List getMagaList(int page) throws Exception {
		return magaDao.getMagaList(page);
		
	}

	public void insert(MagaBean maga) throws Exception {
		magaDao.insert(maga);
		
	}

	public void readcount(int maga_num) throws Exception {
		magaDao.readcount(maga_num);
		
	}

	public MagaBean maga_cont(int maga_num) throws Exception {
		return magaDao.maga_cont(maga_num);
		
	}

	public int maga_del(int maga_num) throws Exception {
		return magaDao.maga_del(maga_num);
		
	}

	public void maga_recom(int maga_num) throws Exception {
		magaDao.maga_recom(maga_num);
		
	}

	public int maga_recomcheck(MagaRecomBean magarecom) throws Exception {
		return magaDao.maga_recomcheck(magarecom);
		
	}

	public void maga_recominsert(MagaRecomBean magarecom) throws Exception {
		magaDao.maga_recominsert(magarecom);
		
	}

}
