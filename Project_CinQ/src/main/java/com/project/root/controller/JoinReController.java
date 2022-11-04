package com.project.root.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.root.join.dto.JoinRepDTO;
import com.project.root.join.service.JoinService;
import com.project.root.session.name.MemberSession;

@RestController
@RequestMapping("/join")
public class JoinReController implements MemberSession {

	@Autowired
	private JoinService js; 
	
	@PostMapping(value = "addReply", produces = "application/json; charset=utf-8")
	public String addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		
		JoinRepDTO dto = new JoinRepDTO();
		dto.setId((String)session.getAttribute(LOGIN));
		dto.setWrite_group(Integer.parseInt((String)map.get("write_no")));
		dto.setTitle((String)map.get("title"));
		dto.setContent((String)map.get("content"));
		dto.setTel((String)map.get("tel"));
		js.addReply(dto);
		return "{\"result\": true}";
	}

	@GetMapping(value = "replyData/{write_group}",produces = "application/json; charset=utf-8")
	public List<JoinRepDTO> replyData(@PathVariable int write_group){
		return js.getRepList(write_group);
	}
	
	@GetMapping(value = "deleteReply/{write_no}", produces ="application/json; charset=utf-8")
	public String deleteReply(@PathVariable int write_no) {
		js.deleteReply(write_no);
		return "{\"result\": true}";
	}
}