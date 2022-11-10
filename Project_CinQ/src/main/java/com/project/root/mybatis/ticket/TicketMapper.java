package com.project.root.mybatis.ticket;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.root.reservation.dto.ReservationDTO;
import com.project.root.ticket.dto.TicketCountDTO;
import com.project.root.ticket.dto.TicketDTO;

public interface TicketMapper {

	public void ticketingSave(TicketDTO dto);
	
	public void ticketingCountSave(TicketCountDTO dto);

	public int currentCountCheck(@Param("sN")String show_num, @Param("sD")String show_date);
	
	public int ticketUpdate(@Param("sN")String show_num,@Param("d")String show_date, @Param("c")int ticket_count);
	
	public List<TicketCountDTO> ticketAllCount(@Param("sN")String show_num);

	public List<TicketDTO> myTicket(String id);
}
