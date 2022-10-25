package com.project.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public int id_check(HttpServletRequest request) {
		MemberDTO dto = mapper.id_check(request.getParameter("id"));
			if(dto == null) {
				return 1;
			}else {
				return 0;	
			}
	}
	
	
	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
			if(request.getParameter("pw").equals(dto.getPw())) {
				return 0;
			}
		return 1;
	}
	
	@Override
	public void info(String id, Model model) {
		MemberDTO dto = mapper.getMember(id);
		model.addAttribute("info", dto);
	}
	
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {

		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		return message;
		
	}
	
	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		MemberDTO dto = new MemberDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTel(Integer.parseInt(mul.getParameter("tel")));
		dto.setNickname(mul.getParameter("nickname"));
		dto.setPw(mul.getParameter("pw"));
		
		int result = 0;
		try {
			result = mapper.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "회원정보가 수정 되었습니다...";
			url = "/member/myinfo1?id="+dto.getId();
		} else {
			msg = "회원정보 수정 오류입니다~";
			url = "/member/modify_form?id="+dto.getId();
		}
		
		return getMessage(request, msg, url);
		
	}
	
	@Override
	public String memberDelete(String id, HttpServletRequest request) {

		int result = mapper.delete(id);
		String msg, url;
		if(result == 1) {
			msg = "삭제 되었습니다...";
			url = "/member/logout";
		} else {
			msg = "삭제 오류입니다~";
			url = "/member/myinfo1?id="+id;
		}
		
		return getMessage(request, msg, url);
		
	}
	 
}
