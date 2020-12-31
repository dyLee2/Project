package org.comstudy21.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.comstudy21.service.*;
import org.comstudy21.vo.CartDTO;
import org.comstudy21.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/cart/*")
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Inject
	CartService cartService;

	// 장바구니 추가
	@RequestMapping(value = "/cart/insertCart", method = RequestMethod.GET)
	public int insertCart(CartDTO dto, HttpSession session) {
		logger.info("insertCart");

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			dto.setMId(member.getmId());
//			cartService.insertCart(dto);

			result = 1;
		}

		return result;
	}

	// 장바구니 목록
	@RequestMapping(value = "/cart/listCart", method = RequestMethod.GET)
	public void listCart(HttpSession session, Model model) {
		logger.info("listCart");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String mId = member.getmId();

		List<CartDTO> listCart = cartService.listCart(mId);

		model.addAttribute("listCart", listCart);
	}
	
	@RequestMapping(value = "/cart/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartDTO cart) {
		logger.info("deleteCart");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String mId = member.getmId();
		
		int result = 0;
		int cartNum = 0;		
		
		// 로그인 여부 구분
		if(member != null) {
			cart.setMId(mId);
			
			for(String i : chArr) {  // 에이젝스에서 받은 chArr의 갯수만큼 반복
				cartNum = Integer.parseInt(i);  // i번째 데이터를 cartNum에 저장
				cart.setCartNum(cartNum);
				cartService.deleteCart(cart);
			}			
			result = 1;
		}
		return result;		
	}

}
