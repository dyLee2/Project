package org.comstudy21.service;

import javax.inject.Inject;
import org.comstudy21.dao.MemberDAO;
import org.comstudy21.vo.MemberVO;
import org.springframework.stereotype.Service;

	@Service
	public class MemberServiceImpl implements MemberService {
		
		@Inject MemberDAO dao;
		
		@Override
		public void signUp(MemberVO vo) throws Exception {
			dao.signUp(vo);
		}		
		
	 	@Override
		public MemberVO login(MemberVO vo) throws Exception {
			return dao.login(vo);
		}
}
