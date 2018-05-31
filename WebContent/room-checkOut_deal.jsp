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
<title>退房处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");

//删除tb_checkIn
int ret_0=0;                    
String roomID = request.getParameter("roomID");
int temp_roomID=Integer.parseInt(roomID);
ret_0=ins_checkIn.delete(temp_roomID);

//修改tb_room的isclear
int ret_2=0;
ret_2=ins_room.updateIsclear(temp_roomID, 0);

//修改tb_room的state
int ret_1=0;
ret_1=ins_room.updateState(temp_roomID, "空闲");

if (ret_1!=0&&ret_2!=0){
    out.println("<script language='javascript'>alert('退房成功！');window.location.href='business.jsp';</script>");
  }else{
    out.println("<script language='javascript'>alert('退房失败！');history.go(-1);</script>");
  }



//String  order_date=request.getParameter("order_date");
//out.print(order_date);

%>
</body>
</html>
