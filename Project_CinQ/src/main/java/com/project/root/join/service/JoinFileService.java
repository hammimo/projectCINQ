package com.project.root.join.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface JoinFileService {
	public static final String IMAGE_REPO="C:\\spring\\image_repo";
	public String getMessage(HttpServletRequest request, String msg, String url);
	public String saveFile(MultipartFile file);
	public void deleteImage(String originFileName);
} 
   