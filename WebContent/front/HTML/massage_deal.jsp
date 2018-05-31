<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.*"  %>
<%@ page import="com.model.*"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_member" scope="request" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<html>
<head>
<title>密码修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
	request.setCharacterEncoding("utf-8");
     String phone = (String) session.getAttribute("phone");
	//Integer id = member.getID();
	String pwd = request.getParameter("pwd");   //输入的原密码
	String psNew = request.getParameter("psNew");  //输入的新密码
	ResultSet rs = conn.executeQuery("select * from tb_frontUser where phone='" + phone+ "'");
	String pwdSql="";
		while (rs.next()) {
			pwdSql = rs.getString("PWD");   //原密码
		}
		
		if (!pwd.equals(pwdSql)) {
			out.println("<script language='javascript'>alert('原密码不正确！');history.go(-1);;</script>");
			return;
		}else{
			String sql_1 = "update tb_frontUser set PWD='" + psNew			
			+ "'  where phone="
			+ phone;
			out.println("<script language='javascript'>alert('密码修改成功！请重新登录！');window.location.href='front_login.jsp';</script>");
		}
			
		
%>
</body>
</html>
