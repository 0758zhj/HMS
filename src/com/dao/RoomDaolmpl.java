package com.dao;

import com.model.Room;
import com.model.Room;
import com.tools.ChStr;
import com.tools.ConnDB;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;
public class RoomDaolmpl implements RoomDao {
	private ConnDB conn = new ConnDB();
	  ChStr chStr = new ChStr();  
	 
	  public int insert(Room m) {
	    int ret = -1;
	    try {	    	 
	    	 String sql = "Insert into tb_room (roomID,floor,type,price,state,isClear,notes,isLock,lockReason ) values('" +
	    	          m.getRoomID() + "','" + m.getFloor() +"','" + m.getType() +"','" + m.getPrice() +"','" + m.getState() +"','" + m.getIsClear() +"','" + chStr.chStr(m.getNotes()) +"','" + m.getIsLock() +"','" + chStr.chStr(m.getLockReason())+"')";
              System.out.println(sql);
	    	 ret = conn.executeUpdate(sql);
	    }
	    catch (Exception e) {
	      ret = 0;
	    }
	    conn.close();
	    return ret;
	  }

	  
	  public int update(Room m) {
	    int ret = -1;
	    try {
	    	String sql = "update tb_room set roomID=" + m.getRoomID()
			+ ",type='" + m.getType()
			+ "',floor=" + m.getFloor()
			+ ",price=" + m.getPrice()
			+ "  where id="
			+ m.getID();
	      System.out.println(sql);
	      ret = conn.executeUpdate(sql);
	    }
	    catch (Exception e) {
	      ret = 0;
	    }
	    conn.close();
	    return ret;
	  }


	  public int delete(Room m) {
	    String sql = "delete from tb_manager where ID=" + m.getID();
	    int ret = conn.executeUpdate(sql);
	    conn.close();
	    return 0;
	  }

	 
	  public List select() {
	    Room form = null;
	    List list = new ArrayList();
	    String sql = "select * from tb_manager";
	    ResultSet rs = conn.executeQuery(sql);
	    try {
	      while (rs.next()) {
	        form = new Room();
	        form.setID(Integer.valueOf(rs.getString(1)));

	        list.add(form);
	      }
	    }
	    catch (SQLException ex) {
	    }
	    conn.close();
	    return list;
	  }

	  public Room select1() {
	    return null;
	  }
	  
	  public int updatePrice(int ID,int price) {          //修改房间价格
		    int ret = -1;
		    try {
		    	String sql = "update tb_room set price=" + price	
				+ "  where roomID="
				+ID
				;
		      System.out.println(sql);
		      ret = conn.executeUpdate(sql);
		    }
		    catch (Exception e) {
		      ret = 0;
		    }
		    conn.close();
		    return ret;
		  }
	  
	  public int updateState(int ID,String state) {          //修改房间状态
		    int ret = -1;
		    try {
		    	String sql = "update tb_room set state='" + state
				+ "'  where roomID="
				+ID
				;
		      System.out.println(sql);
		      ret = conn.executeUpdate(sql);
		    }
		    catch (Exception e) {
		      ret = 0;
		    }
		    conn.close();
		    return ret;
		  }
	  
	  
	  
	  public int updateNotes(int ID,String notes) {          //修改备注
		    int ret = -1;
		    try {
		    	String sql = "update tb_room set notes='" + chStr.chStr(notes)	
				+ "'  where roomID="
				+ID
				;
		      System.out.println(sql);
		      ret = conn.executeUpdate(sql);
		    }
		    catch (Exception e) {
		      ret = 0;
		    }
		    conn.close();
		    return ret;
		  }
	  
	  
	  
	  public int updateIsclear(int ID,int isClear) {          //修改干净or脏
		    int ret = -1;
		    try {
		    	String sql = "update tb_room set isClear=" +isClear
				+ "  where roomID="
				+ID
				;
		      System.out.println(sql);
		      ret = conn.executeUpdate(sql);
		    }
		    catch (Exception e) {
		      ret = 0;
		    }
		    conn.close();
		    return ret;
		  }
	  
	  
	  public int updateIsOrder(int ID,int isOrder) {          //修改是否预订
		    int ret = -1;
		    try {
		    	String sql = "update tb_room set isOrder=" +isOrder
				+ "  where roomID="
				+ID
				;
		      System.out.println(sql);
		      ret = conn.executeUpdate(sql);
		    }
		    catch (Exception e) {
		      ret = 0;
		    }
		    conn.close();
		    return ret;
		  }
	  
	  
	  public int updatePrice(String type,int price) {          //批处理修改房间价格
		    int ret = -1;
		    try {
		    	String sql = "update tb_room set price=" + price	
				+ "  where type='"   +type+ "'" +"and state!='住人'";
		      System.out.println(sql);
		      ret = conn.executeUpdate(sql);
		    }
		    catch (Exception e) {
		      ret = 0;
		    }
		    conn.close();
		    return ret;
		  }

	}
