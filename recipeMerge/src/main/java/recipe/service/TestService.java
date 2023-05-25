// Service 클래스 테스트
package recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.dao.TestDao;
import recipe.model.Test;

@Service
public class TestService {
	
	@Autowired
	private TestDao td;

	public int insert(Test test) {
		// TODO Auto-generated method stub
		return td.insert(test);
	}

}
