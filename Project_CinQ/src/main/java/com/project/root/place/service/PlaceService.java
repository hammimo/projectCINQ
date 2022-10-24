package com.project.root.place.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface PlaceService {

	public void placeAllList(Model model);
	
	public String rentPlaceSave(MultipartHttpServletRequest mul, HttpServletRequest request); 
	
	
}
