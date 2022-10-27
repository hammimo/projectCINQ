package com.project.root.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.root.join.service.JoinService;
import com.project.root.member.dto.MemberDTO;
import com.project.root.member.service.MemberService;
import com.project.root.session.name.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession {
	
	@Autowired
	private MemberService ms;
	
//	@RequestMapping("index")
//	public String index() {
//		return "index";
//	}
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/register_form")
	public String register_form() {
		return "member/register";
	}
	
	@RequestMapping("/register")
	public String register(MemberDTO member) {
		int result = ms.register(member);
		
		if(result == 0) {
			return "redirect:login";
		}
		
		return "redirect:register_form";
	}
	
	@PostMapping("idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int cnt = ms.idCheck(id);
		return cnt;
	}
	
	@PostMapping("user_check")
	public String userCheck(HttpServletRequest request, RedirectAttributes rs) {
		int result = ms.user_check(request);
		if(result == 0) {
			rs.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
		
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session) {
		session.setAttribute(LOGIN, id);
		ms.createFile(id);
		return "member/successLogin";
	} 
	
	@GetMapping("join/artistForm")
	public String rentPlace() {
		return "join/artistForm";
	}
	
	
	@Autowired
	JoinService js;
	
	@RequestMapping("/myinfo1")
	public String myinfo1(@RequestParam("id") String id, Model model) {
		ms.info(id, model);
		return "member/myinfo1";
	}
	
	
	@GetMapping("myinfo2")
	public String myinfo2(@RequestParam("id") String id, Model model) {
		js.myJoinView(id,model);
		return "member/myinfo2";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "redirect:/index"; // index 는 기본 컨트롤러에 있으기 때문에 '/' 붙여줍니다
	}
	
	@RequestMapping("/modify_form")
	public String modify_form(@RequestParam("id") String id, Model model) {
		ms.info(id, model);
		return "member/modify_form";
	}
	
	
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul, 
							HttpServletResponse response,
							HttpServletRequest request) throws IOException {
		
		String message = ms.modify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);	
	}
	
	@GetMapping("delete")
	public void delete(@RequestParam String id,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception {

		js.joinIdDelete(id, request);
		ms.deleteFile(id);
		String message = ms.memberDelete(id, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	
	}
	
	
}
