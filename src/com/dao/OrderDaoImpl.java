package com.dao;


import com.model.Order;
import com.tools.ChStr;
import com.tools.ConnDB;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;

public class OrderDaoImpl
    implements OrderDao {
  private ConnDB conn = new ConnDB();
  ChStr chStr = new ChStr();  
 
  public int insert(Order m) {
    int ret = -1;
    try {

    	          String sql = "Insert into tb_order1 (phone,roomID,order_date,leave_date,deposit) values(" +
    	          m.getPhone() + "," + m.getRoomID()+",'" +
    	          chStr.chStr(m.getOrder_date()) + "','" + chStr.chStr(m.getLeave_date()) +
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

  
  public int update(Order m) {
    int ret = -1;
    try {
      String sql = "update tb_order1 set "+
    		  "order_date='"+m.getOrder_date()+"'," + 
          "leave_date='" +m.getLeave_date()+ "'," + 
          "deposit=" + m.getDeposit() + 
          " where roomID=" + m.getRoomID();
   
      System.out.println(sql);
     ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }


  public int delete(Order m) {
    String sql = "delete from tb_order1 where ID=" + m.getID();
    
    int ret = conn.executeUpdate(sql);
    conn.close();
    return 0;
  }
  public int  delete(int temp_roomID) {        //删除信息
	    String sql = "delete from tb_order1 where roomID=" +temp_roomID;
	    System.out.println(sql);
	    int ret = conn.executeUpdate(sql);
	    conn.close();
	    return 0;
	  }
 

 
  public List select() {
    Order form = null;
    List list = new ArrayList();
    String sql = "select * from tb_order1";
    ResultSet rs = conn.executeQuery(sql);
    try {
      while (rs.next()) {
        form = new Order();
        form.setID(Integer.valueOf(rs.getString(1)));

        list.add(form);
      }
    }
    catch (SQLException ex) {
    }
    conn.close();
    return list;
  }

  public Order select1() {
    return null;
  }

}
