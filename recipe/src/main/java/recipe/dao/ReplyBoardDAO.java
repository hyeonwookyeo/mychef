package recipe.dao;

import java.util.List;

import recipe.model.ReplyBoardDTO;


public interface ReplyBoardDAO {

	public List<ReplyBoardDTO> slist(int comm_num);

	public void insert(ReplyBoardDTO reboard);

	public void delete(int commre_num);

	public void update(ReplyBoardDTO reboard);

}
