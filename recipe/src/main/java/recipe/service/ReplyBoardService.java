package recipe.service;

import java.util.List;

import recipe.model.ReplyBoardDTO;



public interface ReplyBoardService {

	public List<ReplyBoardDTO> slist(int commre_num) throws Exception;

	public void insert(ReplyBoardDTO reboard) throws Exception;

	public void delete(int commre_num) throws Exception;

	public void update(ReplyBoardDTO reboard);

}
