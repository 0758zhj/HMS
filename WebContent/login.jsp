<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
<div style="background-color:#0099FF" align="right">
<h1 align="center" ><font color="#FFFFFF">5A酒店管理系统</font></h1>
</div>
<form  id="indexform" name="indexForm" action="logincheck.jsp" method="post">
                <table border="0" align="center">
                    <tr>
                        <td>账号：</td>
                        <td><input type="text" name="manager"></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="PWD">
                        </td>
                    </tr>
                </table>
            <br>
                <div align="center"><input  type="submit" value="登录" style="color:#BC8F8F"></div>
</form>
</body>
</html>
