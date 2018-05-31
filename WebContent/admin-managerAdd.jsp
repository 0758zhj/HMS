<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>新增员工</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
		
		<script type="text/javascript" src="js/toolTip/tooltip.js"></script>
 <link type="text/css" rel="stylesheet" href="js/toolTip/tooltip.css"/>
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

		<div class="g-bd">
			<div class="g-wrap" id="baseBox">
					
				<ul class="m-tabs f-cb">
					<li class="fst">
						<a ><em>新增员工</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return addCheck()" action="admin-managerAdd_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								员工工号：<input type="text" class="u-txt txt" id="artistName"  name="manager" maxlength="30">
							</div>
							
							<div class="itm">
								密码：<input type="text" class="u-txt txt" id="artistName"  name="PWD" maxlength="30">
							</div>

							<div class="itm">
								是否可用：
								<select name="type" class="u-txt txt" style="height:auto" id="select">
									<option value="1">
									    可 用
									</option>
									<option value="0">
										不可用
									</option>
									
								</select>
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
		
		if($('#manager').val()==""){
			alert("员工工号不能为空！");
			return false;
		}
		
		if($('#PWD').val()==""){
			alert("密码不能为空！");
			return false;
		}
		
		
		return true; 
		
	}

</script>
	</body>
</html>
