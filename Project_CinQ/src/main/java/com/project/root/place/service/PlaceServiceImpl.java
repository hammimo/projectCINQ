package com.project.root.place.service;

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
	public String rentPlaceSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
			int num = 0;
	
		PlaceDTO dto = new PlaceDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setLoc_name(mul.getParameter("loc_name"));
		dto.setAddr(mul.getParameter("addrResult"));
		
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
			url = "/member/myinfo2?id="+dto.getId();
		} else {
			msg = "문제가 생겼습니다~";
			url = "/place/rentPlace";
		}
		
		return pfs.getMessage(request, msg, url);
	}
	
	@Override
	public void placeAllList(Model model) {
		model.addAttribute("placeList", mapper.placeAllList());		
	}
	 
}
	

