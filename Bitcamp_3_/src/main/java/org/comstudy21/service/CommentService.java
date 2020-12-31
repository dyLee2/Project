package org.comstudy21.service;

import java.util.List;

import org.comstudy21.vo.CommentVO;

public interface CommentService {
	
	//댓글 조회
	public List<CommentVO> readComment(int gNo, int category) throws Exception;
	
	//댓글 작성
	public void writeComment(CommentVO vo, int category) throws Exception;
	
	// 댓글 삭제
	public int deleteComment(int gcNo, int category);
}

