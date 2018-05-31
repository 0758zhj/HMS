package com.model;

public class Member {
  private Integer ID=Integer.valueOf("-1");
  private String manager="";
  private String PWD="";
  private String position="";
  private int isAvailable=Integer.valueOf("-1");
  
  public void member(){  //�����
 }

public Integer getID() {
	return ID;
}

public void setID(Integer iD) {
	ID = iD;
}

public String getManager() {
	return manager;
}

public void setManager(String manager) {
	this.manager = manager;
}

public String getPWD() {
	return PWD;
}

public void setPWD(String pWD) {
	PWD = pWD;
}

public String getPosition() {
	return position;
}

public void setPosition(String position) {
	this.position = position;
}

public int getIsAvailable() {
	return isAvailable;
}

public void setIsAvailable(int isAvailable) {
	this.isAvailable = isAvailable;
}
  
 
}
