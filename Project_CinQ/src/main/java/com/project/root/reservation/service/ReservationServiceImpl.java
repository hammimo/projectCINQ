package com.project.root.reservation.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.project.root.mybatis.place.PlaceMapper;
import com.project.root.mybatis.reservation.ReservationMapper;
import com.project.root.place.dto.PlaceDTO;
import com.project.root.reservation.dto.ReservationDTO;

@Service
public class ReservationServiceImpl implements ReservationService{

	
	
	@Autowired
	ReservationMapper mapper;
	
	@Autowired
	ReservationFileService rfs;
	
		
	@Override
	public String reservationSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		ReservationDTO dto = new ReservationDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setLocation(mul.getParameter("location"));
		dto.setContent(mul.getParameter("content"));
		dto.setStart_date(mul.getParameter("start_date"));
		dto.setEnd_date(mul.getParameter("end_date"));
		dto.setTeam_count(Integer.parseInt(mul.getParameter("team_count")));
		dto.setMax_count(Integer.parseInt(mul.getParameter("max_count")));
		dto.setPrice(Integer.parseInt(mul.getParameter("price")));
		dto.setTel(mul.getParameter("tel"));
		MultipartFile file = mul.getFile("image");
		
		if(file.getSize() != 0) {
			dto.setImage(rfs.saveFile(dto.getId(), file));
		} else {
			dto.setImage("nan");
		}
		
		int result = 0;
		try {
			result = mapper.reservationSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "프로젝트 제출완료";
			url = "/member/myinfo2?id="+dto.getId();
		} else {
			msg = "프로젝트 제출오류";
			url = "/reservation/reservationForm";
		}
		
		return rfs.getMessage(request, msg, url);
	}
	 
	@Override
	public void ReservationAllListNum(Model model, int num) {
		int pageLetter = 3;// 한 페이지 당 글 목록수
		int allCount = mapper.selectReservationCount();// 전체 글수
		int repeat = allCount/pageLetter;
		if(allCount % pageLetter != 0)
			repeat += 1;
			int end = num * pageLetter;
			int start = end + 1 - pageLetter;
			model.addAttribute("repeat", repeat);
			model.addAttribute("reservationList", mapper.reservationAllListNum(start, end)); 
	}
	
	@Override
	public void reservationView(int write_no, Model model) {
		model.addAttribute("data", mapper.reservationView(write_no));
		
	}
	
	@Override
	public void ticketingAllList(Model model) {
		model.addAttribute("ticketingList", mapper.ticketingAllList());
	}
	
	
	@Override
	public String reservationDelete(int write_no, String imageFileName, HttpServletRequest request) {
		
		int result = mapper.reservationDelete(write_no);
		String msg, url;
		if(result == 1) {
			if(imageFileName != "nan") {
				rfs.deleteImage(imageFileName);
			}
			msg = "삭제 되었습니다.";
			url = "/reservation/reservationAllListNum";
			
		} else {
			msg = "삭제 오류";
			url = "/reservation/reservationAllListNum";
		}
		
		return rfs.getMessage(request, msg, url);
	
	}

	@Override
	public String ticketingStart(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		ReservationDTO dto = new ReservationDTO();
		dto.setWrite_no(Integer.parseInt(mul.getParameter("write_no")));
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setLocation(mul.getParameter("location"));
		dto.setContent(mul.getParameter("content"));
		dto.setStart_date(mul.getParameter("start_date"));
		dto.setEnd_date(mul.getParameter("end_date"));
		dto.setTeam_count(Integer.parseInt(mul.getParameter("team_count")));
		dto.setMax_count(Integer.parseInt(mul.getParameter("max_count")));
		dto.setPrice(Integer.parseInt(mul.getParameter("price")));
		dto.setTel(mul.getParameter("tel"));
		
		MultipartFile file = mul.getFile("image");
		if(file.getSize() != 0) {
			dto.setImage(rfs.saveFile(dto.getId(), file));
			rfs.deleteImage(mul.getParameter("originFileName"));
		} else {
			dto.setImage(mul.getParameter("originFileName"));
		}
		
		int result = 0;
		try {
			result = mapper.ticketingStart(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "예매등록완료 되었습니다.";
			url = "/reservation/reservationAllListNum";
		} else {
			msg = "예매등록 오류";
			url = "/reservation/reservationAllListNum";
		}
		
		return rfs.getMessage(request, msg, url);
	}
	
}
	






























