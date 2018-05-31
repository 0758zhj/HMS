<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_room" scope="request" class="com.dao.RoomDaolmpl"/>
<jsp:useBean id="room" scope="request" class="com.model.Room">
<jsp:setProperty name="room" property="*"/>
</jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批处理修改房价</title>
</head>
<body>

<%         int temp_price=0;
           String temp_type="";
           String type=request.getParameter("type");
           String price =request.getParameter("price");
           if(type.equals("1")){
        	   temp_type="单人房";
           }
           else  if(type.equals("2")){
        	   temp_type="双人房";
           }
           
           temp_price=Integer.parseInt(price);
           
           int ret=0;
           ret = ins_room.updatePrice(temp_type,temp_price);
           if (ret != 0) {
				out.println("<script language='javascript'>alert('修改成功！');window.location.href='business.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('修改失败！');history.go(-1);</script>");
			}
 
%>

</body>
</html>