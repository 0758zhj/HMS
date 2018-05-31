<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_room" scope="request" class="com.dao.RoomDaolmpl"/>
<jsp:useBean id="room" scope="request" class="com.model.Room"/>

<jsp:useBean id="ins_user" scope="request" class="com.dao.UserDaoImpl"/>
<jsp:useBean id="user" scope="request" class="com.model.User"/>

<jsp:useBean id="ins_order" scope="request" class="com.dao.OrderDaoImpl"/>
<jsp:useBean id="order" scope="request" class="com.model.Order">
</jsp:useBean>
<html>
<head>
<title>预订修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");

//写入tb_order
//String  name=request.getParameter("name");
//String  roomID=request.getParameter("roomID");  //房间号
String roomID = session.getAttribute("roomID").toString();
String  order_date=request.getParameter("order_date");
String  leave_date=request.getParameter("leave_date");
String  temp_deposit=request.getParameter("deposit");
int ret_1=0;
int deposit= Integer.parseInt(temp_deposit);
order.setRoomID(roomID);
order.setOrder_date(order_date);
order.setLeave_date(leave_date);
order.setDeposit(deposit);
ret_1 = ins_order.update(order);

//修改tb_room的isOrder
int ret_2=0;
ret_2=ins_room.updateIsOrder(Integer.parseInt(roomID),1);


if (ret_1!=0){
    out.println("<script language='javascript'>alert('预订设置成功！');window.location.href='business.jsp';</script>");
  }else{
    out.println("<script language='javascript'>alert('预订设置失败！');history.go(-1);</script>");
  }



//String  order_date=request.getParameter("order_date");
//out.print(order_date);

%>
</body>
</html>
