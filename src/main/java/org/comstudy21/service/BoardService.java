package org.comstudy21.service;

import java.util.List;

import org.comstudy21.vo.BoardVO;

public interface BoardService {
	
	// 게시글 작성
		public void write(BoardVO boardVO) throws Exception;
		
	// 게시글 목록 조회
		public List<BoardVO> list() throws Exception;
		
	// 게시글 조회
		public BoardVO read(int gNo) throws Exception;

	// 게시글 수정
		public void update(BoardVO boardVO) throws Exception;
		
	// 게시물 삭제
		public void delete(int gNo) throws Exception;
}
