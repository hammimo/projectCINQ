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
import com.project.root.member.service.MemberService;
import com.project.root.place.service.PlaceService;
import com.project.root.reservation.service.ReservationService;
import com.project.root.session.name.MemberSession;

@Controller
@RequestMapping("admin")
public class AdminController implements MemberSession{

    @Autowired
    private MemberService ms;

    @Autowired
    private PlaceService ps;
    
    @Autowired
	private ReservationService rs;
    
    @GetMapping("/memberAllList")
    public String memberAllList(Model model, @RequestParam(value = "num", required = false, defaultValue="1") int num) {
        ms.memberAllList(model, num);
        return "admin/memberAllList";
    }
    @GetMapping("/placeAllList")
    public String placeAllList(Model model, @RequestParam(value = "num", required = false, defaultValue="1") int num) {
    	ps.PlaceAllList(model);
    	return "admin/placeAllListAdmin";
    }
    
    @RequestMapping("placeUpdateY")
 	public String placeUpdateY(Model model,@RequestParam int write_no) {
	 ps.updateY(model,write_no);
	 return "redirect:placeAllList";
 }
    @RequestMapping("placeUpdateN")
 	public String placeUpdateN(Model model,@RequestParam int write_no) {
	 ps.updateN(model,write_no);
	 return "redirect:placeAllList";
 }
    
    @RequestMapping("deletePlace")
    public String deletePlace(Model model,@RequestParam int write_no) {
    ps.deletePlaceAdmin(model,write_no);
    return "redirect:placeAllList";
   }
 
}