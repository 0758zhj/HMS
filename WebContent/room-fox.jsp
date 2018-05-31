<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
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
	    String roomID=request.getParameter("roomID");
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
		<title>前台营业_维修处理</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
		<link href="css/pt_profile_home.css" type="text/css" rel="stylesheet">
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
						<span class="f-ff2">房间信息</span>
					</h3>		
				</div>
				<br/>
					 <font size="3" >房间号:<%=roomID%></font><br /><br />
                     <font size="3" >房   型：<%=type %></font><br /><br />
                     <font size="3" >价   格：<%=price %></font>  &nbsp; &nbsp; &nbsp; &nbsp;
                         <input onclick="location.href='room-enitPrice.jsp?roomID=<%=roomID%>'" type="button" value="修改价格" style="width:60px;height:40px;" /><br /><br />
                     <font size="3" >备   注:<%=notes%></font><br /><br />
                    
                     
                     <div align="center">
							
							
							
							
							<input onclick="location.href='room-fox_deal.jsp?roomID=<%=roomID%>'" type="button" value="可用" style="width:60px;height:40px;"/>&nbsp;
							<input onclick="location.href='room-notes.jsp?roomID=<%=roomID%>'" type="button" value="备注" style="width:60px;height:40px;"/>&nbsp;
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

	</body>
</html>