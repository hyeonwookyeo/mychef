package recipe.service;

import java.util.List;

import recipe.model.MagaBean;

public interface MagaService {

	public int getListCount() throws Exception;

	public List<MagaBean> getMagaList(int page) throws Exception;

}
