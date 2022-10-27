package com.project.root.join.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class JoinFileServiceImpl implements JoinFileService{

	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		return message;
	} 

	@Override
	public String saveFile(String id, MultipartFile file) {
		String sysFileName = file.getOriginalFilename();

		File saveFile = new File(IMAGE_REPO + "/" + id + "/join/" + sysFileName);
        try {
            file.transferTo(saveFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id+"/join/"+sysFileName;
    }
	
	@Override
	public void deleteImage(String id, String originFileName) {
		File file = new File(IMAGE_REPO + "/" + originFileName);
		file.delete();
	}
		
}
	
	
	

