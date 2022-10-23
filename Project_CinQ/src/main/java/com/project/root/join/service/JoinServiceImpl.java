package com.project.root.join.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.join.dto.JoinDTO;
import com.project.root.mybatis.join.JoinMapper;


@Service
public class JoinServiceImpl implements JoinService{

	@Autowired
	JoinMapper mapper;
	
	@Autowired   
	JoinFileService jfs;

	@Override
	public String JoinSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		JoinDTO dto = new JoinDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setLoc_name(mul.getParameter("loc_name"));
		dto.setMax_count(Integer.parseInt(mul.getParameter("max_count")));
		dto.setCur_count(Integer.parseInt(mul.getParameter("cur_count")));
		dto.setId(mul.getParameter("id"));
		dto.setGender("M");
		dto.setAge(10);
		
		MultipartFile file = mul.getFile("image");
		if(file.getSize() != 0) {
		            dto.setImage(jfs.saveFile(file));
		        } else {
		            dto.setImage("nan");
		        }
		
		int result = 0;
		try {
			result = mapper.joinSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "새글이 등록 되었습니다.";
			url = "/member/myinfo2?id="+dto.getId();
		} else {
			msg = "문제가 생겼습니다~";
			url = "/join/artistForm";
		}
		return jfs.getMessage(request, msg, url);
	}
	

	@Override
	public void myJoinView(String id, Model model) {
		JoinDTO dto = mapper.myJoinView(id);
		model.addAttribute("ProjectInfo", dto);
	}
	
	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		JoinDTO dto = new JoinDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("image_file_name");
		
		if(file.getSize() != 0) {
			dto.setImage(jfs.saveFile(file));
			jfs.deleteImage(mul.getParameter("originFileName"));
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
			url = "/member/myinfo2?id="+dto.getId();
		} else {
			msg = "글 수정 오류";
			url = "/join/modify_form?id="+ dto.getId();
		}
		
		return jfs.getMessage(request, msg, url);
	}
	
	@Override
	public String joinDelete(String id, String imageFileName, HttpServletRequest request) {
		
		int result = mapper.delete(id);
		String msg, url;
		if(result == 1) {
			if(imageFileName != "nan") {
				jfs.deleteImage(imageFileName);
			}
			msg = "삭제 되었습니다.";
			url = "/member/myinfo2?id="+id;
			
		} else {
			msg = "글 삭제 오류";
			url = "/join/modify_form?id="+id;
		}
		
		return jfs.getMessage(request, msg, url);
	}
	
	
	
}

	
