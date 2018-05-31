<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
	<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
request.setCharacterEncoding("utf-8");
String ID=request.getParameter("ID");
//String manager=(String)session.getAttribute("manager");
if(ID!=null && ID!=""){
	ResultSet rs=conn.executeQuery("select * from tb_room where id='"+ID+"'");
	
	int id=-1;
	String roomID="";
	String floor="";
	String type="";
	if(rs.next()){
		id=rs.getInt(1);
		roomID=rs.getString(2);
		floor=rs.getString(3);
		type=rs.getString("type");	
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>修改房间信息</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
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
						<a ><em>修改房间</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return editCheck();" action="admin-roomEdit_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								房间号：<input type="text" value="<%=roomID%>" class="u-txt txt" id="artistName"  name="roomID" maxlength="30">
							</div>
							
							<div class="itm">
								楼层：<input type="text" value="<%=floor%>" class="u-txt txt" id="artistName"  name="floor" maxlength="30">
							</div>

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

							<!-- id修改的表 主键 -->
							<input type="hidden" value="<%=id%>" name="ID">	     				
							<div class="itm ft">
								<input name="submit" type="submit" value="保存" >
								<input onclick="history.go(-1)"  type="button" value="返回" >
							</div>
							
							
						</div>
					</div>
				</form>
					
			</div>
		</div>

		
		<a title="回到顶部" class="m-back" href="#" id="g_backtop"
			hidefocus="true" style="display: none;">回到顶部</a>

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
    


	function  editCheck(){
		if($('#roomID').val()==""){
			alert("房间号不能为空！");
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
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('请先登录，再修改个人信息!');window.location.href='login.jsp';</script>");
}%>