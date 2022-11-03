package com.project.root.reservation.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ReservationService {

	
	public String reservationSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void ReservationAllListNum(Model model, int num);
	
	public void reservationView(int write_no, Model model);

	public String reservationDelete(int write_no, String imageFileName, HttpServletRequest request); 
	
	public String ticketingStart(MultipartHttpServletRequest mul, HttpServletRequest request); 
	
	public void ticketingAllList(Model model); 
}
 