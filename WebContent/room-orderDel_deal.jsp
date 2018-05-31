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
<title>预订删除处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");

//删除order
int ret_0=0;                    
String roomID = request.getParameter("roomID");
int temp_roomID=Integer.parseInt(roomID);
//String checkOut_date_new=request.getParameter("checkOut_date_new");
ret_0=ins_order.delete(temp_roomID);


//修改room 的isOrder
int ret_1=0;
//String deposit=request.getParameter("deposit");
//int temp_deposit=Integer.parseInt(deposit);
ret_1=ins_room.updateIsOrder(temp_roomID, 0);


if (ret_1!=0){
	
    out.println("<script language='javascript'>alert('删除成功！');window.location.href='business.jsp';</script>");
  }else{
    out.println("<script language='javascript'>alert('删除失败！');history.go(-1);</script>");
  }



//String  order_date=request.getParameter("order_date");
//out.print(order_date);

%>
</body>
</html>
