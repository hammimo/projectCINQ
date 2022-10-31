package com.project.root.reservation.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface ReservationFileService {

	public static final String IMAGE_REPO = "C:\\spring\\image_repo";
	
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	public String saveFile(String id, MultipartFile file);  
	
	public void deleteImage(String originFileName);
	
	
} 