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
	sql.append("select * from tb_manager where position='员工' ");
	
    String sRoom=request.getParameter("sRoom");  //搜索栏中输入的gong号
     

    
    if(sRoom==null){
    	sRoom="";
    }
    sql.append("and manager like '%"+sRoom+"%'");
	
    sql.append("order by manager desc ");
	ResultSet rs = conn.executeQuery(sql.toString());
	int ID = 0;
	String manager = "";
	String PWD="";
	String position = "";
	String isAvailable = "";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>后台管理_员工管理</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
		<link href="css/pt_profile_home.css" type="text/css" rel="stylesheet">
		
		<script type="text/javascript" src="js/toolTip/tooltip.js"></script>
        <link type="text/css" rel="stylesheet" href="js/toolTip/tooltip.css"/>
        
	</head>
	<body style="background: url(image/bg.jpg) repeat-y 100% 100%;">
	<div id="header" align="right">
     
         <div  >
                <a onmouseover="tooltip.pop(this, '#textContent',{position:1, offsetX:0,  effect:'slide'})"  class="tooltip" style="color:#1C2021">您好，<%=manager_cur%></a>
         </div>   
          <div style="display: none">
					<div id="textContent" style="width: 75px; height: 75px;color:black">
						<a  href="business.jsp">前台营业</a>
						<br />
						<a  href="admin-modifyPs.jsp">修改密码</a>
						<br />
						<a id="blogUrl" href="logout.jsp">退出登录</a>
					</div>
	    </div>

    </div>
		
	
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
						<span class="f-ff2">后台管理</span>
					</h3>
				</div>
				<ul class="m-tabs f-cb">
					<li class="fst">
						<a href="admin-manager.jsp" class="z-slt"><em>员工管理</em> </a>
					</li>
					<li>
						<a href="admin-room.jsp"><em>房间管理</em> </a>
					</li>
				</ul>
				<div class="g-wrap p-prf">
					<div class="n-bind f-cb j-flag">
						<center><input onclick="location.href='admin-managerAdd.jsp'" style="height:40px;width:60px;" type="button" value="添加员工" /><br/><br/>
						<form id="searchForm" action="admin-manager.jsp">
				<input  type="text" name="sRoom" class="srch j-flag" value="">
				<a hidefocus="true" href="javascript:document.getElementById('searchForm').submit();" class="btn j-flag"
					title="搜索" >搜索</a>
				</form>	
				</center><br/>
					</div>												

					<div class="u-title u-title-1 f-cb m-record-title" id="rHeader">
						<h3>
							<span class="f-ff2 s-fc3">员工列表</span>
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
													工号
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													密码
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													职位
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													是否可用
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
										
										ID = rs.getInt("ID");
										manager = rs.getString("manager");
										PWD=rs.getString("PWD");
										position = rs.getString("position");
										isAvailable=rs.getString("isAvailable");
										if (isAvailable.equals("1")) {
											isAvailable = "可用";
										}
										if (isAvailable.equals("0")) {
											isAvailable = "不可用";
										}										
									
									%>	
									<tr>

											<td class="rank">
												<%=manager%>
											</td>

											<td class=" s-fc3">
												<%=PWD%>
											</td>
											
											<td class=" s-fc3">
												<%=position%>
											</td>
											
											<td class=" s-fc3">
												<%=isAvailable%>
											</td>

											<td class="">
												<a href="admin-managerEdit.jsp?ID=<%=ID%>">修改</a>
												<a href="admin-managerDel_deal.jsp?delid=<%=ID%>">删除</a>
											</td>
										</tr>
										<%
											
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
