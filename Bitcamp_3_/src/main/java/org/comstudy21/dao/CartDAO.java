package org.comstudy21.dao;

import java.util.List;

import org.comstudy21.vo.CartDTO;


public interface CartDAO {
	
	// 장바구니 추가
	public void insertCart(CartDTO dto);

	// 장바구니 목록
	public List<CartDTO> listCart(String mId);

	// 장바구니 삭제
	public void deleteCart(CartDTO dto);

}
