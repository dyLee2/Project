package org.comstudy21.service;

import java.util.List;

import javax.inject.Inject;

import org.comstudy21.dao.CommentDAO;
import org.comstudy21.vo.CommentVO;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Inject
	private CommentDAO dao;
	
	@Override
	public List<CommentVO> readComment(int gNo, int category) throws Exception{
		return dao.readComment(gNo, category);
	}

	@Override
	public void writeComment(CommentVO vo, int category) throws Exception{
		dao.writeComment(vo, category);
	}

	@Override
	public int deleteComment(int gcNo, int category) {
		return dao.deleteComment(gcNo, category);
	}

}
