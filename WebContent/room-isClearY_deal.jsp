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
			int isClear=1;
			int ID=Integer.parseInt(roomID);
			int ret=0;
			ret = ins_room.updateIsclear(ID,isClear);
			if (ret != 0) {
				out.println("<script language='javascript'>alert('修改成功！');window.location.href='business.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('修改失败！');history.go(-1);</script>");
			}
		%>
	</body>
</html>
