<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_room" scope="request" class="com.dao.RoomDaolmpl"/>
<jsp:useBean id="room" scope="request" class="com.model.Room">
<jsp:setProperty name="room" property="*"/>
</jsp:useBean>
<html>
<head>
<title>新增员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String roomID=request.getParameter("roomID");  //房间号
String floor=request.getParameter("floor");  //楼层
String type=request.getParameter("type");      //房间类型
String state=request.getParameter("state");      //房间状态
String isClear=request.getParameter("isClear");      //是否干净
String notes=request.getParameter("notes");  //备注
String isLock=request.getParameter("isLock");      //是否锁房
String lockReason=request.getParameter("lockReason");      //锁房原因
int price=0;
if(type.equals("1")){
	type="单人房";
}
else if(type.equals("2")){
	type="双人房";
}
ResultSet rs_1=conn.executeQuery("select price from tb_room where type='"+type+"'");
if(rs_1.next()){
	price=rs_1.getInt(1);
}

if(state.equals("0")){
	state="空闲";
}
else if(state.equals("2")){
	state="维修";
}



ResultSet rs=conn.executeQuery("select * from tb_room where roomID='"+roomID+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该房间号已经存在，请重新添加！');history.go(-1);</script>");
}else{
	int ret=0;
	room.setRoomID(roomID);
	room.setFloor(floor);
	room.setType(type);
	room.setPrice(price);
	room.setState(state);
	if(isClear.equals("0")){
		room.setIsClear(0);
	}
	else if(type.equals("1")){
		room.setIsClear(1);
	}
	room.setNotes(notes);
	if(isLock.equals("0")){
		room.setIsLock(0);
	}
	else if(isLock.equals("1")){
		room.setIsLock(1);
	}
	room.setLockReason(lockReason);
	
	
	
	
	ret = ins_room.insert(room);
	if (ret!=0){
          out.println("<script language='javascript'>alert('房间添加成功！');window.location.href='admin-room.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('房间添加失败！');history.go(-1);</script>");
        }
}
%>
</body>
</html>
