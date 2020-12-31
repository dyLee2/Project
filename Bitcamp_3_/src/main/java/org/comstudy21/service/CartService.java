package org.comstudy21.service;

import java.util.List;

import org.comstudy21.vo.CartDTO;
import org.springframework.stereotype.Service;


@Service
public interface CartService {	
	
	// 장바구니 추가
	public void insertCart(CartDTO dto);
	
	// 장바구니 목록
	public List<CartDTO> listCart(String pKey);
	
	// 장바구니 삭제
	public void deleteCart(CartDTO dto);
}
