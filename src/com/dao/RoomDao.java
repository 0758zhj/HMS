package com.dao;

import java.util.List;

import com.model.Room;

public interface RoomDao {
	public int insert(Room m);
	  public int update(Room m);
	  public int delete(Room m);
	  public List select();
	  public Room select1();

}
