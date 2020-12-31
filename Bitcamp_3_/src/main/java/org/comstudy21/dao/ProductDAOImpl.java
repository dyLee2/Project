package org.comstudy21.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.comstudy21.vo.ProductDTO;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;
	
	// 상품추가
	@Override
	public void insertProduct(ProductDTO dto) {
		sqlSession.insert("productMapper.insert", dto);
	}
	
	// 상품목록
	@Override
	public List<ProductDTO> listProduct() {
		return sqlSession.selectList("productMapper.selectList");
	}

	// 상품상세
	@Override
	public ProductDTO detailProduct(String pId) {
		return sqlSession.selectOne("productMapper.detail", pId);
	}

	// 상품수정
	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("productMapper.update", dto);
	}

	// 상품삭제
	@Override
	public void deleteProduct(String pId) {
		sqlSession.delete("productMapper.delete", pId);
	}

	
}
