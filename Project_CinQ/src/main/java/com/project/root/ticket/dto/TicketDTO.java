package com.project.root.ticket.dto;

public class TicketDTO {
	
	private String id;
	private String title;
	private String location;
	private String image;
	private String show_date;
	private String show_num;
	private int price;
	private int ticket_count;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getShow_date() {
		return show_date;
	}
	public void setShow_date(String show_date) {
		this.show_date = show_date;
	}
	public String getShow_num() {
		return show_num;
	}
	public void setShow_num(String show_num) {
		this.show_num = show_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTicket_count() {
		return ticket_count;
	}
	public void setTicket_count(int ticket_count) {
		this.ticket_count = ticket_count;
	}
	
	
}
