package com.project.root.mybatis.place;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.project.root.place.dto.PlaceDTO;

public interface PlaceMapper {
	
	public List<PlaceDTO> PlaceAllList();
	
	public int modify(PlaceDTO dto);
	
	public int delete(int write_no);
	
	public List<PlaceDTO> placeAllListNum(@Param("s")int start, @Param("e") int end);
	
	public int rentPlaceSave(PlaceDTO dto);

	public int selectPlaceCount();

	public PlaceDTO placeView(int write_no);

	public List<PlaceDTO> placeSearchList(@Param("l")String loc_sep_name, @Param("s")int start, @Param("e")int end);  
	
	public int selectPlaceSearchCount(@Param("l")String loc_sep_name);
	
	public List<PlaceDTO> rentOkPlace(@Param("checkbox")String checkbox, @Param("s")int start, @Param("e") int end);
	
}  
