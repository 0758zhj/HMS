<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.*" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
request.setCharacterEncoding("utf-8");
String manager=request.getParameter("manager");//此处必须进行编码转换，否则输入中文用户名时将出现乱码  输入的工号
try{
	ResultSet rs=conn.executeQuery("select * from tb_manager where manager='"+manager+"'");
	if(rs.next()){
		String PWD=request.getParameter("PWD");     //输入的工号
		
		String position=rs.getString("position");   //获取职位
		int isAvailable=rs.getInt("isAvailable");   //是否可用
		
		
		if(PWD.equals(rs.getString("PWD"))&&(isAvailable==1)){
			session.setAttribute("manager",manager);
			session.setAttribute("position",position);
			response.sendRedirect("business.jsp");
		}else if(PWD.equals(rs.getString("PWD"))&&(isAvailable==0)){
			out.println("<script language='javascript'>alert('该账户不可用，请与管理员联系!');window.location.href='login.jsp';</script>");
		}else {
			out.println("<script language='javascript'>alert('您输入的用户名或密码错误，请与管理员联系!');window.location.href='login.jsp';</script>");
	        }
	}
	    else {
			out.println("<script language='javascript'>alert('您输入的用户名或密码错误，请与管理员联系!');window.location.href='login.jsp';</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='login.jsp';</script>");
}
conn.close();
%>