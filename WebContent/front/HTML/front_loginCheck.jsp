<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.*" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
request.setCharacterEncoding("utf-8");
String phone=request.getParameter("phone");//此处必须进行编码转换，否则输入中文用户名时将出现乱码  输入的手机号
try{
	String sql="select * from tb_frontUser where phone='"+phone+"'";
	ResultSet rs=conn.executeQuery(sql);
	out.print(sql);
	if(rs.next()){
		
		String PWD=request.getParameter("PWD");     //输入的密码	
		//String PWD=rs.getString("PWD");     //输入的密码
		//out.print(PWD);
		if(PWD.equals(rs.getString("PWD"))){
			session.setAttribute("phone",phone);
			response.sendRedirect("index.jsp");
		}else {
			out.println("<script language='javascript'>alert('您输入的手机号或密码错误，请与管理员联系!');window.location.href='front_login.jsp';</script>");
	}
	}
	else{
		     out.println("<script language='javascript'>alert('您输入的手机号或密码错误，请与管理员联系!');window.location.href='front_login.jsp';</script>");
	}
}
catch(Exception e){
	out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='front_login.jsp';</script>");
}
conn.close();
%>