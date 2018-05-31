<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="../CSS/script001.css">
    <style>
        html,body{ margin:0; padding:0; border:0; background-color: lightblue;}
        #loginPanel{background-color: aliceblue;background-size:40% 40%;}
        .auto-style4 {
            position: absolute;
            top: 30%;
            left: 50%;
            width: 270px;
            height: 360px;
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
</div>
<form action="front_loginCheck.jsp"  method="post">
<div id="loginPanel" style="margin-left:-180px; margin-top:-90px;" class="auto-style4">
    <br>
    <p style="text-align: center"><label>登录</label></p>
    <br>
    <p><label for="userName">&nbsp;&nbsp;&nbsp;&nbsp;手机号</label></p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="tel" size="28" id="phone"  name="phone" style="height: 20px"></p>
    <br>
    <p><label for="passWord">&nbsp;&nbsp;&nbsp;&nbsp;密码 </label></p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" size="28" id="PWD" name="PWD" style="height: 20px"></p>
    <br>
    <p style="text-align: center"><input type="submit" value="登录" style="width: 150px;height: 25px;text-align: center;background-color: cornflowerblue;color: white"></p>
    <br>
    <p style="text-align: center"><input type="button" value="注册账号" style="width: 150px;height: 25px;text-align: center;background-color: cornflowerblue;color: white" onclick="window.location.href='register.jsp'" ></p>
    <br>
    <p style="text-align: center"><input type="button" value="返回首页" style="width: 150px;height: 25px;text-align: center;background-color: cornflowerblue;color: white" onclick="window.location.href='index.jsp'"></p>
</div>
</form>
</body>
</html>