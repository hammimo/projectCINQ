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

import com.project.root.join.dto.JoinDTO;
import com.project.root.join.service.JoinFileService;
import com.project.root.join.service.JoinService;
import com.project.root.session.name.MemberSession;

@Controller
@RequestMapping("join")
public class Joincontroller implements MemberSession{
	
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
	@GetMapping("download")
	public void download(@RequestParam String imageFileName, HttpServletResponse response)throws Exception {
		
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		File file = new File(JoinFileService.IMAGE_REPO+"\\"+imageFileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
		
	}
	
	@GetMapping("joinAllListNum")
	public String joinAllList(Model model, @RequestParam(value = "num", required = false, defaultValue="1") int num) {
	      js.JoinAllListNum(model, num);
	      return "join/joinAllListNum";
	}

	@GetMapping("modify_form")
	public  String modify_form(@RequestParam int write_no, Model model) {
		js.myJoinViewDetail(write_no, model);
		return "join/modify_form";
	
	}
	
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul, 
							HttpServletResponse response,
							HttpServletRequest request) throws IOException {
		
		String message = js.modify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
	@GetMapping("joinView")
	public String contentView(@RequestParam("title") String title, Model model) {
		js.joinView(title, model);
		return "join/joinView";
	}
	
	@GetMapping("delete")
	public  void delete(@RequestParam("id") String id, @RequestParam int write_no, @RequestParam String imageFileName, 
										HttpServletResponse response,
										HttpServletRequest request) throws Exception {

		String message = js.joinDelete(id, write_no, imageFileName, request );
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
}

