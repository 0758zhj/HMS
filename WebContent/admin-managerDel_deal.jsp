<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String ID=request.getParameter("delid");
if (null!=ID){
	int ret=-1;
	String sql="Delete From tb_manager Where id=("+Integer.parseInt(ID)+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('删除失败!');history.go(-1);</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('删除成功!');window.location.href='admin-manager.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('您的操作有误!');history.go(-1);</script>");
}
%>
