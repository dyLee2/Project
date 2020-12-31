package org.comstudy21.service;

import org.comstudy21.vo.MemberVO;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MemberService {

	//회원가입
	public int signUp(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//회원수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//회원탈퇴
	public void memberDelete(MemberVO vo)throws Exception;

	//아이디 중복 체크
	public int idCheck(MemberVO vo) throws Exception;

	public MemberVO findId(MemberVO vo);

	public MemberVO findPw(MemberVO vo);
	
	public MemberVO getMember(String mId);
}
