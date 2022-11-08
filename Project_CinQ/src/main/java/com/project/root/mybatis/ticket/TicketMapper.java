package com.project.root.mybatis.ticket;

import org.apache.ibatis.annotations.Param;

import com.project.root.ticket.dto.TicketCountDTO;
import com.project.root.ticket.dto.TicketDTO;

public interface TicketMapper {

	public void ticketingSave(TicketDTO dto);
	
	public void ticketingCountSave(TicketCountDTO dto);

	public int currentCountCheck(String show_num);
	
	public int ticketUpdate(@Param("sN")String show_num,@Param("d")String show_date, @Param("c")int ticket_count);
}
