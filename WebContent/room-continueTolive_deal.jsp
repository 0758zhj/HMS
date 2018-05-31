<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_room" scope="request" class="com.dao.RoomDaolmpl"/>
<jsp:useBean id="room" scope="request" class="com.model.Room"/>

<jsp:useBean id="ins_user" scope="request" class="com.dao.UserDaoImpl"/>
<jsp:useBean id="user" scope="request" class="com.model.User"/>

<jsp:useBean id="ins_checkIn" scope="request" class="com.dao.CheckInDaoImpl"/>
<jsp:useBean id="order" scope="request" class="com.model.Order">
</jsp:useBean>
<html>
<head>
<title>续住处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");

//修改预离时间
int ret_0=0;                    
String roomID = request.getParameter("roomID");
int temp_roomID=Integer.parseInt(roomID);
String checkOut_date_new=request.getParameter("checkOut_date_new");
ret_0=ins_checkIn.updateCheckOut_date(temp_roomID,checkOut_date_new);


//修改押金
int ret_1=0;
String deposit=request.getParameter("deposit");
int temp_deposit=Integer.parseInt(deposit);
ret_1=ins_checkIn.updateDeposit(temp_roomID, temp_deposit);


if (ret_1!=0&&ret_0!=0){
    out.println("<script language='javascript'>alert('续住成功！');window.location.href='business.jsp';</script>");
  }else{
    out.println("<script language='javascript'>alert('续住失败！');history.go(-1);</script>");
  }



//String  order_date=request.getParameter("order_date");
//out.print(order_date);

%>
</body>
</html>
