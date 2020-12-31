package org.comstudy21.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.comstudy21.dao.BoardDAO;
import org.comstudy21.util.FileUtils;
import org.comstudy21.vo.BoardVO;
import org.comstudy21.vo.Criteria;
import org.comstudy21.vo.FileupVO;
import org.comstudy21.vo.SearchCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

	@Service
	public class BoardServiceImpl implements BoardService {

		@Resource(name="fileUtils")
		private FileUtils fileUtils;
		
		@Inject
		private BoardDAO dao;
		
		// 게시글 작성
		@Override
		public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest, int category) throws Exception {
			dao.write(boardVO, category);
			
			List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest);
			int size = list.size();
			for(int i=0; i<size; i++){ 
				dao.insertFile(list.get(i)); 
				System.out.println("===========================================================");
				System.out.println(i);
				System.out.println(list.get(i));
			}
		}
		
		////// 게시글 작성 테스트
//		public void write(BoardVO vo, int category) {
//			dao.writeTest(vo, category);
//		}
		
		//게시글 목록 조회
		@Override
		public List<BoardVO> list(SearchCriteria scri, int category) throws Exception{
			
			return dao.list(scri, category);
		}
		
		//게시글 총 갯수
		@Override
		public int listCount(SearchCriteria scri, int category) throws Exception{
			
			return dao.listCount(scri, category);
		}
		
		//게시물 조회
		@Transactional(isolation = Isolation.READ_COMMITTED )
		@Override
		public BoardVO read(int gNo, int category) throws Exception{
				dao.boardViews(gNo, category);
			return dao.read(gNo, category);
		}
		
		@Override
		public void update(BoardVO boardVO, int category) throws Exception{
			dao.update(boardVO, category);
		}
		
		@Override
		public void delete(int gNo, int category) throws Exception{
			dao.delete(gNo, category);
		}

		@Override
		public int getReplyCnt(int gNo, int category) {
			return dao.getReplyCnt(gNo, category);
		}

		@Override
		public FileupVO getImg(int fNo) {
			return dao.getImg(fNo);
		}
}
