<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_room" scope="request" class="com.dao.RoomDaolmpl"/>
<jsp:useBean id="room" scope="request" class="com.model.Room"/>

<jsp:useBean id="ins_user" scope="request" class="com.dao.UserDaoImpl"/>
<jsp:useBean id="user" scope="request" class="com.model.User"/>

<jsp:useBean id="ins_checkIn" scope="request" class="com.dao.CheckInDaoImpl"/>
<jsp:useBean id="checkIn" scope="request" class="com.model.CheckIn">
</jsp:useBean>
<html>
<head>
<title>入住</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");

//写入tb_user1
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

//写入tb_checkIn
//String  name=request.getParameter("name");
//String  roomID=request.getParameter("roomID");  //房间号
String roomID = session.getAttribute("roomID").toString();
String  checkIn_date=request.getParameter("checkIn_date");
String  checkOut_date=request.getParameter("checkOut_date");
String  temp_deposit=request.getParameter("deposit");
int ret_1=0;
int deposit= Integer.parseInt(temp_deposit);
checkIn.setPhone(phone);
checkIn.setRoomID(roomID);
checkIn.setCheckIn_date(checkIn_date);
checkIn.setCheckOut_date(checkOut_date);
checkIn.setDeposit(deposit);
ret_1 = ins_checkIn.insert(checkIn);

//修改tb_room的state
int ret_2=0;
ret_2=ins_room.updateState(Integer.parseInt(roomID),"住人");


if (ret!=0&&ret_1!=0&&ret_2!=0){
    out.println("<script language='javascript'>alert('入住设置成功！');window.location.href='business.jsp';</script>");
  }else{
    out.println("<script language='javascript'>alert('入住设置失败！');history.go(-1);</script>");
  }



//String  checkIn_date=request.getParameter("checkIn_date");
//out.print(checkIn_date);

%>
</body>
</html>
