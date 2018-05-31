<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String state="";
String isOrder="";
String ID=request.getParameter("delid");
String sql_1="select * from tb_room where id=("+Integer.parseInt(ID)+")";
ResultSet rs=conn.executeQuery(sql_1);
if(rs.next()){
	state=rs.getString("state");
	isOrder=rs.getString("isOrder");
}

if(state.equals("住人")){
	out.println("<script lanuage='javascript'>alert('该房间目前住人 !删除失败！');history.go(-1);</script>");
}else{
	if(isOrder.equals("1")){
		out.println("<script lanuage='javascript'>alert('该房间目前被预订 !删除失败！');history.go(-1);</script>");
	}else{
		if (null!=ID){
			int ret=-1;
			String sql="Delete From tb_room Where id=("+Integer.parseInt(ID)+")";
			ret=conn.executeUpdate(sql);
			if(ret==0){
				out.println("<script lanuage='javascript'>alert('删除失败!');history.go(-1);</script>");
			}else{
				out.println("<script lanuage='javascript'>alert('删除成功!');window.location.href='admin-room.jsp';</script>");
			}
		}else{
			out.println("<script lanuage='javascript'>alert('您的操作有误!');history.go(-1);</script>");
		}
		
	}
	
	
}
%>
