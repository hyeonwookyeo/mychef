package recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import recipe.dao.JjimDao;
import recipe.model.Recipe_Jjim;

@Service
public class JjimService {
	
	@Autowired
	private JjimDao dao;

	public int insert(Recipe_Jjim jjim) {
		// TODO Auto-generated method stub
		return dao.insert(jjim);
	}

	public List<Recipe_Jjim> getList() {
		// TODO Auto-generated method stub
		return dao.getList();
	}

	

	

	
}
