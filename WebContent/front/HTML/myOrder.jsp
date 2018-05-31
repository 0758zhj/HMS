<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的订单</title>
    <link rel="stylesheet" href="../CSS/script001.css">
    <style>
        html,body{ margin:0; padding:0; border:0; background-color: lightblue;}
        .auto-style1 {
            position: absolute;
            top: 20%;
            left: 30%;
            width: 500px;
            height: 480px;
        }
        table{border:1px solid black;width: 400px;border-collapse:collapse;}
        td{border: 1px solid black;height: 30px;width: 200px}
    </style>
</head>
<body>
<%
	String phone_cur = (String) session.getAttribute("phone");

	if (phone_cur==null || phone_cur == "") {	
		out.println("<script lanage='javascript'>alert('请先登录！!');window.location.href='front_login.jsp';</script>");
	}
%>
<div class="TopDiv">
      <p>
        <span id="_5AText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5A</span>
        <span id="HotelText">&nbsp;Hotel</span>
        <span id="BookingText">&nbsp;Booking</span>
        <span class="right"><input type="button" value="我的订单" class="button002" onclick="window.location.href='myOrder.jsp'" ></span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="right"><input type="button" value="修改密码" class="button002" onclick="window.location.href='massage.jsp'" ></span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="right"><input type="button" value="登录" class="button001" onclick="window.location.href='front_login.jsp'" ></span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="right"><input type="button" value="注册" class="button001" onclick="window.location.href='register.jsp'" ></span>
    </p>
</div>
<% 
int roomID=0;
String order_date="";
String leave_date="";
int price=0;
String type="";
String phone = (String)session.getAttribute("phone_order");
if (phone==null || phone == "") {
	out.println("<script lanage='javascript'>alert('还没有预订信息!');window.location.href='index.jsp';</script>");
	
}else{
	StringBuffer sql = new StringBuffer();
	sql.append("select * from tb_order1 where phone='"+phone+"' ");
	ResultSet rs = conn.executeQuery(sql.toString());
	while(rs.next()){
		 roomID=rs.getInt("roomID");
		 String sql_1="select * from tb_room where roomID="+roomID+" ";
		 ResultSet rs_1 = conn.executeQuery(sql_1);
		 if(rs_1.next()){
			 type=rs_1.getString("type");
			 price=rs_1.getInt("price");
		 }
		 order_date=rs.getString("order_date");
		 leave_date=rs.getString("leave_date");


%>




<div class="auto-style1">
<form action="myOrder_deal.jsp" >
<input type="hidden" value="<%=roomID%>" name="roomID">
    <table>       
        <tr><td colspan="2" style="text-align: center">订单信息</td></tr>
        <tr><td style="text-align: center;width: 120px">房间号</td><td style="text-align: center"><label><%=roomID %></label></td></tr>
        <tr><td style="text-align: center;width: 120px">房间类型</td><td style="text-align: center"><label><%=type%></label></td></tr>
        <tr><td style="text-align: center;width: 120px">价格</td><td style="text-align: center"><label><%=price%></label></td></tr>
        <tr><td style="text-align: center;width: 120px">预订时间</td><td style="text-align: center"><label><%=order_date %></label></td></tr>
        <tr><td style="text-align: center;width: 120px">预离时间</td><td style="text-align: center"><label><%=leave_date %></label></td></tr>     
        <tr><td style="text-align: center"><input type="submit" value="退订" style="width: 250px;height: 30px;background-color: cornflowerblue;" id="buttonPass"></td><td style="text-align: center"><input type="button" value="返回首页" style="width: 250px;height: 30px;background-color: lightskyblue;" onclick="window.location.href='index.jsp'"></td></tr>
    </table>  
    </form>  
</div>
<%
	}
}
%>
</body>
</html>