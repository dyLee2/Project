package org.comstudy21.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Member;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.comstudy21.service.MemberService;
import org.comstudy21.util.FileUtils;
import org.comstudy21.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.coobird.thumbnailator.Thumbnailator;


@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	//암호화기능
	//@Inject
	//BCryptPasswordEncoder pwdEncoder;
	
	// 회원가입 get
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() throws Exception {
		logger.info("get signUp");
	}
	
	
	// 회원가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ResponseEntity<String> joinPOST(MemberVO vo) throws Exception {
		logger.info("post join");
		
		//성공은 1, 실패면 0  
		int result = service.signUp(vo);
		System.out.println(result + "===================================");
		
		return result == 1 ?
				new ResponseEntity<String>(HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 회원 가입시 프로필 이미지 업로드
	@PostMapping("/uploadImg")
	public ResponseEntity<String> uploadImgPOST(MultipartFile[] uploadFile) {
		String uploadFolder = "c://project//Bitcamp_3_//src//main//webapp//resources//uploadImgs//members";
		String sendFileName = "";
		System.out.println("파일업로드 들어옴");
		
		for(MultipartFile multipartFile : uploadFile) {
			String originalFileName = multipartFile.getOriginalFilename();
			String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String storedFileName = uuid + originalFileExtension;
//			File saveFile = new File(uploadFolder, storedFileName);
			
			try {
//				multipartFile.transferTo(saveFile);
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "t_" + storedFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 150, 150);
				thumbnail.close();
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} finally {
				sendFileName = storedFileName;
			}
		}
		System.out.println(sendFileName);
		
		return new ResponseEntity<String>(sendFileName, HttpStatus.OK);
		
	}
	
	// 등록된 프로필 이미지 브라우저로 전송
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		File file = new File("c://project//Bitcamp_3_//src//main//webapp//resources//uploadImgs//members//" + fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
	//아이디 중복 체크
//	@ResponseBody
//	@RequestMapping(value="/idCheck", method= RequestMethod.POST,
//			produces = MediaType.APPLICATION_JSON_VALUE,
//			consumes = "application/json" )
//	public int idCheck(@RequestBody MemberVO vo) throws Exception{
//		int result = service.idCheck(vo);
//		
//		return result;
//	}
	
	// 비번 찾기 post
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST,
					produces = MediaType.APPLICATION_JSON_VALUE,
					consumes = "application/json")
	public ResponseEntity<String> idCheck(@RequestBody MemberVO vo, Model model) {
		
		
		int result = 0;
		try {
			result = service.idCheck(vo);
			System.out.println("result==============================================");
			System.out.println(vo.getmId());
			System.out.println(result);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(result == 0) {
			return new ResponseEntity<String>("0", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("1", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	
	
	
	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {}
	
	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			System.out.println("세션에 멤버 안 넣음 ====================================");
		}else {
			System.out.println("세션에 멤버 넣음 ====================================");
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
	}
	
	// 로그아웃 get
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest req) throws Exception{
		
		System.out.println("로그아웃들어옴=============================================");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원정보 수정 get
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public void registerUpdateView(Model model, HttpSession session) throws Exception{
		model.addAttribute("member", session.getAttribute("member"));
		System.out.println("===========================================");
		System.out.println(session.getAttribute("member"));
	}

	//회원정보 수정 post
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		
		service.memberUpdate(vo);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
		
	// 회원 탈퇴 post
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		MemberVO member = (MemberVO) session.getAttribute("member");
		// 세션 비밀번호
		String sessionPass = member.getPw();
		// vo로 들어오는 비밀번호
		String voPass = vo.getPw();
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/";
	}
	
		
	// 아이디 찾기 GET
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public void findIdGET() {}
	
	// 아이디 찾기 POST
	@RequestMapping(value = "/findIdResult", method = RequestMethod.POST)
	public void findIdResult(MemberVO vo, Model model) {
		System.out.println("=======================================");
		
		MemberVO resultVO = service.findId(vo);
		
		if(resultVO == null) {
			model.addAttribute("result", "fail");
		} else {
			model.addAttribute("result", "success");
			model.addAttribute("member", resultVO);
		}
		
	}
	
	// 비번 찾기 get
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public void findPwGET() {}
	
	// 비번 찾기 post
	@RequestMapping(value = "/findPw", method = RequestMethod.POST,
					produces = MediaType.APPLICATION_JSON_VALUE,
					consumes = "application/json")
	public ResponseEntity<String> findPwPOST(@RequestBody MemberVO vo, Model model) {
		
		System.out.println(vo);
		
		MemberVO resultVO = service.findPw(vo);
		
		if(resultVO == null) {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		
	}
		
	
}