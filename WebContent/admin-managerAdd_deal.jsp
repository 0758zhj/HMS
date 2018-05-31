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
<title>新增员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
//request.setCharacterEncoding("gbk");
request.setCharacterEncoding("utf-8");
String manager=request.getParameter("manager");  //工号
String PWD=request.getParameter("PWD");  //密码
String isAvailable=request.getParameter("type");  
ResultSet rs=conn.executeQuery("select * from tb_manager where manager='"+manager+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该员工已经存在，请重新添加！');history.go(-1);</script>");
}else{
	int ret=0;
	member.setManager(manager);
	member.setPWD(PWD);
	member.setPosition("员工");
	if(isAvailable.equals("1")){
		member.setIsAvailable(1);
	}
	else if(isAvailable.equals("0")){
		member.setIsAvailable(0);
	}
	
	ret = ins_member.insert(member);
	if (ret!=0){
          out.println("<script language='javascript'>alert('员工添加成功！');window.location.href='admin-manager.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('员工添加失败！');history.go(-1);</script>");
        }
}
%>
</body>
</html>
