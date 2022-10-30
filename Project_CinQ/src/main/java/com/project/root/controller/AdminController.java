package com.project.root.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.root.member.service.MemberService;
import com.project.root.place.service.PlaceService;
import com.project.root.session.name.MemberSession;

@Controller
@RequestMapping("admin")
public class AdminController implements MemberSession{

    @Autowired
    private MemberService ms;

    @Autowired
    private PlaceService ps;
    
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

}