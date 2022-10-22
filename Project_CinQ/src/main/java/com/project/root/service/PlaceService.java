package com.project.root.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface PlaceService {

	public void placeAllList(Model model, int num);
	
	public String rentPlaceSave(MultipartHttpServletRequest mul, HttpServletRequest request); 
	
 
}
