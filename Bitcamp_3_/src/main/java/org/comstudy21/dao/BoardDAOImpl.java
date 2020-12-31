package org.comstudy21.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.comstudy21.vo.BoardVO;
import org.comstudy21.vo.Criteria;
import org.comstudy21.vo.FileupVO;
import org.comstudy21.vo.SearchCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO, int category) throws Exception {
		String callMapper = "board" + category + "Mapper.insert";
		sqlSession.insert(callMapper, boardVO);	
	}
	
	
	//게시글 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri, int category) throws Exception{
		
		String callMapper = "board" + category + "Mapper.list";
		
		System.out.println("=========================================================================");
		System.out.println(callMapper);
		
		return sqlSession.selectList(callMapper, scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri, int category) throws Exception{
		String callMapper = "board" + category + "Mapper.listCount";
		return sqlSession.selectOne(callMapper, scri);
	}
	
	//게시물 조회
	@Override
	public BoardVO read(int gNo, int category) throws Exception{
		String callMapper = "board" + category + "Mapper.read";
		return sqlSession.selectOne(callMapper, gNo);
	}
	
	
	//게시물 수정
	@Override
	public void update(BoardVO boardVO, int category) throws Exception{
		String callMapper = "board" + category + "Mapper.update";
		sqlSession.update(callMapper, boardVO);
	}
	
	//게시물 삭제
	@Override
	public void delete(int gNo, int category) throws Exception{
		String callMapper = "board" + category + "Mapper.delete";
		sqlSession.delete(callMapper, gNo);
	}
	
	//게시물 조회
	@Override
	public void boardViews(int gNo, int category) throws Exception{
		String callMapper = "board" + category + "Mapper.boardViews";
		sqlSession.update(callMapper, gNo);
	}
	
	//파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("fileMapper.insertFile", map);
	}

	@Override
	public int getReplyCnt(int gNo, int category) {
		String callMapper = "board" + category + "Mapper.getReplyCnt";
		return sqlSession.selectOne(callMapper, gNo);
	}


	@Override
	public FileupVO getImg(int fNo) {
		return sqlSession.selectOne("fileMapper.getBoardImg", fNo);
	}
}