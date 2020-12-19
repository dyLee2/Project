package org.comstudy21.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.comstudy21.vo.MemberVO;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;
	
	
	// 회원가입
	@Override
	public void signUp(MemberVO vo) throws Exception {
		sql.insert("memberMapper.signUp", vo);
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		
		return sql.selectOne("memberMapper.login", vo);
	}
}