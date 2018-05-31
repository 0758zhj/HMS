<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<% 
        request.setCharacterEncoding("utf-8");
        int id=0;
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
	    	id=rs_free.getInt("id");
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
		<title>房间备注</title>
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
		<form onsubmit="return addCheck()" action="room-notes_deal.jsp" method="post">
		<div class="g-bd" style="margin-top:50px">
			<div class="g-wrap" id="baseBox">
				
				<br/>
					 <font size="3" >房间号:<%=roomID%></font><br /><br />
                            
                     <font size="3" >备  注:</font><br />
                        <textarea name="notes"  cols="172"  rows="8"  ><%=notes%></textarea>
                    <br /><br /><br />
                     
                     <div align="center">
							
							<!-- roomid修改的表 房间号 -->
							<input type="hidden" value="<%=roomID%>" name="roomID">	 
							<input  type="submit" value="确定" style="width:60px;height:40px;"/>&nbsp;
							<input onclick="history.go(-1);" type="button" value="取消" style="width:60px;height:40px;"/>&nbsp;
                    </div>
			</div>
		</div>
		</form>

		
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