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
		String type = "";
		int price=0;
		String state="";
		String isClear="";
		String notes = "";
		String isLock="";
		String lockReason = "";
		String isOrder = "";
		
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
		<title>前台营业_双人房预订办理</title>
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
		
		<form onsubmit="return addCheck()" action="room-order_2_deal.jsp" >
		
		<div class="g-bd" style="margin-top:50px">
		    <div class="g-wrap" id="baseBox">
				<div class="u-title u-title-2 f-cb"> 
					<h3>
						<span class="f-ff2">住客A信息</span>
					</h3>		
				</div>
				             <br/>
				   
					 <font size="3" >姓名:<input type="text" class="u-txt txt" id="name_A" name="name_A" maxlength="30"></font>
					 &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
					&nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; 
					  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                     <font size="3" >手机号码：<input type="text" class="u-txt txt" id="phone_A"   name="phone_A" maxlength="30"></font><br /><br />
                     <font size="3" >证件类型：</font>
                                   <select name="cardType_A" class="u-txt txt" style="height:auto" id="select">
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
                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                           
                     <font size="3" >证     件    号    ：<input type="text" class="u-txt txt" id="cardNo_A"  name="cardNo_A" maxlength="30"></font>
                    <br />   
			</div>
			<hr>
			
			<div class="g-wrap" id="baseBox">
				<div class="u-title u-title-2 f-cb"> 
					<h3>
						<span class="f-ff2">住客B信息</span>
					</h3>		
				</div>
				             <br/>
				   
					 <font size="3" >姓名:<input type="text" class="u-txt txt" id="name_B" name="name_B" maxlength="30"></font>
					 &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
					&nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; 
					  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                     <font size="3" >手机号码：<input type="text" class="u-txt txt" id="phone_B"   name="phone_B" maxlength="30"></font><br /><br />
                     <font size="3" >证件类型：</font>
                                   <select name="cardType_B" class="u-txt txt" style="height:auto" id="select">
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
                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                           
                     <font size="3" >证     件    号    ：<input type="text" class="u-txt txt" id="artistName"  name="cardNo_B" maxlength="30"></font>
                    <br />    
			</div>
			<hr>
			
		
			<div class="g-wrap" id="baseBox">
				<div class="u-title u-title-2 f-cb">
					<h3>
						<span class="f-ff2">预订信息</span>
					</h3>		
				</div>
				<br/>
					 <font size="3" >房间号:<%=roomID%></font><br /><br /><br />
                     <font size="3" >房   型：<%=type %></font><br /><br /><br />
                     <font size="3" >价   格：<%=price %></font>  &nbsp; &nbsp; &nbsp; &nbsp;
                         <input onclick="location.href='room-enitPrice.jsp?roomID=<%=roomID%>'"   type="button" value="修改价格" style="width:60px;height:40px;" /><br /><br /><br />
                     <font size="3" >预达时间:</font><input type="date" class="u-txt txt" id="datepicker_1" name="order_date" style="height:30px;" value="<%=curdate%>" ><br /><br /><br />
                     <font size="3" >预离时间:</font><input type="date" class="u-txt txt" id="datepicker_2" name="leave_date" style="height:30px;"><br /><br /><br />
                     
                      <font size="3" >押      金        :   <input type="text" class="u-txt txt" id="artistName"  name="deposit"  maxlength="30"></font><br /><br /><br />
                    <br /><br /><br /><br /><br /><br />
                    
                     
                     <div align="center">
							<input name="submit"  type="submit" value="预订" style="width:60px;height:40px;"/>&nbsp;
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
		
		if($('#name_A').val()==""){
			alert("第一个名字不能为空！");
			return false;
		}
		
		if($('#phone_A').val()==""){
			alert("第一个手机号码不能为空！");
			return false;
		}
		
		if($('#name_B').val()==""){
			alert("第二个名字不能为空！");
			return false;
		}
		
		if($('#phone_B').val()==""){
			alert("第二个手机号码不能为空！");
			return false;
		}
		
		
		return true; 
		
	}

</script>
	</body>
</html>