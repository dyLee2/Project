package org.comstudy21.service;

import java.util.List;

import javax.inject.Inject;

import org.comstudy21.dao.CartDAO;
import org.comstudy21.vo.CartDTO;
import org.springframework.stereotype.Service;


@Service
public class CartServiceImpl implements CartService {

	@Inject
	CartDAO cartDao;
	
	// 장바구니 추가
	@Override
	public void insertCart(CartDTO dto) {
		cartDao.insertCart(dto);
	}

	// 장바구니 목록
	@Override
	public List<CartDTO> listCart(String mId) {
		return cartDao.listCart(mId);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(CartDTO dto) {
		cartDao.deleteCart(dto);
	}

}
