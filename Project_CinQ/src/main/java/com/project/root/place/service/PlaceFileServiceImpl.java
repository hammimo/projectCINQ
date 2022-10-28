package com.project.root.place.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PlaceFileServiceImpl implements PlaceFileService{

	
	
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		return message;
	}

	@Override
	public String saveFile(MultipartFile file) {
		
		String sysFileName = file.getOriginalFilename();
		
		File saveFile = new File(IMAGE_REPO + "/place/" + sysFileName);
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/place/"+sysFileName;
	}

	@Override
	public void deleteImage(String originFileName) {
		
		
	}  

	
	 
	
}
