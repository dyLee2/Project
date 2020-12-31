package org.comstudy21.controller;

import java.util.ArrayList;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.comstudy21.service.BoardService;
import org.comstudy21.service.CommentService;
import org.comstudy21.service.MemberService;
import org.comstudy21.vo.BoardVO;
import org.comstudy21.vo.CommentVO;
import org.comstudy21.vo.Criteria;
import org.comstudy21.vo.FileupVO;
import org.comstudy21.vo.MemberVO;
import org.comstudy21.vo.PageMaker;
import org.comstudy21.vo.SearchCriteria;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	CommentService commentService;
	
	@Inject
	MemberService memberService;
	

	// 寃뚯떆�뙋 湲� �옉�꽦 �솕硫�
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public String writeView(HttpServletRequest req) throws Exception{
		logger.info("writeView");
		
		return "/board/b1/write";
	}
	
	// 寃뚯떆�뙋 湲� �옉�꽦
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("write");
		
		System.out.println("============================================ boardVO");
		System.out.println(boardVO);
		
		service.write(boardVO, mpRequest, 1);
		
		return "redirect:/board/list";
	}
	
	//寃뚯떆�뙋 紐⑸줉議고쉶
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		List<BoardVO> voList = service.list(scri, 1);
		
		// 寃��깋 寃곌낵 �븯�굹�룄 �뾾�쓣�븣 泥섎━
		if(voList.size() == 0) {
			model.addAttribute("fail", "fail");
			 
		} else {
			
			for(int i=0; i<voList.size(); i++) {
				int tmpGno = voList.get(i).getgNo();
				voList.get(i).setReplyCnt(service.getReplyCnt(tmpGno, 1));
			}
			
			model.addAttribute("list", voList);
		}
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri, 1));
		
		model.addAttribute("pageMaker", pageMaker);
			
		
		return "board/b1/list";
	}
	
	// 寃뚯떆�뙋 議고쉶
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		BoardVO writerVO = service.read(boardVO.getgNo(), 1);
		System.out.println("=====================================================");
		System.out.println(writerVO);
		
		FileupVO fileVO = service.getImg(writerVO.getfNo());
		
		model.addAttribute("img", fileVO.getStrName());
		model.addAttribute("read", writerVO);
		model.addAttribute("replyCnt", service.getReplyCnt(boardVO.getgNo(), 1));
		
		System.out.println("-==========================================");
		System.out.println(memberService.getMember(writerVO.getgWriter()).toString());
		
		
		// 寃뚯떆湲� �벖 �궗�엺�쓽 �봽濡쒗븘�쓣 蹂댁뿬二쇨린 �쐞�븳 硫ㅻ쾭媛앹껜 �쟾�떖
		model.addAttribute("writer", memberService.getMember(writerVO.getgWriter()));
		
		//�뙎湲� 遺�遺�	
		List<CommentVO> commentList = commentService.readComment(boardVO.getgNo(), 1);
		model.addAttribute("commentList", commentList);
		model.addAttribute("scri", scri);
		
		return "board/b1/get";
	}
	
	
	// 寃뚯떆�뙋 �닔�젙酉�
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getgNo(), 1));
		model.addAttribute("scri", scri);
		
		return "board/b1/modify";
	}
	
	// 寃뚯떆�뙋 �닔�젙
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		
		service.update(boardVO, 1);
		
//		rttr.addAttribute("page", scri.getPage());
//		rttr.addAttribute("perPageNum", scri.getPerPageNum());
//		rttr.addAttribute("searchType", scri.getSearchType());
//		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView?gNo="+boardVO.getgNo() + "&page="
				+ scri.getPage() + "&perPageNum=" + scri.getPerPageNum();
	}

	// 寃뚯떆�뙋 �궘�젣
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		service.delete(boardVO.getgNo(), 1);
		//�뙎湲��궘�젣源뚯� 援ы쁽�븯湲�/////////////////////////////
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	//�뙎湲� �옉�꽦
	@RequestMapping(value="/commentWrite", method = RequestMethod.POST)
	public String commentWrite(CommentVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("comment Write");
		
		commentService.writeComment(vo, 1);
		
		rttr.addAttribute("gNo", vo.getgNo());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	 //�뙎湲� �궘�젣
	@GetMapping(value="/commentDelete")
	public String commentDelete(CommentVO commentVO, SearchCriteria scri, BoardVO vo) {
		
		int result = commentService.deleteComment(commentVO.getGcNo(), 1);
		System.out.println("====================================="+ result + "===================================");
		return "redirect:/board/readView?gNo=" + vo.getgNo();
	}
	
	
}