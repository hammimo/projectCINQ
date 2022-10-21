package com.project.root.join.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
		
		int result = 0;
		try {
			result = mapper.joinSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "새글이 등록 되었습니다.";
			url = "/join/joinsuccess";
		} else {
			msg = "문제가 생겼습니다~";
			url = "/join/artistForm";
		}
		return jfs.getMessage(request, msg, url);
	}

	
	
	}

	
