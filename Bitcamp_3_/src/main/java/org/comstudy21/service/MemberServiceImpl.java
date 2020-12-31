package org.comstudy21.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.comstudy21.dao.MemberDAO;
import org.comstudy21.util.FileUtils;
import org.comstudy21.vo.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

	@Service
	public class MemberServiceImpl implements MemberService {
		
		@Inject MemberDAO dao;
		
		@Override
		public int signUp(MemberVO vo) throws Exception {
			return dao.signUp(vo);
		}		
		
	 	@Override
		public MemberVO login(MemberVO vo) throws Exception {
			return dao.login(vo);
		}
	 	
	 	@Override
	 	public void memberUpdate(MemberVO vo) throws Exception {
	 		
	 		dao.memberUpdate(vo);
	 	}
	 	
	 	@Override
	 	public void memberDelete(MemberVO vo) throws Exception{
	 		
	 		dao.memberDelete(vo);
	 	}
	 	
	 	//@Override
	 	public int idCheck(MemberVO vo) throws Exception {
	 		int result = dao.idCheck(vo);
	 		return result;
	 	}

		@Override
		public MemberVO findId(MemberVO vo) {
			return dao.findId(vo);
		}

		@Override
		public MemberVO findPw(MemberVO vo) {
			return dao.findPw(vo);
		}

		@Override
		public MemberVO getMember(String mId) {
			return dao.getMember(mId);
		}
	 	
}
