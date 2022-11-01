package com.project.root.reservation.dto;

public class ReservationDTO {

/*
 * --reservation table 삭제 후 재생성

drop table reservation purge;

create table reservation (
write_no number(7) primary key,
id varchar2(20) not null,
title varchar2(100),
location number(7),
content varchar2(300),
image varchar2(50),
team_count number(3),
max_count number(3),
start_date varchar2(15),
end_date varchar2(15),
price number(7),
show_num varchar2(10),
ticketing varchar2(2) default 'N'
);

create SEQUENCE reservation_seq start WITH 1 INCREMENT by 1 MAXVALUE 10000 NOCYCLE;

desc reservation;
select * from reservation;
* 
*/
	private int write_no;
	private String id;
	private String title;
	private String location;
	private String content;
	private String image;
	private int team_count;
	private int max_count;
	private String start_date;
	private String end_date;
	private String tel;
	private int price;
	private String show_num;
	private String ticketing;
	
	public int getWrite_no() {
		return write_no;
	}
	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getTeam_count() {
		return team_count;
	}
	public void setTeam_count(int team_count) {
		this.team_count = team_count;
	}
	public int getMax_count() {
		return max_count;
	}
	public void setMax_count(int max_count) {
		this.max_count = max_count;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getShow_num() {
		return show_num;
	}
	public void setShow_num(String show_num) {
		this.show_num = show_num;
	}
	public String getTicketing() {
		return ticketing;
	}
	public void setTicketing(String ticketing) {
		this.ticketing = ticketing;
	}
	
}