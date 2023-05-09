package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.MagaDao;
import recipe.dao.MagaDaoImpl;
import recipe.model.MagaBean;

@Service
public class MagaServiceImpl implements MagaService {
	
	@Autowired
	private MagaDaoImpl magaDao;

	@Override
	public int getListCount() throws Exception {
		return magaDao.getListCount();
	}

	@Override
	public List getMagaList(int page) throws Exception {
		return magaDao.getMagaList(page);
	}
}
