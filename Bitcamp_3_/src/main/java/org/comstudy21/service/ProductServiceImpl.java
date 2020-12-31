package org.comstudy21.service;

import java.util.List;

import javax.inject.Inject;

import org.comstudy21.dao.ProductDAO;
import org.comstudy21.vo.ProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO dao;

	// 상품추가
	@Override
	public void insertProduct(ProductDTO dto) {
		dao.insertProduct(dto);
	}
	
	// 상품목록
	@Override
	public List<ProductDTO> listProduct() {
		return dao.listProduct();
	}

	// 상품상세
	@Override
	public ProductDTO detailProduct(String pId) {
		return dao.detailProduct(pId);
	}

	// 상품수정
	@Override
	public void updateProduct(ProductDTO dto) {
		dao.updateProduct(dto);
	}

	// 상품삭제
	@Override
	public void deleteProduct(String pId) {
		dao.deleteProduct(pId);
	}

	
	
}
