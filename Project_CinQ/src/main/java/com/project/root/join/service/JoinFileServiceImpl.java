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
	public String saveFile(MultipartFile file) {
		String sysFileName = file.getOriginalFilename();

        File saveFile = new File(IMAGE_REPO + "/" + sysFileName);
        try {
            file.transferTo(saveFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sysFileName;
    }
	
	@Override
	public void deleteImage(String originFileName) {
		File file = new File(IMAGE_REPO + "/" + originFileName);
		file.delete();
	}
		
}
	
	
	
	

