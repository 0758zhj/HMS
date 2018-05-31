<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr" />
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
		    //Integer ID = room.getID();
		
			String roomID=request.getParameter("roomID");  //房间号
			String  notes=request.getParameter("notes");
			
			 int ret = 0;
			 int ID=Integer.parseInt(roomID);
			
			ret = ins_room.updateNotes(ID,notes);
			if (ret != 0) {
				out.println("<script language='javascript'>alert('修改成功！');window.location.href='business.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('修改失败！');history.go(-1);</script>");
			}
		%>
	</body>
</html>
