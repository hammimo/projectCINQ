package com.project.root.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.root.member.dto.MemberDTO;
import com.project.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	
	@Override
	public int register(MemberDTO member) {
		try {
			return mapper.register(member);
		}catch (Exception e) {
			return 0;
		}
		
	}
	
	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
		if(dto != null) {
			if(request.getParameter("pw").equals(dto.getPw())) {
				return 0;
			}
		}
		return 1;
	}
	
}
