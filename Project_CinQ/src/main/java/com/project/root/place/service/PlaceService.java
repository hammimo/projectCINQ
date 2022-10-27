package com.project.root.place.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface PlaceService {

	public void PlaceAllList(Model model);
	
	public String rentPlaceSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void PlaceAllListNum(Model model, int num);

	public void placeView(int write_no, Model model); 

    public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	
    public String placeDelete(String id, int write_no, String imageFileName, HttpServletRequest request);

	public void PlaceSearchList(String loc_sep_name, Model model, int num);
	
	
}
 