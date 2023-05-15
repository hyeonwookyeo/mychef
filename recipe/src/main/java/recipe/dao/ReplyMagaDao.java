package recipe.dao;

import java.util.List;

import recipe.model.ReplyMagaBean;

public interface ReplyMagaDao {

	public List<ReplyMagaBean> slist(int maga_num);

	public void insert(ReplyMagaBean rmaga);

	public void delete(int magare_num);

}
