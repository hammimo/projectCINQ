package com.project.root.join.controller;



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

import com.project.root.join.dto.JoinDTO; 
import com.project.root.join.service.JoinService;
import com.project.root.session.join.JoinSession;

@Controller
@RequestMapping("join")
public class Joincontroller implements JoinSession{
	
	@Autowired
	private JoinService js;  
	
	@GetMapping("/artistForm")
	public String artistForm() {
		return "join/artistForm";    
	}
	
	@PostMapping("JoinSave")
	public void writeSave(MultipartHttpServletRequest mul, 
							HttpServletResponse response,
							HttpServletRequest request) throws IOException {
		
		String message = js.JoinSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
}

