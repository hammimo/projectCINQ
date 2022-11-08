package com.project.root.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.join.service.JoinFileService;
import com.project.root.place.service.PlaceService;
import com.project.root.reservation.service.ReservationService;
import com.project.root.session.name.MemberSession;
import com.project.root.ticket.service.TicketingService;

@Controller
@RequestMapping("reservation")
public class ReservationController implements MemberSession {

	@Autowired
	private PlaceService ps;
	  
	@Autowired
	private TicketingService ts;
	
	@Autowired
	private ReservationService rs;
	 

	@RequestMapping("reservationForm")
	public  String reservationForm(Model model, @RequestParam(value = "place_no", required = false)String place_no) {
		 if(place_no == null) { 
			 return "reservation/reservationForm"; 
		 } 
		 int num = Integer.parseInt(place_no); 
		 	ps.placeView(num, model);
		 	return "reservation/reservationForm";	
	}
	
	@PostMapping("reservation")
	public void reservationSave(MultipartHttpServletRequest mul, 
	                     HttpServletResponse response,
	                     HttpServletRequest request) throws IOException {
	      
	      String message = rs.reservationSave(mul, request);
	      response.setContentType("text/html; charset=utf-8");
	      PrintWriter out = response.getWriter();
	      out.println(message); 
	 }
	 
	 @GetMapping("download")
		public void download(@RequestParam String imageFileName, HttpServletResponse response)throws Exception {
			
			response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
			File file = new File(JoinFileService.IMAGE_REPO+"\\"+imageFileName);
			FileInputStream in = new FileInputStream(file);
			FileCopyUtils.copy(in, response.getOutputStream());
			in.close();
	 
	 }
	 
	 @GetMapping("reservationAllListNum")
		public String reservationAllList(Model model, @RequestParam(value = "num", required = false, defaultValue="1") int num) {
		      rs.ReservationAllListNum(model, num);
		      return "reservation/reservationAllListNum";
		}
	 
	 @GetMapping("reservationView")
		public String contentView(@RequestParam("write_no") int write_no, Model model) {
			rs.reservationView(write_no, model);
			return "reservation/reservationView";
	 }

	 @GetMapping("reservationDelete")
	 	public  void delete(@RequestParam int write_no, @RequestParam String imageFileName, 
											HttpServletResponse response,
											HttpServletRequest request) throws Exception {

			String message = rs.reservationDelete(write_no, imageFileName, request);
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(message);
		}
		@RequestMapping("ticketingRegister")
		public  String modify_form(@RequestParam int write_no, Model model, @RequestParam(value = "location")String location) {
			rs.reservationView(write_no, model);
			//ts.ticketList(show_num,model);
			int num = Integer.parseInt(location);
			ps.placeView(num, model);
			return "reservation/ticketingRegister";
		} 
		 
	
	@PostMapping("ticketingStart")
	public void modify(MultipartHttpServletRequest mul, 
							HttpServletResponse response,
							HttpServletRequest request) throws IOException {
		
		String message = rs.ticketingStart(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
	@RequestMapping("ticketView")
	public  String ticketView(@RequestParam int write_no, Model model, @RequestParam(value = "location")String location) {
		rs.reservationView(write_no, model);
		int num = Integer.parseInt(location);
		ps.placeView(num, model);
		return "reservation/ticketView";
	} 
	
	
	
	
	
}