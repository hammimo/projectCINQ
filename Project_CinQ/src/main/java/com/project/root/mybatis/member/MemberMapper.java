package com.project.root.mybatis.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.root.member.dto.MemberDTO;

public interface MemberMapper {

	int register(MemberDTO member);
	public MemberDTO user_check(String id);
	public MemberDTO getMember(String id);
	public int modify(MemberDTO dto);
	public int delete(String id);
	public int selectMemberCount();
    public List<MemberDTO> memberAllList(@Param("s")int start, @Param("e") int end);
}
