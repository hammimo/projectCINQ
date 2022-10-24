package com.project.root.join.service;



import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface JoinService {
	

	public String JoinSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void myJoinView(String id, Model model);
	
	public void myJoinVeiwDetail(int write_no, Model model);

	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String joinDelete(String id, int write_no, String imageFileName, HttpServletRequest request);

	public void JoinAllListNum(Model model, int num);
	
	public void JoinAllList(Model model);
	
}
   