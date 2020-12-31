package org.comstudy21.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.comstudy21.vo.PlantTestVO;
import org.springframework.stereotype.Repository;

@Repository
public class PlantTestDAOImpl implements PlantTestDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<PlantTestVO> getPlants(PlantTestVO plantVO) {
		
		return sqlSession.selectList("plantTestMapper.getPlants", plantVO);
	}

}
