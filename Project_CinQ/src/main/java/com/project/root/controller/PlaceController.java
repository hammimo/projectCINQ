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
import com.project.root.session.name.MemberSession;

@Controller
@RequestMapping("place")
public class PlaceController implements MemberSession{
	
	 @Autowired
	 PlaceService ps;
	 
	 
	 @GetMapping("/rentPlace")
	   public String rentPlace() {
	     return "place/rentPlace";
	   }
	 
	 @PostMapping("rentPlaceSave")
	   public void rentPlaceSave(MultipartHttpServletRequest mul, 
	                     HttpServletResponse response,
	                     HttpServletRequest request) throws IOException {
	      
	      String message = ps.rentPlaceSave(mul, request);
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
	 
	 @GetMapping("placeAllListNum")
		public String placeAllList(Model model, @RequestParam(value = "num", required = false, defaultValue="1") int num) {
		      ps.PlaceAllListNum(model, num);
		      return "place/placeAllListNum";
		}
	 
	 @GetMapping("placeView")
		public String contentView(@RequestParam(value= "write_no") int write_no,Model model) {
			 	ps.placeView(write_no, model);
				return "place/placeView";
	 }
	 
	 @GetMapping("placeModifyForm")
		public  String placeModifyForm(@RequestParam int write_no, Model model) {
			ps.placeView(write_no, model);
			return "place/placeModifyForm";
		
		}
		
	 @PostMapping("modify")
		public void modify(MultipartHttpServletRequest mul, 
								HttpServletResponse response,
								HttpServletRequest request) throws IOException {
			
			String message = ps.modify(mul, request);
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(message);
			
		}
		
	 @GetMapping("delete")
		public  void delete(@RequestParam("id") String id, @RequestParam int write_no, @RequestParam String imageFileName, 
											HttpServletResponse response,
											HttpServletRequest request) throws Exception {

			String message = ps.placeDelete(id, write_no, imageFileName, request );
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(message);
			
		}	
	
	 @PostMapping("placeSearchList")
		public String placeSearchList(@RequestParam(value="loc_sep_name") String loc_sep_name, Model model, @RequestParam(value = "num", required = false, defaultValue="1") int num) {
		 System.out.println(loc_sep_name);
		 if(loc_sep_name != null) {     
			 ps.PlaceSearchList(loc_sep_name, model, num);
		 } else {
			 ps.PlaceAllListNum(model, num);
		 }
		 
		      return "place/placeAllListNum";
		}
	 
	@RequestMapping("rentOkPlaceView")
	public String rentOkPlaceView(@RequestParam(value="checkbox") String checkbox, Model model, @RequestParam(value = "num", required = false, defaultValue="1") int num) {
		ps.RentOkPlaceView(checkbox, model, num);
		return "place/rentOkPlaceView";
	}
}







 









































