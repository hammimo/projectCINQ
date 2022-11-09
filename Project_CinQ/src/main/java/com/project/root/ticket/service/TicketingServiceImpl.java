package com.project.root.ticket.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.mybatis.ticket.TicketMapper;

import com.project.root.ticket.dto.TicketDTO;

@Service
public class TicketingServiceImpl implements TicketingService{
	
	@Autowired
	TicketMapper Tmapper;

	@Override
	public String ticketingSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		
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
			int chk = Tmapper.currentCountCheck(mul.getParameter("show_num"),mul.getParameter("show_date"));
			
			if(chk >= dto.getTicket_count()) {
				Tmapper.ticketingSave(dto);
				Tmapper.ticketUpdate(dto.getShow_num(),dto.getShow_date(), dto.getTicket_count());
				return "ticketSuccess";
			}
							
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ticketFail";
	}
	
	
	@Override
	public void ticketList(String show_num,Model model) {
		model.addAttribute("tData", Tmapper.ticketAllCount(show_num));
	}
	
	
}

























