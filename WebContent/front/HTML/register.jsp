<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="../CSS/script001.css">
   <style>
       jsp,body{ margin:0; padding:0; border:0; background-color: lightblue;}
       #registeredPanel{background-color: aliceblue;background-size:40% 40%;}
       .auto-style4 {
           position: absolute;
           top: 30%;
           left: 50%;
           width: 270px;
           height: 480px;
       }
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
    <form onsubmit="return modifyPs();" action="registerCheck.jsp">
        <div id="registeredPanel" style="margin-left:-180px; margin-top:-90px;" class="auto-style4">
            <br>
            <p style="text-align: center"><label>注册</label></p>
            <br>
            <p><label for="userName">&nbsp;&nbsp;&nbsp;&nbsp;手机号：</label></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="tel" size="28" id="phone" name="phone" style="height: 20px"></p>
            <br>
            <p><label for="passWord1">&nbsp;&nbsp;&nbsp;&nbsp;密码： </label></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" size="28" id="passWord1" name="passWord1" style="height: 20px"></p>
            <br>
            <p><label for="passWord2">&nbsp;&nbsp;&nbsp;&nbsp;确认密码：</label></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" size="28" id="passWord2" name="passWord2" style="height: 20px"></p>
            <br>
            
            <p style="text-align: center"><input type="submit" value="注册账号" style="width: 150px;height: 25px;text-align: center;background-color: cornflowerblue;color: white"></p>
            <br>
            <p style="text-align: center"><input type="button" value="返回首页" style="width: 150px;height: 25px;text-align: center;background-color: cornflowerblue;color: white" onclick="window.location.href='index.jsp'"></p>
        </div>
    </form>
</div>

<script type="text/javascript">  
function modifyPs(){  
	
	if($('#phone').val()==""){
		alert("手机号不能为空！");
		return false;
	}		
	if($('#passWord1').val()==""){
		alert("密码不能为空！");
		return false;
	}		
	if($('#passWord2').val()==""){
		alert("密码确认不能为空！");
		return false;
	}
	if(    $('#passWord1').val()  !=  $('#passWord2').val()   ){
		alert('密码前后不一致！');
		return false;
	}
	
    var password = document.getElementById("passWord1").value;  
    var repassword = document.getElementById("passWord2").value;  
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