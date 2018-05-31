<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
	<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
	String manager_cur = (String) session.getAttribute("manager");
    String position_cur = (String) session.getAttribute("position");

	if (manager_cur==null || manager_cur == "") {	
		out.println("<script lanage='javascript'>alert('请先登录！!');window.location.href='login.jsp';</script>");
	}
%>
<%
request.setCharacterEncoding("utf-8");

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>批处理修改房价</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
	</head>
	<body >
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
						<a ><em>修改房价</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return editCheck();" action="room-updatePrice_all_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							

							<div class="itm">
								房间类型：
								<select id="type" name="type" class="u-txt txt" style="height:auto">
									<option value="1">
										单人房
									</option>
									<option value="2">
									    双人房
									</option>
									
								</select>
							</div>
							<div class="itm">
							价格：<input type="text"  class="u-txt txt" id="price"  name="price" maxlength="30">
							</div>

							<!-- id修改的表 主键 -->
							<input type="hidden" value="" name="ID">	     				
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
			src="//s3.music.126.net/sep/s/2/pt_profile_update.js?7c50f062f581255b2ec534505774f597"
			type="text/javascript">
		</script>
 <script src="js/jquery.1.3.2.js" type="text/javascript"></script>       
<script>
    


	function  editCheck(){
		if($('#price').val()==""){
			alert("价格不能为空！");
			return false;
		}
		
		
		
		
		return true; 
		
	}

</script>
	</body>
</html>
