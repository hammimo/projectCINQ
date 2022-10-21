package com.project.root.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.mybatis.place.PlaceMapper;
import com.project.root.place.dto.PlaceDTO;

@Service
public class PlaceServiceImpl implements PlaceService{

	@Autowired
	PlaceMapper mapper;
	
	@Autowired
	PlaceFileService pfs;

	@Override
	public void placeAllList(Model model, int num) {
		model.addAttribute("placeList", mapper.placeAllList());		
	}
	
	
		
		@Override
	public String rentPlaceSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
			int num = 0;
	
		PlaceDTO dto = new PlaceDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setAddr(mul.getParameter("addr"));
		dto.setLoc_name(mul.getParameter("loc_name"));
		MultipartFile file = mul.getFile("image");
		
		try {
			
			dto.setMax_count(Integer.parseInt(mul.getParameter("max_count")));
		} catch (Exception e) {
			dto.setMax_count(num);
		}
		
		if(file.getSize() != 0) {
			dto.setImage(pfs.saveFile(file));
		} else {
			dto.setImage("nan");
		}
		
		int result = 0;
		try {
			result = mapper.rentPlaceSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "새글이 등록 되었습니다...";
			url = "/place/placeAllList";
		} else {
			msg = "문제가 생겼습니다~";
			url = "/place/rentPlace";
		}
		
		return pfs.getMessage(request, msg, url);
	}
	
}
	

