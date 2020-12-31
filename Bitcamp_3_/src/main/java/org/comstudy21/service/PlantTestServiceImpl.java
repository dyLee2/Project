package org.comstudy21.service;

import java.util.List;

import javax.inject.Inject;

import org.comstudy21.dao.PlantTestDAO;
import org.comstudy21.vo.PlantTestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PlantTestServiceImpl {

//	@Autowired
//	PlantTestMapper mapper;

//	public List<PlantTestVO> getPlants(PlantTestVO plantVO){
//		System.out.println(">>3. ServiceImpl.getPlantNames() 실행, 서비스 들어옴");
////		return mapper.getPlantNames(plantVO);
//		return mapper.getPlants(plantVO);
//		}

//	public List<PlantTestVO> getPlants(PlantTestVO plantVO) {
//		System.out.println(">>3. ServiceImpl.getPlantNames() 실행, 서비스 들어옴");
//		return mapper.getPlants(plantVO);
//	}
	
	////////// 여기부터 새로 작성 /////////////
	
	@Inject
	PlantTestDAO dao;
	
	public List<PlantTestVO> getPlants(PlantTestVO plantVO) {
		return dao.getPlants(plantVO);
	}
	
	
}
