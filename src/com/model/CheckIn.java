package com.model;

public class CheckIn {
	
	 private Integer ID=Integer.valueOf("-1");
	 private Integer phone=Integer.valueOf("-1");
	  private String roomID="";
	  private String checkIn_date="";
	  private String checkOut_date="";
	  private Integer deposit=Integer.valueOf("-1");
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	public String getRoomID() {
		return roomID;
	}
	public void setRoomID(String roomID) {
		this.roomID = roomID;
	}
	public String getCheckIn_date() {
		return checkIn_date;
	}
	public void setCheckIn_date(String checkIn_date) {
		this.checkIn_date = checkIn_date;
	}
	public String getCheckOut_date() {
		return checkOut_date;
	}
	public void setCheckOut_date(String checkOut_date) {
		this.checkOut_date = checkOut_date;
	}
	public Integer getDeposit() {
		return deposit;
	}
	public void setDeposit(Integer deposit) {
		this.deposit = deposit;
	}
	

}
