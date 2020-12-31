package org.comstudy21.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.comstudy21.vo.BoardVO;
import org.comstudy21.vo.MemberVO;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\\\project\\\\Bitcamp_3_\\\\src\\\\main\\\\webapp\\\\resources\\\\uploadImgs\\\\board\\"; // 파일이 저장될 위치
											
	public List<Map<String, Object>> parseInsertFileInfo(BoardVO boardVO, 
			MultipartHttpServletRequest mpRequest) throws Exception{

		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int gNo = boardVO.getgNo();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("gNo", gNo);
				listMap.put("orgName", originalFileName);
				listMap.put("strName", storedFileName);
				listMap.put("fSize", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
		
	}
		
		public List<Map<String, Object>> parseInsertProfileInfo(MemberVO memberVO, 
				MultipartHttpServletRequest mpRequest) throws Exception{

			
			Iterator<String> iterator = mpRequest.getFileNames();
			
			MultipartFile multipartFile = null;
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = null;
			
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			Map<String, Object> listMap = null;
			
			String mId = memberVO.getmId();
			
			File file = new File(filePath);
			if(file.exists() == false) {
				file.mkdirs();
			}
			
			while(iterator.hasNext()) {
				multipartFile = mpRequest.getFile(iterator.next());
				if(multipartFile.isEmpty() == false) {
					originalFileName = multipartFile.getOriginalFilename();
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					storedFileName = getRandomString() + originalFileExtension;
					
					file = new File(filePath + storedFileName);
					multipartFile.transferTo(file);
					listMap = new HashMap<String, Object>();
					listMap.put("mId", mId);
					listMap.put("orgName", originalFileName);
					listMap.put("strName", storedFileName);
					listMap.put("fSize", multipartFile.getSize());
					list.add(listMap);
				}
			}
			return list;
	}
	
	
	
	
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}