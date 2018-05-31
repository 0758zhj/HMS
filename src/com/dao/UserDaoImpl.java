package com.dao;


import com.model.User;
import com.tools.ChStr;
import com.tools.ConnDB;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;

public class UserDaoImpl
    implements UserDao {
  private ConnDB conn = new ConnDB();
  ChStr chStr = new ChStr();  
 
  public int insert(User m) {
    int ret = -1;
    try {

    	         String sql = "Insert into tb_user1 (name,phone,cardType,cardNo) values('" +
    	          chStr.chStr(m.getName()) + "'," + m.getPhone() +"," + m.getCardType() +
    	          "," + m.getCardNo() +")";
         System.out.println(sql);
    	 ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }

  
  public int update(User m) {
    int ret = -1;
    try {
//      String sql = "update tb_user set "+
//    		  "user="+m.getuser() +"," + 
//          "PWD=" +m.getPWD()+ "," + 
//          "isAvailable=" + m.getIsAvailable() + 
//          " where ID=" + m.getID();
    	
    	//String sql = "update tb_user set user='" + m.getuser()
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


  public int delete(User m) {
    String sql = "delect from tb_user where ID=" + m.getID();
    int ret = conn.executeUpdate(sql);
    conn.close();
    return 0;
  }

 
  public List select() {
    User form = null;
    List list = new ArrayList();
    String sql = "select * from tb_user";
    ResultSet rs = conn.executeQuery(sql);
    try {
      while (rs.next()) {
        form = new User();
        form.setID(Integer.valueOf(rs.getString(1)));

        list.add(form);
      }
    }
    catch (SQLException ex) {
    }
    conn.close();
    return list;
  }

  public User select1() {
    return null;
  }

}
