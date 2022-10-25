package com.project.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.member.dto.MemberDTO;

public interface MemberService {

	int register(MemberDTO member);
	public int user_check(HttpServletRequest request);
	public int id_check(HttpServletRequest request);
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void info(String id, Model model);
	public String getMessage(HttpServletRequest request, String msg, String url);
	public String memberDelete(String id, HttpServletRequest request);
 
}
