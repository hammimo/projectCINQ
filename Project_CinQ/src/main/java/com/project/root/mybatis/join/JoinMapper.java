package com.project.root.mybatis.join;

import com.project.root.join.dto.JoinDTO;

public interface JoinMapper {

	public int joinSave(JoinDTO dto);
	
	public JoinDTO myJoinView(String id);
	
	public int modify(JoinDTO dto);
	
	public int delete(String id);
}
   