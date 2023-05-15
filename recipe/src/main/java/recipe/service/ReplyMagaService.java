package recipe.service;

import java.util.List;

import recipe.model.ReplyMagaBean;

public interface ReplyMagaService {

	public List<ReplyMagaBean> slist(int maga_num) throws Exception;

	public void insert(ReplyMagaBean rmaga) throws Exception;

	public void delete(int magare_num) throws Exception;

}
