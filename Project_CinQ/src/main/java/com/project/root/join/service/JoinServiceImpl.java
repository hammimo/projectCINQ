package com.project.root.join.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.join.dto.JoinDTO;
import com.project.root.join.dto.JoinRepDTO;
import com.project.root.mybatis.join.JoinMapper;


@Service
public class JoinServiceImpl implements JoinService{

	@Autowired
	JoinMapper mapper;
	
	@Autowired   
	JoinFileService jfs;

	@Override
	public String JoinSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		JoinDTO dto = new JoinDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setLoc_name(mul.getParameter("addrResult"));
		dto.setLoc_sep_name(mul.getParameter("loc_sep_name"));
		dto.setMax_count(Integer.parseInt(mul.getParameter("max_count")));
		dto.setCur_count(Integer.parseInt(mul.getParameter("cur_count")));
		MultipartFile file = mul.getFile("image");
		if(file.getSize() != 0) {
		            dto.setImage(jfs.saveFile(dto.getId(), file));
		        } else {
		            dto.setImage("nan");
		        }
		
		int result = 0;
		try {
			result = mapper.joinSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "새글이 등록 되었습니다.";
			url = "/join/joinAllListNum?id="+dto.getId();
		} else {
			msg = "문제가 생겼습니다~";
			url = "/join/artistForm";
		}
		return jfs.getMessage(request, msg, url);
	}
	

	@Override
	public void myJoinView(String id, Model model) {
		model.addAttribute("ProjectInfo",mapper.myJoinView(id));
	}
	
	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		JoinDTO dto = new JoinDTO();
		dto.setId(mul.getParameter("id"));
		dto.setWrite_no(Integer.parseInt(mul.getParameter("write_no")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("image_file_name");
		dto.setCur_count(Integer.parseInt(mul.getParameter("cur_count")));
		dto.setMax_count(Integer.parseInt(mul.getParameter("max_count")));
		if(file.getSize() != 0) {
			dto.setImage(jfs.saveFile(dto.getId(), file));
			jfs.deleteImage(mul.getParameter("id"), mul.getParameter("originFileName"));
		} else {
			dto.setImage(mul.getParameter("originFileName"));
		}
		
		int result = 0;
		try {
			result = mapper.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "글이 수정 되었습니다.";
			url = "/member/myinfo2?id="+dto.getId();
		} else {
			msg = "글 수정 오류";
			url = "/join/modify_form?id="+ dto.getId();
		}
		
		return jfs.getMessage(request, msg, url);
	}
	
	@Override
	public String joinDelete(String id,int write_no, String imageFileName, HttpServletRequest request) {
		
		int result = mapper.delete(write_no);
		String msg, url;
		if(result == 1) {
			if(imageFileName != "nan") {
				jfs.deleteImage(id, imageFileName);
			}
			msg = "삭제 되었습니다.";
			url = "/member/myinfo2?id="+id;
			
		} else {
			msg = "글 삭제 오류";
			url = "/join/modify_form?id="+id;
		}
		
		return jfs.getMessage(request, msg, url);
	
	}
	@Override
	public void joinView(String write_no, Model model) {
		model.addAttribute("data", mapper.joinView(write_no));
		
	}
	
	@Override
	public void myJoinViewDetail(int write_no, Model model) {

		model.addAttribute("ProjectInfo",mapper.myJoinViewDetail(write_no));
	}
	
	@Override
	public void JoinAllListNum(Model model, int num) {
		
		
		int pageLetter = 3;// 한 페이지 당 글 목록수
		int allCount = mapper.selectJoinCount();// 전체 글수
		int repeat = allCount/pageLetter;
		if(allCount % pageLetter != 0)
			repeat += 1;
			int end = num * pageLetter;
			int start = end + 1 - pageLetter;
			model.addAttribute("repeat", repeat);
			model.addAttribute("joinList", mapper.joinAllListNum(start, end));   
	}
	
	@Override
	public void JoinAllList(Model model) {
		model.addAttribute("joinList", mapper.JoinAllList());
			
	}
	
	@Override
	public void addReply(JoinRepDTO dto) {

		mapper.addReply(dto);
	}
	
	@Override
	public List<JoinRepDTO> getRepList(int write_group) {
	
		return mapper.getRepList(write_group);
	}

	@Override
	public void deleteReply(int write_no) {		
		mapper.deleteReply(write_no);
		
	}
	
	@Override
	public void joinIdDelete(String id, HttpServletRequest request) {
		
		mapper.joinIdDelete(id);
	}
}

	
