package com.project.root.ticket.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.project.root.mybatis.place.PlaceMapper;
import com.project.root.mybatis.reservation.ReservationMapper;
import com.project.root.mybatis.ticket.TicketMapper;
import com.project.root.place.dto.PlaceDTO;
import com.project.root.reservation.dto.ReservationDTO;
import com.project.root.ticket.dto.TicketDTO;

@Service
public class TicketingServiceImpl implements TicketingService{

	
	
	@Autowired
	TicketMapper Tmapper;
	@Autowired
	ReservationMapper Rmapper;
		
	@Override
	public String ticketingSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		/*
		 * private String id;
			private String title;
			private String location;
			private String image;
			private String show_date;
			private String show_num;
			private int price;
			private int ticket_count;*/
		
		TicketDTO dto = new TicketDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setLocation(mul.getParameter("location"));
		dto.setImage(mul.getParameter("image"));
		dto.setShow_date(mul.getParameter("show_date"));
		dto.setShow_num(mul.getParameter("show_num"));
		dto.setTicket_count(Integer.parseInt(mul.getParameter("ticket_count")));
		dto.setPrice(Integer.parseInt(mul.getParameter("price")));
		
		try {
			int chk = Rmapper.currentCountCheck(dto.getShow_num());
			
			if(chk >= dto.getTicket_count()) {
				Tmapper.ticketingSave(dto);
				Rmapper.currentUp(dto.getShow_num(), dto.getTicket_count());
				return "ticketSuccess";
			}
							
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ticketFail";

	}

}

























