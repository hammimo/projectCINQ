package com.project.root.ticket.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface TicketingService {

	
	public String ticketingSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	void ticketList(String show_num,Model model);		
	
	
}
 