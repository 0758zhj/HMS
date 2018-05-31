package com.dao;


import com.model.CheckIn;
import com.tools.ChStr;
import com.tools.ConnDB;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;

public class CheckInDaoImpl
    implements CheckInDao {
  private ConnDB conn = new ConnDB();
  ChStr chStr = new ChStr();  
 
  public int insert(CheckIn m) {
    int ret = -1;
    try {

    	          String sql = "Insert into tb_checkIn1 (phone,roomID,checkIn_date,checkOut_data,deposit) values(" +
    	          m.getPhone() + "," + m.getRoomID()+",'" +
    	          chStr.chStr(m.getCheckIn_date()) + "','" + chStr.chStr(m.getCheckOut_date()) +
    	          "'," + m.getDeposit() +")";
           System.out.println(sql);
    	 ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }

  
  public int update(CheckIn m) {
    int ret = -1;
    try {
//      String sql = "update tb_CheckIn set "+
//    		  "CheckIn="+m.getCheckIn() +"," + 
//          "PWD=" +m.getPWD()+ "," + 
//          "isAvailable=" + m.getIsAvailable() + 
//          " where ID=" + m.getID();
    	
    	//String sql = "update tb_CheckIn set CheckIn='" + m.getCheckIn()
		//+ "',PWD='" + m.getPWD()
		//+ "',isAvailable='" + m.getIsAvailable()
		//+ "'  where ID="
		//+ m.getID();
      //System.out.println(sql);
      //ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }


  public int delete(int roomID) {
	  String sql="delete from tb_checkIn1 where roomID="+roomID+" ";
    int ret = conn.executeUpdate(sql);
    System.out.println(sql);
    conn.close();
    return 0;
  }

 
  public List select() {
    CheckIn form = null;
    List list = new ArrayList();
    String sql = "select * from tb_CheckIn";
    ResultSet rs = conn.executeQuery(sql);
    try {
      while (rs.next()) {
        form = new CheckIn();
        form.setID(Integer.valueOf(rs.getString(1)));

        list.add(form);
      }
    }
    catch (SQLException ex) {
    }
    conn.close();
    return list;
  }

  public CheckIn select1() {
    return null;
  }
  
  
  public int updateCheckOut_date(int temp_roomID,String checkOut_date_new) {        //修改预离时间
	    int ret = -1;
	    try {

	    	          String sql = "update tb_checkIn1 set checkOut_data='" +checkOut_date_new
				+ "'  where roomID="
				+temp_roomID
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

 
  public int updateDeposit(int temp_roomID, int temp_deposit) {          //修改押金
	    int ret = -1;
	    try {
	    	String sql = "update tb_checkIn1 set deposit=" +temp_deposit
			+ "  where roomID="
			+temp_roomID
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


}
