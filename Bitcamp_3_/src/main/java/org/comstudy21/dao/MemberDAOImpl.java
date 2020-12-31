package org.comstudy21.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.comstudy21.vo.MemberVO;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject 
	SqlSession sql;
	
	
	// 회원가입
	@Override
	public int signUp(MemberVO vo) throws Exception {
		return sql.insert("memberMapper.signUp", vo);
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		
		return sql.selectOne("memberMapper.login", vo);
	}
	
	//회원정보 수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception{
		
		sql.update("memberMapper.memberUpdate", vo);
	}
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception{
		
		
		sql.delete("memberMapper.memberDelete", vo);
	}
	
	// 아이디 중복 체크
	@Override
	public int idCheck(MemberVO vo) throws Exception{
		int result = sql.selectOne("memberMapper.idCheck", vo);
		return result;
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		return sql.selectOne("memberMapper.findId", vo);
	}

	@Override
	public MemberVO findPw(MemberVO vo) {
		return sql.selectOne("memberMapper.findPw", vo);
	}

	@Override
	public MemberVO getMember(String mId) {
		return sql.selectOne("memberMapper.getMember", mId);
	}
	
	//프로필 업로드
	@Override
	public void insertProfile(Map<String, Object> map) throws Exception {
		sql.insert("fileMapper.insertProfile", map);
	}
}