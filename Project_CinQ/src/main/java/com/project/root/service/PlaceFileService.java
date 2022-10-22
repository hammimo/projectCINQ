package com.project.root.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface PlaceFileService {

	public static final String IMAGE_REPO = "C:\\spring\\image_repo";
	
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	public String saveFile(MultipartFile file);  
}
