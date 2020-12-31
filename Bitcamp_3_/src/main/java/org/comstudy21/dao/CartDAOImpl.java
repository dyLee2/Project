package org.comstudy21.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.comstudy21.vo.CartDTO;
import org.springframework.stereotype.Service;



@Service
public class CartDAOImpl implements CartDAO {
	
	@Inject
	SqlSession sql;
	
	// 장바구니 추가
	@Override
	public void insertCart(CartDTO dto) {
		sql.insert("cartMapper.insert", dto);
	}
	
	// 장바구니 목록
	@Override
	public List<CartDTO> listCart(String mId) {
		return sql.selectList("cartMapper.List", mId);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(CartDTO dto) {
		sql.delete("cartMapper.delete", dto);
	}

}
