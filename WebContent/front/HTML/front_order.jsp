<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="java.text.SimpleDateFormat"  %>

<%@ page import="java.util.Date"  %>
<%

SimpleDateFormat f=new SimpleDateFormat("MM/dd/yyyy");
String curdate=f.format(new Date());

%>
<%
	String phone_cur = (String) session.getAttribute("phone");

	if (phone_cur==null || phone_cur == "") {	
		out.println("<script lanage='javascript'>alert('请先登录！!');window.location.href='front_login.jsp';</script>");
	}
%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>单人房预订</title>
    <link rel="stylesheet" href="../CSS/script001.css">
    <link rel="stylesheet" href="../CSS/book.css">
    
     <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
		  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
		  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
		  <link rel="stylesheet" href="jqueryui/style.css">
				  <script>
				  $(function() {
				    $( "#datepicker_1" ).datepicker({ minDate: 0, maxDate: 7 });
				    $( "#datepicker_2" ).datepicker({ minDate: 0, maxDate: 14 });
				  });
				  </script>
    
</head>
<body>
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
    <!-- ========== BOOKING FORM ========== -->
    <div class="vbf">
        <h2 class="form_title"><i class="fa fa-calendar"></i> BOOK ONLINE</h2>
        <form id="booking-form" class="inner"  onsubmit="return addCheck()" action="front_order_deal.jsp">
            <div class="form-group">姓   名：
                <input class="form-control" name="name" placeholder="输入姓名" type="text">
            </div>
            <div class="form-group">手机号：
                <input class="form-control" name="phone" placeholder="输入联系方式" type="text">
            </div>
            <div class="form-group">
                <div class="form_select">证件类型：
                    <select name="cardType"  id="select">
									<option value="1">
									    身份证   
									</option>
									<option value="2">
										港澳通行证
									</option>
									<option value="3">
										驾驶证
									</option>
									<option value="4">
										护照
									</option>
									<option value="5">
										军官证
									</option>
								</select> 
                </div>
            </div>
            
             <div class="form-group">证件号：
                <input class="form-control" name="cardNo" placeholder="输入证件号" type="text">
            </div>
            
            <div class="form-group">
                <div class="form_select">房间号：
                <!--onchange="javascript:location.href=this.value;" -->     
                    <select name="roomID"  id="select"  >              
                    <%
                    int roomID=0;
                    String  sql="select * from tb_room  where type='单人房'" +"and state='空闲' and isOrder=0 order by roomID asc";
            	    ResultSet rs_free=conn.executeQuery(sql);
            	    while(rs_free.next()){
            	    roomID=rs_free.getInt("roomID");
            	    
                    %>
                    
						<option value="<%=roomID%>" >
						    <%=roomID%>
						</option>
									<%
            	    }									
            	   
									%>
									
								</select> 
                </div>
            </div><br/>
            
             
            
            <font size="1" >预达时间:</font><input type="date" class="u-txt txt" id="datepicker_1" name="order_date" style="height:30px;" value="<%=curdate%>" ><br /><br /><br />
            <font size="1" >预离时间:</font><input type="date" class="u-txt txt" id="datepicker_2" name="leave_date" style="height:30px;"><br /><br /><br />
                    
            
            <button class="button btn_lg btn_blue btn_full" type="submit">BOOK A ROOM NOW</button>
           
        </form>
    </div>
</div>
<script>
	function  addCheck(){
		
		if($('#name').val()==""){
			alert("名字不能为空！");
			return false;
		}
		
		if($('#phone').val()==""){
			alert("手机号码不能为空！");
			return false;
		}
		
		
		return true; 
		
	}

</script>
</body>
</html>