<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>

<%@ page import="java.text.SimpleDateFormat"  %>
<%@ page import="java.util.Date"  %>

<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_room" scope="request" class="com.dao.RoomDaolmpl"/>
<jsp:useBean id="room" scope="request" class="com.model.Room"/>

<jsp:useBean id="ins_user" scope="request" class="com.dao.UserDaoImpl"/>
<jsp:useBean id="user" scope="request" class="com.model.User"/>

<jsp:useBean id="ins_checkIn" scope="request" class="com.dao.CheckInDaoImpl"/>
<jsp:useBean id="checkIn" scope="request" class="com.model.CheckIn">
</jsp:useBean>

<jsp:useBean id="ins_order" scope="request" class="com.dao.OrderDaoImpl"/>
<jsp:useBean id="order" scope="request" class="com.model.Order">
</jsp:useBean>
<html>
<head>
<title>预订 变为 入住</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");

SimpleDateFormat f=new SimpleDateFormat("MM/dd/yyyy");
String curdate=f.format(new Date());
String  state="";
int phone=0;
int deposit=0;
String order_date="";
String leave_date="";
int ret_1=0;
int isClear=0;
String  roomID=request.getParameter("roomID");
String sql_1="select * from tb_room where roomID="+roomID+" ";
ResultSet rs_1=conn.executeQuery(sql_1);
if(rs_1.next()){
	state=rs_1.getString("state");
	isClear=rs_1.getInt("isClear");
}
if(state.equals("住人")){
	out.println("<script language='javascript'>alert('入住设置失败！原因：该房间已有人入住！');history.go(-1);</script>");	
}else{
	if(isClear==0){
		out.println("<script language='javascript'>alert('入住设置失败！原因：该房间目前脏！');history.go(-1);</script>");
	}else{
		String sql="select * from tb_order1 where roomID="+roomID+" ";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			phone=rs.getInt("phone");
			order_date=rs.getString("order_date");
			leave_date=rs.getString("leave_date");
			deposit=rs.getInt("deposit");
			
			//写入tb_cheack1
			checkIn.setPhone(phone);
			checkIn.setRoomID(roomID);
			checkIn.setCheckIn_date(curdate);
			checkIn.setCheckOut_date(leave_date);
			checkIn.setDeposit(deposit);
			ret_1 = ins_checkIn.insert(checkIn);			
		}

		//修改tb_room的staet
		int ret_2=0;
		ret_2=ins_room.updateState(Integer.parseInt(roomID),"住人");

		//修改tb_room的isOrder
		int ret_3=0;
		ret_3=ins_room.updateIsOrder(Integer.parseInt(roomID), 0);

		//删除TB_order
		int ret_4=0;
		ret_4=ins_order.delete(Integer.parseInt(roomID));

		if (ret_1!=0&&ret_2!=0){
		    out.println("<script language='javascript'>alert('入住设置成功！');window.location.href='business.jsp';</script>");
		  }else{
		    out.println("<script language='javascript'>alert('入住设置失败！');history.go(-1);</script>");
		  }
	}
}

//String  checkIn_date=request.getParameter("checkIn_date");
//out.print(checkIn_date);

%>
</body>
</html>
