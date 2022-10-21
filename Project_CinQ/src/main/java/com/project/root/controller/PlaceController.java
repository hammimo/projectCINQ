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

import com.project.root.service.PlaceService;

@Controller
@RequestMapping("place")
public class PlaceController {
	
	 @Autowired 
	 PlaceService ps;
	 
	 @GetMapping("placeAllList")
	   public String placeAllList(Model model, @RequestParam(value="num", required = false, defaultValue="1")int num) {
	      ps.placeAllList(model, num);
	      return "place/placeAllList";
	   }
	 
	 @RequestMapping("rentPlace")
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
	 
	 
	 
	 
	 
}
