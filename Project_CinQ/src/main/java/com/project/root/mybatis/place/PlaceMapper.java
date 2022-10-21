package com.project.root.mybatis.place;

import java.util.List;


import com.project.root.place.dto.PlaceDTO;

public interface PlaceMapper {
	
	public List<PlaceDTO> placeAllList();
	
	public int rentPlaceSave(PlaceDTO dto);

	 

}
