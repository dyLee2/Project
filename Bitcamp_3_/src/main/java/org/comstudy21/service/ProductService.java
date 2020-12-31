package org.comstudy21.service;

import java.util.List;

import org.comstudy21.vo.ProductDTO;


public interface ProductService {
	
	// 상품추가
	public void insertProduct(ProductDTO dto);
	
	// 상품목록
	public List<ProductDTO> listProduct();
	
	// 상품상세
	public ProductDTO detailProduct(String pId);
	
	// 상품수정
	public void updateProduct(ProductDTO dto);
	
	// 상품삭제
	public void deleteProduct(String pId);
}
