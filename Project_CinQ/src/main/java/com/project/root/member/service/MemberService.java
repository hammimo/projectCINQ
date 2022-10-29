package com.project.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.member.dto.MemberDTO;

public interface MemberService {

	int register(MemberDTO member);
	public int user_check(HttpServletRequest request);
	public int idCheck(String string);
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void info(String id, Model model);
	public String getMessage(HttpServletRequest request, String msg, String url);
	public String memberDelete(String id, HttpServletRequest request);
	public void createFile(String id);
	public void deleteFile(String id);
	public void memberAllList(Model model, int num);
 
}