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

//第一个客户  写入tb_user1    ret
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

String  name_B=request.getParameter("name_B");  
if(name_B!=null){                 //若果有第二个人
	
	//写入第二个客户 到 tb_user    ret_3
	String  temp_phone_B=request.getParameter("phone_B");
	String  temp_cardType_B=request.getParameter("cardType_B");
	String  temp_cardNo_B=request.getParameter("cardNo_B");
	int ret_3=0;
	int phone_B = Integer.parseInt(temp_phone_B);
	int cardType_B= Integer.parseInt(temp_cardType_B);
	int cardNo_B= Integer.parseInt(temp_cardNo_B);
	user.setName(name_B);
	user.setCardNo(cardNo_B);
	user.setPhone(phone_B);
	user.setCardType(cardType_B);
	ret_3 = ins_user.insert(user);
		
	//写入第一个用户到 tb_checkIn ret_1  
	//String  name=request.getParameter("name");
	//String  roomID=request.getParameter("roomID");  //房间号
	String roomID = session.getAttribute("roomID").toString();
	String  checkIn_date=request.getParameter("checkIn_date");
	String  checkOut_date=request.getParameter("checkOut_date");
	String  temp_deposit=request.getParameter("deposit");
	int ret_1=0;
	int deposit= Integer.parseInt(temp_deposit);
	checkIn.setPhone(phone_A);
	checkIn.setRoomID(roomID);
	checkIn.setCheckIn_date(checkIn_date);
	checkIn.setCheckOut_date(checkOut_date);
	checkIn.setDeposit(deposit);
	ret_1 = ins_checkIn.insert(checkIn);

	//写入第二个个用户到 tb_checkIn ret_4 
	int ret_4=0;
	checkIn.setPhone(phone_B);
	ret_4 = ins_checkIn.insert(checkIn);
	
	//修改tb_room的staet
	int ret_2=0;
	ret_2=ins_room.updateState(Integer.parseInt(roomID),"住人");


	if (ret!=0&&ret_1!=0&&ret_2!=0&&ret_3!=0&&ret_4!=0){
	    out.println("<script language='javascript'>alert('入住设置成功！');window.location.href='business.jsp';</script>");
	  }else{
	    out.println("<script language='javascript'>alert('入住设置失败！');history.go(-1);</script>");
	  }
}
else{                         //没有第二个人	
//写入tb_checkIn
//String  name=request.getParameter("name");
//String  roomID=request.getParameter("roomID");  //房间号
String roomID = session.getAttribute("roomID").toString();
String  checkIn_date=request.getParameter("checkIn_date");
String  checkOut_date=request.getParameter("checkOut_date");
String  temp_deposit=request.getParameter("deposit");
int ret_1=0;
int deposit= Integer.parseInt(temp_deposit);
checkIn.setPhone(phone_A);
checkIn.setRoomID(roomID);
checkIn.setCheckIn_date(checkIn_date);
checkIn.setCheckOut_date(checkOut_date);
checkIn.setDeposit(deposit);
ret_1 = ins_checkIn.insert(checkIn);

//修改tb_room的staet
int ret_2=0;
ret_2=ins_room.updateState(Integer.parseInt(roomID),"住人");


if (ret!=0&&ret_1!=0&&ret_2!=0){
    out.println("<script language='javascript'>alert('入住设置成功！');window.location.href='business.jsp';</script>");
  }else{
    out.println("<script language='javascript'>alert('入住设置失败！');history.go(-1);</script>");
  }
}



//String  checkIn_date=request.getParameter("checkIn_date");
//out.print(checkIn_date);

%>
</body>
</html>
