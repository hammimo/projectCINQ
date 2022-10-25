package com.project.root.mybatis.member;

import com.project.root.member.dto.MemberDTO;

public interface MemberMapper {

	int register(MemberDTO member);
	public MemberDTO user_check(String id);
	public MemberDTO getMember(String id);
	public int modify(MemberDTO dto);
	public int delete(String id);
	public MemberDTO id_check(String id);
}
