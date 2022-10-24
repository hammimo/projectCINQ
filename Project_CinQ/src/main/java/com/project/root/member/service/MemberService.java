package com.project.root.member.service;

import javax.servlet.http.HttpServletRequest;

import com.project.root.member.dto.MemberDTO;

public interface MemberService {

	int register(MemberDTO member);
	public int user_check(HttpServletRequest request);
 
}
