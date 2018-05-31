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
<title>信息修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
		<%
			//request.setCharacterEncoding("gbk");
		request.setCharacterEncoding("utf-8");
		    //int ID=session.getAttribute("ID");
		    Integer ID = room.getID();
		
			String roomID=request.getParameter("roomID");  //房间号
			String floor=request.getParameter("floor");  //楼层
			String type=request.getParameter("type");      //房间类型
			int price=0;
			if(type.equals("1")){
				type="单人房";
			}
			if(type.equals("2")){
				type="双人房";
			}
			
			ResultSet rs_1=conn.executeQuery("select price from tb_room where type='"+type+"'");
			if(rs_1.next()){
				price=rs_1.getInt(1);
			}
			
			
			int ret = 0;
		    
			room.setID(ID);
			room.setRoomID(roomID);
			room.setFloor(floor);
			room.setType(type);
			room.setPrice(price);
			ret = ins_room.update(room);
			if (ret != 0) {
				out.println("<script language='javascript'>alert('修改成功！');window.location.href='admin-room.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('修改失败！');history.go(-1);</script>");
			}
		%>
	</body>
</html>
