<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String manager_cur = (String) session.getAttribute("manager");
    String position_cur = (String) session.getAttribute("position");

	if (manager_cur==null || manager_cur == "") {	
		out.println("<script lanage='javascript'>alert('请先登录！!');window.location.href='login.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>新增房间</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
		
		<script type="text/javascript" src="js/toolTip/tooltip.js"></script>
        <link type="text/css" rel="stylesheet" href="js/toolTip/tooltip.css"/>
		
	</head>
	<body style="background: url(image/bg.jpg) repeat-y 100% 100%;">
	
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
				
		<div data-module="" data-sub="" id="g_top" class="m-top">
			&nbsp;
		</div>
		<div id="g_nav" class="m-subnav m-subnav-up f-pr">
			<div class="shadow">
				&nbsp;
			</div>
		</div>

		<div class="g-bd">
			<div class="g-wrap" id="baseBox">
					
				<ul class="m-tabs f-cb">
					<li class="fst">
						<a ><em>新增房间</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return addCheck()" action="admin-roomAdd_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								房间号：<input type="text" class="u-txt txt" id="artistName"  name="roomID" maxlength="30">
							</div>
							
							<div class="itm">
								楼层：<input type="text" class="u-txt txt" id="artistName"  name="floor" maxlength="30">
							</div>

							<div class="itm">
								房间类型：
								<select name="type" class="u-txt txt" style="height:auto" id="select">
									<option value="1">
										单人房
									</option>
									<option value="2">
										双人房
									</option>
								</select>
							</div>
							
							<div class="itm">
								房间状态：
								<select name="state" class="u-txt txt" style="height:auto" id="select">
									<option value="0">
										空闲
									</option>
									<option value="2">
										维修
									</option>
								</select>
							</div>
							
							<div class="itm">
								是否干净：
								<select name="isClear" class="u-txt txt" style="height:auto" id="select">
									<option value="1">
										干净
									</option>
									<option value="0">
										不干净
									</option>
								</select>
							</div>
							
							<div class="itm">
								备注：<input type="text" class="u-txt txt" id="artistName"  name="notes" maxlength="30">
							</div>
							
							<div class="itm">
								是否锁房：
								<select name="isLock" class="u-txt txt" style="height:auto" id="select">
									<option value="0">
									     否
									</option>
									<option value="1">
										是
									</option>
									
								</select>
							</div>
							
							<div class="itm">
								锁房原因：<input type="text" class="u-txt txt" id="artistName"  name="lockReason" maxlength="30">
							</div>

							
													
							<div class="itm ft">
								<input name="submit" type="submit" value="保存" >
								<input onclick="history.go(-1)"  type="button" value="返回" >
							</div>
							
							
						</div>
					</div>
				</form>
					
			</div>
		</div>

		
		
		
		<script
			src="//s3.music.126.net/sep/s/2/core.js?756557f5ea03745b332e7a7231d40984"
			type="text/javascript">
		</script>

		<script
			src="//s3.music.126.net/sep/s/2/pt_profile_update.js?7c50f062f581255b2ec534505774f597"
			type="text/javascript">
		</script>
 <script src="js/jquery.1.3.2.js" type="text/javascript"></script>       
<script>
	function  addCheck(){
		
		if($('#roomID').val()==""){
			alert("房间号号不能为空！");
			return false;
		}
		
		if($('#floor').val()==""){
			alert("楼层不能为空！");
			return false;
		}
		
		
		return true; 
		
	}

</script>
	</body>
</html>
