<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="java.text.SimpleDateFormat"  %>

<%@ page import="java.util.Date"  %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr" />
<%
	String manager_cur = (String) session.getAttribute("manager");
    String position_cur = (String) session.getAttribute("position");

	if (manager_cur==null || manager_cur == "") {	
		out.println("<script lanage='javascript'>alert('请先登录！!');window.location.href='login.jsp';</script>");
	}
%>
<%
        request.setCharacterEncoding("utf-8");
		String type = "";
		int price=0;
		String state="";
		String isClear="";
		String notes = "";
		String isLock="";
		String lockReason = "";
		String isOrder = "";
		
		String name="";
		int phone=-1;
		int cardType=-1;
		String temp_cardType="";
		int cardNo=-1;
		
		String checkIn_date="";
		String checkOut_date="";
		int day=-1;
		int cost=-1;
		int deposit=0;
		int balance=-1;
		
		
		SimpleDateFormat f=new SimpleDateFormat("MM/dd/yyyy");
		String curdate=f.format(new Date());
		
	    String roomID=request.getParameter("roomID");
	    
	    session.setAttribute("roomID", roomID);
	    
        String  sql="select * from tb_room where roomID="+roomID+" ";
	    ResultSet rs_free=conn.executeQuery(sql);
	    if(rs_free.next()){
			 type =rs_free.getString("type");
			 price=rs_free.getInt("price");
			 state=rs_free.getString("state");
			 isClear=rs_free.getString("isClear");
			 notes = rs_free.getString("notes");
			 isLock=rs_free.getString("isClear");
			 lockReason = rs_free.getString("lockReason"); 
			 isOrder=rs_free.getString("isOrder");
		}	    	   	    	    	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>前台营业_已入住脏的双人房处理</title>
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
				    $( "#datepicker_1" ).datepicker({ minDate: 0, maxDate: 0 });
				    $( "#datepicker_2" ).datepicker({ minDate: 0, maxDate: 10 });
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
		
		
		<div class="g-bd" style="margin-top:50px">
		    <div class="g-wrap" id="baseBox">
				<div class="u-title u-title-2 f-cb"> 
					<h3>
						<span class="f-ff2">在住信息</span>
					</h3>
			  </div>
					
					
			<% 
			 String sql_1="select * from tb_checkIn1 where roomID="+roomID+" ";
		    ResultSet rs_1=conn.executeQuery(sql_1);
		    while(rs_1.next()){
		    	phone=rs_1.getInt("phone");
		    	checkIn_date=rs_1.getString("checkIn_date");
		    	checkOut_date=rs_1.getString("checkOut_data");
		    	day=chStr.getDaySub_int(checkIn_date,checkOut_date); //计算天数
		    	cost=day*price;
		    	deposit=rs_1.getInt("deposit");
		    	balance=deposit-cost;
		    	
		    	String sql_2="select * from tb_user1 where phone="+phone+" ";
			    ResultSet rs_2=conn.executeQuery(sql_2);
			    if(rs_2.next()){
			    	name=rs_2.getString("name");
			    	cardType=rs_2.getInt("cardType");
			    	cardNo=rs_2.getInt("cardNo");
			    	if(cardType==1){
			    		temp_cardType="身份证";
			    	}
			    	if(cardType==2){
			    		temp_cardType="港澳通行证";
			    	}
			    	if(cardType==3){
			    		temp_cardType="驾驶证";
			    	}
			    	if(cardType==4){
			    		temp_cardType="护照";
			    	}
			    	if(cardType==5){
			    		temp_cardType="军官证";
			    	}
			  
			
			%>	
				
				             <br/>
				   
					 <font size="3" >姓名:<%=name %></font>
					 &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
					&nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; 
					  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                     <font size="3" >手机号码：<%=phone %></font><br /><br />
                     <font size="3" >证件类型：<%=temp_cardType %></font>
                                   
                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                           
                     <font size="3" >证     件    号    ：<%=cardNo %></font>
                    <br />
                    
			   <hr>
                    
			    
			   
			   <% 
			     	
			    }	
		    }
		    %>
			
		    </div>
			   
			<div class="g-wrap" id="baseBox">
				<div class="u-title u-title-2 f-cb">
					<h3>
						<span class="f-ff2">入住信息</span>
					</h3>		
				</div>
				<br/>
					 <font size="3" >房间号:<%=roomID%></font><br /><br /><br />
                     <font size="3" >房   型：<%=type %></font><br /><br /><br />
                     <font size="3" >价   格：<%=price %></font>  &nbsp; &nbsp; &nbsp; &nbsp;
                         <input onclick="location.href='room-enitPrice.jsp?roomID=<%=roomID%>'"   type="button" value="修改价格" style="width:60px;height:40px;" /><br /><br /><br />
                     <font size="3" >入住时间:<%=checkIn_date%></font><br /><br /><br />
                     <font size="3" >预离时间:<%=checkOut_date%></font><br /><br /><br />
                      
                      
                      <font size="3" >押      金       :<%=deposit%></font><br /><br /><br />
                      
                    <br /><br /><br /><br /><br /><br />
                    
                     
                     
				   <div align="center">
	
							<input onclick="location.href='room-checkOut_1.jsp?roomID=<%=roomID%>'" type="button" value="退房" style="width:60px;height:40px;"/>&nbsp;
							<input onclick="location.href='room-exchange.jsp?roomID=<%=roomID%>'" type="button" value="换房" style="width:60px;height:40px;"/>&nbsp; 
							<input onclick="location.href='room-continueTolive.jsp?roomID=<%=roomID%>'" type="button" value="续住" style="width:60px;height:40px;"/>&nbsp; 
							<input onclick="location.href='room-isClearY_deal.jsp?roomID=<%=roomID%>'" type="button" value="打扫" style="width:60px;height:40px;"/>&nbsp;                  
							<input onclick="history.go(-1)" type="button" value="返回" style="width:60px;height:40px;"/>&nbsp;
                    </div>
			</div>
		</div>
		

		
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