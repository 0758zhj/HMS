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
	StringBuffer sql = new StringBuffer();
	sql.append("select roomID from tb_room where isOrder=1 order by roomID desc ");
	ResultSet rs = conn.executeQuery(sql.toString());
	
	int roomID = -1;
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>前台营业_预订管理</title>
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
						<span class="f-ff2">预订管理</span>
					</h3>
				</div>
				
				<div class="g-wrap p-prf">
					
					
					

					<div class="u-title u-title-1 f-cb m-record-title" id="rHeader">
						<h3>
							<span class="f-ff2 s-fc3">预订列表</span>
						</h3>

					</div>
					<div id="m-record" data-uid="3514008" data-songs="1316"
						class="m-record">
						<div id="auto-id-oXK37yPmGlBEcCTf">
							<div class="j-flag" id="auto-id-42i2wAet2Pki6UW6">
								<table class="m-table m-table-rank">
									<thead>
										<tr>

											<th class="w3">
												<div class="wp">
													房间号
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													预订人电话
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													预达时间
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													预离时间
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													押金
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													操作
												</div>
											</th>
										</tr>
									</thead>
									<tbody>
									<%
									int RecordCount = rs.getRow();  //行数
									while(rs.next()){
										
										//ID = rs.getInt("ID");
										roomID = rs.getInt("roomID");
										String sql_1="select * from tb_order1 where roomID="+roomID+"";	
										ResultSet rs_1=conn.executeQuery(sql_1);
										int ID = 0;
										int phone=0;
										String order_date="";
										String leave_date="";
										int deposit=0;
										while(rs_1.next()){
											ID = rs_1.getInt("ID");
											phone=rs_1.getInt("phone");
											order_date=rs_1.getString("order_date");
											leave_date=rs_1.getString("leave_date");
											deposit=rs_1.getInt("deposit");
											
											
											
										
										
										
									
									%>	
									<tr>

											<td class="rank">
												<%=roomID%>
											</td>

											<td class=" s-fc3">
												<%=phone%>
											</td>
											
											<td class=" s-fc3">
												<%=order_date%>
											</td>
											
											<td class=" s-fc3">
												<%=leave_date%>
											</td>
											
											<td class=" s-fc3">
												<%=deposit%>
											</td>

											<td class="">
											    <a href="room-orderToCheck_deal.jsp?roomID=<%=roomID%>">入住</a>
												<a href="room-orderEdit.jsp?ID=<%=ID%>">修改</a>
												<a href="room-orderDel_deal.jsp?roomID=<%=roomID%>">删除</a>
											</td>
										</tr>
										<%
										}
											
											}
										%>
										
								</table>
							</div>
							<div class="j-flag"></div>
						</div>
					</div>
				</div>

		<a title="回到顶部" class="m-back" href="#" id="g_backtop"
			hidefocus="true" style="display: none;">回到顶部</a>


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