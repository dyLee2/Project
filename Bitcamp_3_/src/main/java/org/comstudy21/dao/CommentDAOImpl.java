package org.comstudy21.dao;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.comstudy21.vo.CommentVO;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOImpl implements CommentDAO{

	@Inject
	SqlSession sql;
	
	//댓글 조회
	@Override
	public List<CommentVO> readComment(int gNo, int category) throws Exception{
		String callMapper = "comment" + category + "Mapper.readComment";
		return sql.selectList(callMapper, gNo);
	}
	
	//댓글 작성
	@Override
	public void writeComment(CommentVO vo, int category) throws Exception{
		String callMapper = "comment" + category + "Mapper.writeComment";
		sql.insert(callMapper, vo);
	}

	@Override
	public int deleteComment(int gcNo, int category){
		String callMapper = "comment" + category + "Mapper.deleteComment";
		return sql.delete(callMapper, gcNo);
	}
}
