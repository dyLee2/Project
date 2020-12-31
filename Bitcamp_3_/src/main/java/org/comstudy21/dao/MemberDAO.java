package org.comstudy21.dao;

import java.util.Map;

import org.comstudy21.vo.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public int signUp(MemberVO vo) throws Exception; 

	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//회원정보 수정
	public void memberUpdate(MemberVO vo)throws Exception;


	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	// 아이디 중복 체크
	public int idCheck(MemberVO vo) throws Exception;

	public MemberVO findId(MemberVO vo);

	public MemberVO findPw(MemberVO vo);
	
	public MemberVO getMember(String mId);
	
	//프로필 업로드
	public void  insertProfile(Map<String, Object> map) throws Exception;
	
}
