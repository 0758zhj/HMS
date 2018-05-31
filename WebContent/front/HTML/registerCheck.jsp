<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.*" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
request.setCharacterEncoding("utf-8");
int i=0;
String phone=request.getParameter("phone");//此处必须进行编码转换，否则输入中文用户名时将出现乱码  输入的手机号
String PWD=request.getParameter("passWord1");//此处必须进行编码转换，否则输入中文用户名时将出现乱码  输入的密码

try{
	ResultSet rs=conn.executeQuery("select * from tb_frontUser");
	while (rs.next()) {
		if (phone.equals(rs.getString("phone"))) {
		i = 1;break;
		} else {
		i = 0;
		}
		}
	if(i==1){
		out.println("<script language='javascript'>alert('该账户已注册，请登录!');window.location.href='front_login.jsp';</script>");
		}else{
		     String sql = "Insert into tb_frontUser (phone,PWD) values('" +
	   	                    chStr.chStr(phone) + "','" + chStr.chStr(PWD)+"')";
			 out.print(sql);
			 ResultSet rs_1=conn.executeQuery(sql);
	         out.println("<script language='javascript'>alert('注册成功!请登录！');window.location.href='front_login.jsp';</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='login.jsp';</script>");
}
conn.close();
%>