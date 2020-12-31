package org.comstudy21.service;

import java.util.List;

import javax.inject.Inject;

import org.comstudy21.dao.BoardDAO;
import org.comstudy21.vo.BoardVO;
import org.springframework.stereotype.Service;

	@Service
	public class BoardServiceImpl implements BoardService {

		@Inject
		private BoardDAO dao;
		
		// 게시글 작성
		@Override
		public void write(BoardVO boardVO) throws Exception {
			dao.write(boardVO);
		}
		
		//게시글 목록 조회
		@Override
		public List<BoardVO> list() throws Exception{
			
			return dao.list();
		}
		
		//게시물 조회
		@Override
		public BoardVO read(int gNo) throws Exception{
			
			return dao.read(gNo);
		}
		
		@Override
		public void update(BoardVO boardVO) throws Exception{
			dao.update(boardVO);
		}
		
		@Override
		public void delete(int gNo) throws Exception{
			dao.delete(gNo);
		}
}
