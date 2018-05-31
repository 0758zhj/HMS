<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_room" scope="request" class="com.dao.RoomDaolmpl"/>
<jsp:useBean id="room" scope="request" class="com.model.Room"/>

<jsp:useBean id="ins_user" scope="request" class="com.dao.UserDaoImpl"/>
<jsp:useBean id="user" scope="request" class="com.model.User"/>

<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr" />

<jsp:useBean id="ins_order" scope="request" class="com.dao.OrderDaoImpl"/>
<jsp:useBean id="order" scope="request" class="com.model.Order">
</jsp:useBean>
<html>
<head>
<title>前端预订</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");

//第一个客户  写入tb_user1    ret
int day=0;
//String roomID = session.getAttribute("roomID").toString();
String roomID =request.getParameter("roomID");
String  order_date=request.getParameter("order_date");
String  leave_date=request.getParameter("leave_date");
//String  temp_deposit=request.getParameter("deposit");

out.print(order_date+"    "+"    ");
out.print(leave_date+"    "+"    ");

day=chStr.getDaySub_int_1(order_date,leave_date);   //计算天数
out.print(day);
if(day<=0){
	 out.println("<script language='javascript'>alert('日期设置错误！');history.go(-1);</script>");
}
else{
	        String  name_A=request.getParameter("name_A");
			String  temp_phone_A=request.getParameter("phone_A");
			String  temp_cardType_A=request.getParameter("cardType_A");
			String  temp_cardNo_A=request.getParameter("cardNo_A");
			int ret=0;
			int phone_A = Integer.parseInt(temp_phone_A);
			int cardType_A= Integer.parseInt(temp_cardType_A);
			int cardNo_A= Integer.parseInt(temp_cardNo_A);
			user.setName(name_A);
			user.setCardNo(cardNo_A);
			user.setPhone(phone_A);
			user.setCardType(cardType_A);
			ret = ins_user.insert(user);
			int phone_B=0;
			int cardType_B=0;
			int cardNo_B=0;
			
			String  name_B=request.getParameter("name_B");  
			if(!name_B.equals("null")){                 //若果有第二个人
				
				//写入第二个客户 到 tb_user    ret_3
				String  temp_phone_B=request.getParameter("phone_B");
				String  temp_cardType_B=request.getParameter("cardType_B");
				String  temp_cardNo_B=request.getParameter("cardNo_B");
				int ret_3=0;
				 phone_B = Integer.parseInt(temp_phone_B);
				cardType_B= Integer.parseInt(temp_cardType_B);
				cardNo_B= Integer.parseInt(temp_cardNo_B);
				user.setName(name_B);
				user.setCardNo(cardNo_B);
				user.setPhone(phone_B);
				user.setCardType(cardType_B);
				ret_3 = ins_user.insert(user);
					
				//写入第一个用户到 tb_order ret_1  
				//String  name=request.getParameter("name");
				//String  roomID=request.getParameter("roomID");  //房间号
				
				
				int ret_1=0;
				//int deposit= Integer.parseInt(temp_deposit);
				order.setPhone(phone_A);            //
				order.setRoomID(roomID);
				order.setOrder_date(order_date);
				order.setLeave_date(leave_date);
				order.setDeposit(0);
				ret_1 = ins_order.insert(order);
			
				//写入第二个个用户到 tb_order ret_4 
				int ret_4=0;
				order.setPhone(phone_B);
				ret_4 = ins_order.insert(order);
				
			
			//修改tb_room的isOrder
			int ret_2=0;
			ret_2=ins_room.updateIsOrder(Integer.parseInt(roomID),1);
			
			
				if (ret!=0&&ret_1!=0&&ret_2!=0&&ret_3!=0&&ret_4!=0){
				    out.println("<script language='javascript'>alert('预订设置成功！');window.location.href='business.jsp';</script>");
				  }else{
				    out.println("<script language='javascript'>alert('预订设置失败！');history.go(-1);</script>");
				  }
			}
			else if (name_B.equals("null")){                         //没有第二个人	
			//写入tb_order
			//String  name=request.getParameter("name");
			//String  roomID=request.getParameter("roomID");  //房间号
			 roomID = session.getAttribute("roomID").toString();
			 order_date=request.getParameter("order_date");
			 leave_date=request.getParameter("leave_date");
			  //temp_deposit=request.getParameter("deposit");
			int ret_1=0;
			//int deposit= Integer.parseInt(temp_deposit);
			order.setPhone(phone_A);
			order.setRoomID(roomID);
			order.setOrder_date(order_date);
			order.setLeave_date(leave_date);
			order.setDeposit(0);
			ret_1 = ins_order.insert(order);
			
			//修改tb_room的isOrder  ret_2
					int ret_2=0;
					ret_2=ins_room.updateIsOrder(Integer.parseInt(roomID),1);
			
			
			if (ret!=0&&ret_1!=0&&ret_2!=0){
				session.setAttribute("phone_order",temp_phone_A);  
			    out.println("<script language='javascript'>alert('预订成功！');window.location.href='index.jsp';</script>");
			  }else{
			    out.println("<script language='javascript'>alert('预订失败！');history.go(-1);</script>");
			  }
			}
}



//String  order_date=request.getParameter("order_date");
//out.print(order_date);

%>
</body>
</html>
