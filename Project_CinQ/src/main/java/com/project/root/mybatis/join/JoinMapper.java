package com.project.root.mybatis.join;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.root.join.dto.JoinDTO;
import com.project.root.join.dto.JoinRepDTO;

public interface JoinMapper {

	public int joinSave(JoinDTO dto);
	
	public ArrayList<JoinDTO> myJoinView(String id);
	
	public int modify(JoinDTO dto);
	
	public int delete(int write_no);
	
	public JoinDTO myJoinViewDetail(int write_no);
	
	public List<JoinDTO> JoinAllList();
	
	public List<JoinDTO> joinAllListNum(@Param("s")int start, @Param("e") int end);

	public int selectJoinCount();

	public JoinDTO joinView(String write_no);

	public int addReply(JoinRepDTO dto);

	public List<JoinRepDTO> getRepList(int write_group);

	public int deleteReply(int write_no);
	
	public int joinIdDelete(String id);
	
	public List<JoinDTO>joinSearchList(@Param("t")String title,@Param("s")int start, @Param("e")int end);
	

	public int selectJoinSearchCount(@Param("t")String title);
}