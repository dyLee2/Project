package org.comstudy21.dao;

import java.util.List;
import java.util.Map;

import org.comstudy21.vo.BoardVO;
import org.comstudy21.vo.Criteria;
import org.comstudy21.vo.FileupVO;
import org.comstudy21.vo.SearchCriteria;

public interface BoardDAO {
	
	//// 게시글 작성 테스트
//		public void writeTest(BoardVO vo, int category);
	
	
	// 게시글 작성
		public void write(BoardVO boardVO, int category) throws Exception;
		
	// 게시글 목록 조회
		public List<BoardVO> list(SearchCriteria scri, int category) throws Exception;
	
	// 게시물 총 갯수
		public int listCount(SearchCriteria scri, int category) throws Exception;
		
	// 게시물 조회
		public BoardVO read(int gNo, int category) throws Exception;
		
	// 게시물 수정
		public void update(BoardVO boardVO, int category) throws Exception;
		
	// 게시물 삭제
		public void delete(int gNo, int category) throws Exception;
		
	// 게시판 조회수
		public void boardViews(int gNo, int category) throws Exception;
		
	// 파일 업로드
	public void  insertFile(Map<String, Object> map) throws Exception;

	public int getReplyCnt(int gNo, int category);

	// 게시판 첨부이미지 가져오기
	public FileupVO getImg(int fNo);
}
