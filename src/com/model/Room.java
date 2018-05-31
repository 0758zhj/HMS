package com.model;

public class Room {
	  private Integer ID=Integer.valueOf("-1");
	  private String roomID="";
	  private String floor="";
	  private String type="";
	  private int price=Integer.valueOf("-1");
	  private String state="";
	  private int isClear=Integer.valueOf("-1");
	  private String notes="";
	  private int isLock=Integer.valueOf("-1");
	  private String LockReason="";
	  private int isOrder=Integer.valueOf("-1");
	  
	  public int getIsOrder() {
		return isOrder;
	}

	public void setIsOrder(int isOrder) {
		this.isOrder = isOrder;
	}

	public Room(){
		  
	  }

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getRoomID() {
		return roomID;
	}

	public void setRoomID(String roomID) {
		this.roomID = roomID;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getIsClear() {
		return isClear;
	}

	public void setIsClear(int isClear) {
		this.isClear = isClear;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getIsLock() {
		return isLock;
	}

	public void setIsLock(int isLock) {
		this.isLock = isLock;
	}

	public String getLockReason() {
		return LockReason;
	}

	public void setLockReason(String lockReason) {
		LockReason = lockReason;
	}

	

}
