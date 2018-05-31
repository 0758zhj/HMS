<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/><%
String manager=(String)session.getAttribute("manager");
if(manager!=null && manager!=""){
	String sql="select * from tb_manager where manager='"+manager+"'";
	ResultSet rs=conn.executeQuery(sql);
	int id=-1;
	if(rs.next()){
		id=rs.getInt(1);
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>修改密码</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
	</head>
	<body id="auto-id-X1gI20iWgxfCg0Tz" style="background: url(image/bg.jpg) repeat-y 100% 100%;">
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
					
				
				
				<form onsubmit="return modifyPs();" action="admin-modifyPs_deal.jsp"  >
					<div class="n-base f-cb"> 
						<div class="frm m-frm">
						
							<div align="center">
								<span style="color:red">*</span>原密码：<input type="password" class="u-txt txt" id="pwd"  name="pwd" maxlength="30">
							</div>
							<br/>
							<div align="center">
								新密码：<input type="password"   class="u-txt txt" value="" id="psNew" name="psNew" maxlength="30">
							</div>
							<br/>
							<div align="center">
								新密码确认：<input type="password" class="u-txt txt" id="psNew2" name="psNew2" maxlength="30">
							</div>
							<br/>
							<input type="hidden" value="<%=id%>" name="ID" />	<br/>	
							<br/>	
							<br/>						
							<div align="center">
								<input name="submit" type="submit" value="保存" >
							</div>
							
						</div>
					</div>
				</form>
					
			</div>
		</div>
						      


<script type="text/javascript">  
function modifyPs(){  
	
	if($('#pwd').val()==""){
		alert("原密码不能为空！");
		return false;
	}		
	if($('#psNew').val()==""){
		alert("新密码不能为空！");
		return false;
	}		
	if($('#psNew2').val()==""){
		alert("新密码确认不能为空！");
		return false;
	}
	if(    $('#psNew').val()  !=  $('#psNew2').val()   ){
		alert('密码前后不一致！');
		return false;
	}
	
    var password = document.getElementById("psNew").value;  
    var repassword = document.getElementById("psNew2").value;  
         if(password!=repassword){  
             window.alert("您输入的新密码与确认密码确认不一致");  
             signupForm.repassword.focus();  
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