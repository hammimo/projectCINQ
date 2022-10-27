package com.project.root.join.service;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.join.dto.JoinRepDTO;

public interface JoinService {
	

	public String JoinSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void myJoinView(String id, Model model);
	
	public void myJoinViewDetail(int write_no, Model model);

	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String joinDelete(String id, int write_no, String imageFileName, HttpServletRequest request);

	public void JoinAllListNum(Model model, int num);
	
	public void JoinAllList(Model model);

	public void joinView(String title, Model model);
	
	public void addReply(JoinRepDTO dto);

	public void deleteReply(int write_no);
	
	public List<JoinRepDTO> getRepList(int write_group);

	
}
   