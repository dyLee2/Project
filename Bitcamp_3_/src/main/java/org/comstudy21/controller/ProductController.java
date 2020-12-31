package org.comstudy21.controller;

import java.util.List;

import javax.inject.Inject;

import org.comstudy21.service.ProductService;
import org.comstudy21.vo.ProductDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	ProductService productService;

	// 상품등록
	@RequestMapping(value = "/product/insert", method = RequestMethod.POST)
	public String productInsert(ProductDTO dto) {
		logger.info("product insert");
		
		productService.insertProduct(dto);
		
		return "redirect:";
	}

	// 상품수정
	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public void productUpdate(ProductDTO dto) {
		logger.info("product update");
		
		productService.updateProduct(dto);
	}
	
	// 상품삭제
	public String productDelete(@RequestParam("pSeq") String pId) {
		logger.info("product delete");
		
		productService.deleteProduct(pId);
		
		return "redirect:";
		
	}

	// 상품목록
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public void productList(Model model) {
		logger.info("product list");

		List<ProductDTO> list = productService.listProduct();

		model.addAttribute("list", list);
	}

	// 상품상세보기
	@RequestMapping(value = "/product/view", method = RequestMethod.GET)
	public void productListView(@RequestParam("pSeq") String pId, Model model) {
		logger.info("product list view");

		ProductDTO product = productService.detailProduct(pId);

		model.addAttribute("product", product);
	}
	
	@GetMapping(value = "/test")
	public String producttest() {
		return "/product/product";
	}
}
