<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
	<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
request.setCharacterEncoding("utf-8");
String ID=request.getParameter("ID");
//String manager=(String)session.getAttribute("manager");
if(ID!=null && ID!=""){
	ResultSet rs=conn.executeQuery("select * from tb_manager where ID='"+ID+"'");
	int id=-1;
	String manager="";
	String PWD="";
	int isAvailable=-1;
	if(rs.next()){
		id=rs.getInt(1);
		manager=rs.getString(2);
		PWD=rs.getString(3);
		isAvailable=rs.getInt(5);	
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>修改员工信息</title>
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
						<a ><em>修改员工</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return editCheck();" action="admin-managerEdit_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								员工工号：<input type="text" value="<%=manager%>" class="u-txt txt" id="manager"  name="manager" maxlength="30">
							</div>
							
							<div class="itm">
								密码：<input type="text" value="<%=PWD %>" class="u-txt txt" id="PWD"  name="PWD" maxlength="30">
							</div>

							<div class="itm">
								是否可用：
								<select id="type" name="type" class="u-txt txt" style="height:auto">
									<option value="1">
										可用
									</option>
									<option value="0">
									    不可用
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
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('请先登录，再修改个人信息!');window.location.href='login.jsp';</script>");
}%>