package com.project.root.join.dto;

import java.sql.Timestamp;

/*
 create table reply(
write_no number(20),
id varchar2(20),
title varchar2(50),
content varchar2(300),
tel var
write_group number(10),
write_date date default sysdate,
constraint fk_group foreign key(write_group) references join(write_no) on delete cascade,
constraint fk_id foreign key(id) references member(id) on delete cascade
);
 */

//답글달기 DTO
public class JoinRepDTO {

	private int write_no;
	private String id;
	private String title;
	private String content;
	private String tel;
	private int write_group;
	private Timestamp write_date;
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
	public String getContent() {
		return content;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getWrite_group() {
		return write_group;
	}
	public void setWrite_group(int write_group) {
		this.write_group = write_group;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
	
}
