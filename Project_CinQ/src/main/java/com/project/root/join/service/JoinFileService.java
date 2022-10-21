package com.project.root.join.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public interface JoinFileService {
	
	public String getMessage(HttpServletRequest request, String msg, String url);
}
