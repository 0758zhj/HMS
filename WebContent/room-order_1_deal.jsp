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
<title>预订</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");
int day=0;
String  order_date=request.getParameter("order_date");
String  leave_date=request.getParameter("leave_date");
String  temp_deposit=request.getParameter("deposit");
day=chStr.getDaySub_int_1(order_date,leave_date);   //计算天数
out.print(day);
if(day>0){   

		//写入tb_user1  ret
		String  name=request.getParameter("name");
		String  temp_phone=request.getParameter("phone");
		String  temp_cardType=request.getParameter("cardType");
		String  temp_cardNo=request.getParameter("cardNo");
		int ret=0;
		int phone = Integer.parseInt(temp_phone);
		int cardType= Integer.parseInt(temp_cardType);
		int cardNo= Integer.parseInt(temp_cardNo);
		
		
		
		user.setName(name);
		user.setCardNo(cardNo);
		user.setPhone(phone);
		user.setCardType(cardType);
		ret = ins_user.insert(user);



		//写入tb_order   ret_1
		//String  name=request.getParameter("name");
		//String  roomID=request.getParameter("roomID");  //房间号
		String roomID = session.getAttribute("roomID").toString();


		int ret_1=0;
		int deposit= Integer.parseInt(temp_deposit);
		order.setPhone(phone);
		order.setRoomID(roomID);
		order.setOrder_date(order_date);
		order.setLeave_date(leave_date);
		order.setDeposit(deposit);
		ret_1 = ins_order.insert(order);
		
		//修改tb_room的isOrder  ret_2
		int ret_2=0;
		ret_2=ins_room.updateIsOrder(Integer.parseInt(roomID),1);
		
		
		if (ret!=0&&ret_1!=0&&ret_2!=0){
		    out.println("<script language='javascript'>alert('预订设置成功！');window.location.href='business.jsp';</script>");
		  }else{
		    out.println("<script language='javascript'>alert('预订设置失败！');history.go(-1);</script>");
		  }
}else{
	 out.println("<script language='javascript'>alert('预订设置失败！原因：时间设置错误');history.go(-1);</script>");
}




//String  order_date=request.getParameter("order_date");
//out.print(order_date);

%>
</body>
</html>
