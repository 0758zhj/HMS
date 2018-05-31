<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String phone_cur = (String) session.getAttribute("phone");

	if (phone_cur==null || phone_cur == "") {	
		out.println("<script lanage='javascript'>alert('请先登录！!');window.location.href='front_login.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <link rel="stylesheet" href="../CSS/script001.css">
    <script src='../js/jquery.min.js'></script>
    <script src="../js/jquery-1.11.1.min.js"></script>
    <style>
        html,body{ margin:0; padding:0; border:0; background-color: lightblue;}
        .auto-style1 {
            position: absolute;
            top: 20%;
            left: 10%;
            width: 270px;
            height: 480px;
        }
        .auto-style2 {
            position: absolute;
            top: 20%;
            left: 50%;
            width: 270px;
            height: 350px;
        }
        #passWordPanel
        {
            background-color: whitesmoke;background-size:40% 40%;
        }
        table{border:1px solid black;width: 400px;border-collapse:collapse;}
        td{border: 1px solid black;height: 30px;width: 200px}
    </style>
</head>
<body>
<div class="TopDiv">
     <p>
        <span id="_5AText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5A</span>
        <span id="HotelText">&nbsp;Hotel</span>
        <span id="BookingText">&nbsp;Booking</span>
        <span class="right"><input type="button" value="我的订单" class="button002" onclick="window.location.href='myOrder.jsp'" ></span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="right"><input type="button" value="修改密码" class="button002" onclick="window.location.href='massage.jsp'" ></span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="right"><input type="button" value="登录" class="button001" onclick="window.location.href='front_login.jsp'" ></span>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="right"><input type="button" value="注册" class="button001" onclick="window.location.href='register.jsp'" ></span>
    </p>
</div>

<form onsubmit="return modifyPs();" action="massage_deal.jsp"  >
<div class="auto-style2" id="passWordPanel"  >
    <br>
    <p style="text-align: center"><label>修改密码</label></p>
    <br>
    <p><label for="passWord1">&nbsp;&nbsp;&nbsp;&nbsp;原密码</label></p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" size="28" id="pwd"  name="pwd" style="height: 20px"></p>
    <br>
    <p><label for="passWord2">&nbsp;&nbsp;&nbsp;&nbsp;新密码</label></p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" size="28" id="psNew" name="psNew" style="height: 20px"></p>
    <br>
    <p><label for="passWord3">&nbsp;&nbsp;&nbsp;&nbsp;确认新密码</label></p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" size="28" id="psNew2" name="psNew2" style="height: 20px"></p>
    <br>
    <p style="text-align: center"><input type="submit" value="修改" style="width: 150px;height: 25px;text-align: center;background-color: cornflowerblue;color: white" ></p>
    <p style="text-align: center"><input type="button" value="返回" style="width: 150px;height: 25px;text-align: center;background-color: cornflowerblue;color: white"  class="buttonReturn"></p>
</div>
</form>
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