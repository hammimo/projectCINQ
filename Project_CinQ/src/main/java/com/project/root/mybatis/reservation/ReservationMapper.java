package com.project.root.mybatis.reservation;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.root.reservation.dto.ReservationDTO;

public interface ReservationMapper {
	
	public int reservationSave(ReservationDTO dto);
	
	public ReservationDTO reservationView(int write_no);
	
	public int selectReservationCount();
	
	public List<ReservationDTO> reservationAllListNum(@Param("s")int start, @Param("e") int end);

	public int reservationDelete(int write_no);

}  