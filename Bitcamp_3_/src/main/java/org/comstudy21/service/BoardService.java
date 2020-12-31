package org.comstudy21.service;

import java.util.List;

import org.comstudy21.vo.BoardVO;
import org.comstudy21.vo.Criteria;
import org.comstudy21.vo.FileupVO;
import org.comstudy21.vo.SearchCriteria;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {
	
//		public void write(BoardVO vo, int category);
	
	// 게시글 작성
		public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest, int category) throws Exception;
		
	// 게시글 목록 조회
		public List<BoardVO> list(SearchCriteria scri, int category) throws Exception;
	
	// 게시글 총 갯수
		public int listCount(SearchCriteria scri, int category) throws Exception;
		
	// 게시글 조회
		public BoardVO read(int gNo, int category) throws Exception;

	// 게시글 수정
		public void update(BoardVO boardVO, int category) throws Exception;
		
	// 게시물 삭제
		public void delete(int gNo, int category) throws Exception;

	// 댓글 수 가져오기
		public int getReplyCnt(int gNo, int category);

		// 게시판 글 첨부 이미지 가져오기
		public FileupVO getImg(int fNo);
		
	
}
