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
		dto.setLoc_name(mul.getParameter("addrResult"));
		dto.setLoc_sep_name(mul.getParameter("loc_sep_name"));
		
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
			url = "/place/placeAllListNum";
		} else {
			msg = "문제가 생겼습니다~";
			url = "/place/rentPlace";
		}
		
		return pfs.getMessage(request, msg, url);
	}
	
	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		PlaceDTO dto = new PlaceDTO();
		dto.setId(mul.getParameter("id"));
		dto.setWrite_no(Integer.parseInt(mul.getParameter("write_no")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("image_file_name");
		
		if(file.getSize() != 0) {
			dto.setImage(pfs.saveFile(file));
			pfs.deleteImage(mul.getParameter("originFileName"));
		} else {
			dto.setImage(mul.getParameter("originFileName"));
		}
		
		int result = 0;
		try {
			result = mapper.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "글이 수정 되었습니다.";
			url = "/place/placeView?write_no="+dto.getWrite_no();
		} else {
			msg = "글 수정 오류";
			url = "/place/placeModifyForm?write_no="+ dto.getWrite_no();
		}
		
		return pfs.getMessage(request, msg, url);
	}
	
	@Override
	public String placeDelete(String id, int write_no, String imageFileName, HttpServletRequest request) {
		int result = mapper.delete(write_no);
		String msg, url;
		if(result == 1) {
			if(imageFileName != "nan") {
				pfs.deleteImage(imageFileName);
			}
			msg = "삭제 되었습니다.";
			url = "/place/placeAllListNum";
			
		} else {
			msg = "글 삭제 오류";
			url = "/place/placeModifyForm?id="+id;
		}
		
		return pfs.getMessage(request, msg, url);
	}
	
	@Override
	public void PlaceAllListNum(Model model, int num) {
		int pageLetter = 3;// 한 페이지 당 글 목록수
		int allCount = mapper.selectPlaceCount();// 전체 글수
		int repeat = allCount/pageLetter;
		if(allCount % pageLetter != 0)
			repeat += 1;
			int end = num * pageLetter;
			int start = end + 1 - pageLetter;
			model.addAttribute("repeat", repeat);
			model.addAttribute("placeList", mapper.placeAllListNum(start, end)); 
			
	}

	@Override
	public void PlaceAllList(Model model) {
		model.addAttribute("placeList", mapper.PlaceAllList());
		
	}

	@Override
	public void placeView(int write_no, Model model) {
		model.addAttribute("data", mapper.placeView(write_no));
		
	}

	@Override
	public void PlaceSearchList(String loc_sep_name, Model model, int num) {
		int pageLetter = 3;// 한 페이지 당 글 목록수
		int allCount = mapper.selectPlaceSearchCount(loc_sep_name);// 전체 글수
		int repeat = allCount/pageLetter;
		if(allCount % pageLetter != 0)
			repeat += 1;
			int end = num * pageLetter;
			int start = end + 1 - pageLetter;
			model.addAttribute("repeat", repeat);
		model.addAttribute("placeSearchList", mapper.placeSearchList(loc_sep_name, start, end));
		
	}
	@Override
	public void RentOkPlaceView(String checkbox, Model model, int num) {
		int pageLetter = 3;// 한 페이지 당 글 목록수
		int allCount = mapper.selectPlaceCount();// 전체 글수
		int repeat = allCount/pageLetter;
		if(allCount % pageLetter != 0)
			repeat += 1;
			int end = num * pageLetter;
			int start = end + 1 - pageLetter;
			model.addAttribute("repeat", repeat);
			model.addAttribute("rentOkList",mapper.rentOkPlace(checkbox, start, end));
	}
	
   
	 
	 
}
	































