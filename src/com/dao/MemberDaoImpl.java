package com.dao;


import com.model.Member;
import com.tools.ChStr;
import com.tools.ConnDB;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;

public class MemberDaoImpl
    implements MemberDao {
  private ConnDB conn = new ConnDB();
  ChStr chStr = new ChStr();  
 
  public int insert(Member m) {
    int ret = -1;
    try {

    	 String sql = "Insert into tb_manager (manager,PWD,position,isAvailable) values('" +
    	          chStr.chStr(m.getManager()) + "','" + chStr.chStr(m.getPWD()) +
    	          "','员工 ','" + m.getIsAvailable() +"')";

    	 ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }

  
  public int update(Member m) {
    int ret = -1;
    try {
//      String sql = "update tb_manager set "+
//    		  "manager="+m.getManager() +"," + 
//          "PWD=" +m.getPWD()+ "," + 
//          "isAvailable=" + m.getIsAvailable() + 
//          " where ID=" + m.getID();
    	
    	String sql = "update tb_manager set manager='" + m.getManager()
		+ "',PWD='" + m.getPWD()
		+ "',isAvailable='" + m.getIsAvailable()
		+ "'  where ID="
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


  public int delete(Member m) {
    String sql = "delect from tb_manager where ID=" + m.getID();
    int ret = conn.executeUpdate(sql);
    conn.close();
    return 0;
  }

 
  public List select() {
    Member form = null;
    List list = new ArrayList();
    String sql = "select * from tb_manager";
    ResultSet rs = conn.executeQuery(sql);
    try {
      while (rs.next()) {
        form = new Member();
        form.setID(Integer.valueOf(rs.getString(1)));

        list.add(form);
      }
    }
    catch (SQLException ex) {
    }
    conn.close();
    return list;
  }

  public Member select1() {
    return null;
  }

}
