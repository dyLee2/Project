package org.comstudy21.service;

import org.comstudy21.vo.MemberVO;

public interface MemberService {

	//회원가입
	public void signUp(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
}
