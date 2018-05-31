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
		    request.setCharacterEncoding("utf-8");
			
		    //int ID=session.getAttribute("ID");
		    //Integer ID = room.getID();
		
			String roomID=request.getParameter("roomID");  //房间号
			String type="";
			String  price_new=request.getParameter("price_new");
			int price=0;
			
			
			ResultSet rs_1=conn.executeQuery("select * from tb_room where roomID='"+roomID+"'");
			if(rs_1.next()){
				type=rs_1.getString("type");
			}
			
			
			 int ret = 0;
		     price =Integer.parseInt(price_new);
			 int ID=Integer.parseInt(roomID);
			
			ret = ins_room.updatePrice(ID,price);
			if (ret != 0) {
				out.println("<script language='javascript'>alert('修改成功！');window.location.href='business.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('修改失败！');history.go(-1);</script>");
			}
		%>
	</body>
</html>
