package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.MainDao;
import recipe.model.MagaBean;
import recipe.model.RecipeBoard;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDao dao;

	@Override
	public List<RecipeBoard> main_list() {
		// TODO Auto-generated method stub
		return dao.main_list();
	}

	@Override
	public List<MagaBean> main_magalist() {
		// TODO Auto-generated method stub
		return dao.main_magalist();
	}

	@Override
	public List<RecipeBoard> new_rlist() {
		// TODO Auto-generated method stub
		return dao.new_rlist();
	}

}
