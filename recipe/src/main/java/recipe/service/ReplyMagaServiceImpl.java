package recipe.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.ReplyMagaDao;
import recipe.model.ReplyMagaBean;

@Service
public class ReplyMagaServiceImpl implements ReplyMagaService {

	@Autowired
	private ReplyMagaDao R_magaDao;
	
	public List<ReplyMagaBean> slist(int maga_num){
		
		return R_magaDao.slist(maga_num);
	}
}
