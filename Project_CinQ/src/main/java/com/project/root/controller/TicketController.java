package com.project.root.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.reservation.service.ReservationService;
import com.project.root.ticket.service.TicketingService;

@Controller
@RequestMapping("ticket")
public class TicketController {

	
	@Autowired
	private ReservationService rs;
	
	@Autowired
	private TicketingService ts;
	
	
	@PostMapping("TicketingSave")
	public String rentPlaceSave(MultipartHttpServletRequest mul, 
	                     HttpServletResponse response,
	                     HttpServletRequest request) throws IOException {	      
	
		String result = ts.ticketingSave(mul, request);
		if(result == "ticketSuccess") {
			return "/reservation/ticketSuccess";
		}
		return "/reservation/ticketFail";
	}
	
	@GetMapping("ticketingAllListNum")
	public String ticketingAllListNum(Model model,@RequestParam(value = "num", required = false, defaultValue="1") int num ) {
		rs.ticketingAllListNum(model,num);
		return "/reservation/ticketingAllListNum";
		
	}
	
	
}
