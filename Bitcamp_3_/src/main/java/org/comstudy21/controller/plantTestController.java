package org.comstudy21.controller;

import java.util.List;

import org.comstudy21.service.PlantTestServiceImpl;
import org.comstudy21.vo.PlantTestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/plant")
public class plantTestController {

	@Autowired
	PlantTestServiceImpl serviceImpl;

	// contextPath+ /plant/test << 하면 test페이지?
	@RequestMapping("/test")
	public String PlantTest() {
		return "plantTest/testStart";
	}

	// js 함수로 넘긴 설문조사 결과 객체값 받아오는 함수
	@RequestMapping(value = "/result", method = RequestMethod.POST)
	public ModelAndView PlantTestResult(@RequestParam("lv") String p_lv, @RequestParam("size") String p_size,
			@RequestParam("reason") String p_reason, @RequestParam("ownPet") String p_ownPet) {
		// @Requestparam으로 객체 value 받기
		System.out.println(">>1.controller 들어옴");
		String p_name = "";
		System.out.println(">>2.controller에서 serviceImpl.getPlants()호출");

		PlantTestVO plantVO = new PlantTestVO(p_lv, p_size, p_reason, p_ownPet);
		System.out.println("검색 조건: " + plantVO.toString());
		List<PlantTestVO> plants = null;
		
		
		System.out.print("조건에 맞는 식물이름: ");
		plants = serviceImpl.getPlants(plantVO);
		
		System.out.println("-----------------------------------");
		System.out.println(plants);
		
		String[] plantNames = new String[plants.size()];
		for (int i = 0; i < plants.size(); i++) {
			System.out.print(plants.get(i).getP_name() + ", ");
			plantNames[i] = plants.get(i).getP_name();
		}
		System.out.println();
		
		int randomIndex = (int)(Math.random()*(plants.size()));
		System.out.println("랜덤 idx >>> " + randomIndex);

		System.out.println("========================================");

		ModelAndView mav = new ModelAndView();
		mav.addObject("testResult", plantNames[randomIndex]);

		mav.setViewName("plantTest/plantTestData");
		return mav;

	}

}