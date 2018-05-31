<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="java.text.SimpleDateFormat"  %>

<%@ page import="java.util.Date"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	String manager_cur = (String) session.getAttribute("manager");
    String position_cur = (String) session.getAttribute("position");

	if (manager_cur==null || manager_cur == "") {	
		out.println("<script lanage='javascript'>alert('请先登录！!');window.location.href='login.jsp';</script>");
	}
%>
<%
request.setCharacterEncoding("utf-8");
		int phone=0;		
		String roomID = "";
		String order_date="";
		String leave_date="";
		int deposit=0;
		
		String name="";
		int cardType=0;
		int cardNo=0;
		
		SimpleDateFormat f=new SimpleDateFormat("MM/dd/yyyy");
		String curdate=f.format(new Date());
		
	    String ID=request.getParameter("ID");
	   
        String  sql="select * from tb_order1 where ID="+ID+" ";
	    ResultSet rs_free=conn.executeQuery(sql);
	    if(rs_free.next()){
			phone =rs_free.getInt("phone");
		    roomID=rs_free.getString("roomID");
		    session.setAttribute("roomID", roomID);
		    order_date=rs_free.getString("order_date");
		    leave_date=rs_free.getString("leave_date");
		    deposit = rs_free.getInt("deposit");	
		}
	    
	    String  sql_1="select * from tb_user1 where phone="+phone+" ";
	    ResultSet rs_1=conn.executeQuery(sql_1);
	    while(rs_1.next()){	
	    	name=rs_1.getString("name");	
		    cardNo = rs_1.getInt("cardNo");
		    cardType =rs_1.getInt("cardType");
	    }
	    
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>前台营业_修改预订信息</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
		<link href="css/pt_profile_home.css" type="text/css" rel="stylesheet">
		
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
	<body style="background: url(image/bg.jpg) repeat-y 100% 100%;">
		<div data-module="" data-sub="" id="g_top" class="m-top">
			&nbsp;
		</div>
		<div id="g_nav" class="m-subnav m-subnav-up f-pr">
			<div class="shadow">
				&nbsp;
			</div>
		</div>
		
		<form onsubmit="return addCheck()" action="room-orderEdit_deal.jsp" >
		<div class="g-bd" style="margin-top:50px">
		    <div class="g-wrap" id="baseBox">
				<div class="u-title u-title-2 f-cb"> 
							
				
			
			
		
			<div class="g-wrap" id="baseBox">
				<div class="u-title u-title-2 f-cb">
					<h3>
						<span class="f-ff2">预订信息</span>
					</h3>		
				</div>
				<br/>
					 <font size="3" >房间号:<%=roomID%></font><br /><br /><br />                                          
                     <font size="3" >预订时间:</font><input type="date" class="u-txt txt" id="datepicker_1" value="<%=order_date%>" name="order_date" style="height:30px;" value="<%=curdate%>" ><br /><br /><br />
                     <font size="3" >预离时间:</font><input type="date" class="u-txt txt" id="datepicker_2" value="<%=leave_date%>" name="leave_date" style="height:30px;"><br /><br /><br />
                     
                      <font size="3" >押      金        :   <input type="text" class="u-txt txt" id="artistName"  value="<%=deposit%>" name="deposit" maxlength="30"></font><br /><br /><br />
                    <br /><br /><br /><br /><br /><br />
                    
                     
                     <div align="center">
							<input  type="submit" value="修改" style="width:60px;height:40px;"/>&nbsp;
							<input onclick="history.go(-1)" type="button" value="取消" style="width:60px;height:40px;"/>&nbsp;
                    </div>
			</div>
		</div>
		</form>>

		
		<script
			src="//s3.music.126.net/sep/s/2/core.js?756557f5ea03745b332e7a7231d40984"
			type="text/javascript">
</script>
		<iframe frameborder="0" id="auto-id-IvL7xuKir9tR8ay9"
			style="display: none;"
			src="http://mail.163.com/app/cloudmusic/proxy.html"></iframe>
		<script
			src="//s3.music.126.net/sep/s/2/pt_profile_update.js?7c50f062f581255b2ec534505774f597"
			type="text/javascript">
</script>

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