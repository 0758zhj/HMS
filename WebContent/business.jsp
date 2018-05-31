<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.*" %>
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
	String manager = (String) session.getAttribute("manager");
    String position = (String) session.getAttribute("position");
    
     String sRoom=request.getParameter("sRoom");  //搜索栏中输入的房间号
     
     StringBuffer sql=new StringBuffer();
    sql.append("select * from tb_room where 1=1");
    
    if(sRoom==null){
    	sRoom="";
    }
    sql.append("and roomID like '%"+sRoom+"%'");
    
    String type_temp=request.getParameter("type");
    String floor_temp=request.getParameter("floor");
    String state_temp=request.getParameter("state");
    String isClear_temp=request.getParameter("isClear");
    String isOrder_temp=request.getParameter("isOrder");
    //out.print(type_temp);
    if(type_temp==null)                    //房间类型检索
    {
          type_temp="";
    }else {
	   if(type_temp.equals("1"))
	    {
	          type_temp="单人房";
	          sql.append("and type='"+type_temp+"'");
	    }
	   else if(type_temp.equals("2"))
	    {
	          type_temp="双人房";
	          sql.append("and type='"+type_temp+"'");
	    }
    	
    }
    
    if(floor_temp==null)                  //楼层检索
    {
          floor_temp="";
    }
    else 
    {  
	          sql.append("and floor='"+floor_temp+"'");
    }
    
    if(state_temp==null)                    //房间类型检索
    {
          state_temp="";
    }else {
	   if(state_temp.equals("0"))
	    {
	          state_temp="空闲";
	          sql.append("and state='"+state_temp+"'");
	    }
	   else if(state_temp.equals("1"))
	    {
	          state_temp="住人";
	          sql.append("and state='"+state_temp+"'");
	    }
	   else if(state_temp.equals("2"))
	    {
	          state_temp="维修";
	          sql.append("and state='"+state_temp+"'");
	    }
    	
    }
    
    if(isClear_temp==null)                  //楼层检索
    {
    	isClear_temp="";
    }
    else 
    {  
	          sql.append("and isClear='"+isClear_temp+"'");
    }
    
    if(isOrder_temp==null)                  //楼层检索
    {
    	isOrder_temp="";
    }
    else 
    {  
	          sql.append("and isOrder='"+isOrder_temp+"'");
    }
	   
    	 
    sql.append("order by floor desc,roomID asc");
    ResultSet rs=conn.executeQuery(sql.toString());
    
    int room_all=0;       //所有房间数量
    int room_0=0;       //空闲房间数量
    int room_1=0;       //房间数量
    int room_2=0;       //房间数量
    String pl="";
    String pc="";
    String pr="";
    String web="";
    
          
    int ID = 0;
	int roomID=0;
	int floor=0;
	String type = "";
	int price=0;
	String state="";
	String isClear="";
	String notes = "";
	String isLock="";
	String lockReason = "";
	String isOrder = "";
	
	
	int temp_floor=0;     //用于判断是否同一个楼层
	String color="";     //颜色
	
	
	//if (manager== null || manager == "") {
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>前台营业</title>
<link href="css/pt_search_index.css" type="text/css" rel="stylesheet">
 <script type="text/javascript" src="js/toolTip/tooltip.js"></script>
 <link type="text/css" rel="stylesheet" href="js/toolTip/tooltip.css"/>
 <!-- a去下划线 
    a:link，定义正常链接的样式； 
    a:visited，定义已访问过链接的样式； 
    a:hover，定义鼠标悬浮在链接上时的样式； 
    a:active，定义鼠标点击链接时的样式。 
 
 -->
 <style type="text/css">    
<!--
a:link {
 color:	#000000; 
 text-decoration: none;
}
a:visited {
color:	#000000; 
 text-decoration: none;
}
a:hover {
color:	#000000; 
 text-decoration: none;
}
a:active {
color:	#000000; 
 text-decoration: none;
}
-->
</style>
<style>
#header {
    background-color:#0099FF;
    
    
    padding:5px;
}
#nav {
    line-height:30px;
    
    height:600px;
    width:350px;
    float:right;
    padding:5px;	      
}
#section {
    
    float:left;
    padding:10px;	 	 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}
</style>
</head>

<body>
<div id="header" align="right">
<h1 align="center" ><font color="#FFFFFF">5A酒店管理系统</font></h1>
            <div  >
                <a onmouseover="tooltip.pop(this, '#textContent',{position:1, offsetX:0,  effect:'slide'})"  class="tooltip" style="color:#1C2021">您好，<%=manager%></a>
            </div>
            
            <div style="display: none">
				<div id="textContent" style="width: 75px; height: 75px;color:black">
					<%
					 if (null!=position && position.equals("经理")) {
					%>
					<a  href="admin-modifyPs.jsp">修改密码</a>
					<br />
					<a  href="admin-manager.jsp">后台管理</a>
					<br />
					<a id="blogUrl" href="logout.jsp">退出登录</a>
					<%} else {
					      session.setAttribute("manager", manager);
					%>	
					<a  href="admin-modifyPs.jsp">修改密码</a>
					<br />
					<a id="blogUrl" href="logout.jsp">退出登录</a>
					<%
						}
					%>
				</div>
			</div>

			
</div>


<div id="section">
<table>
<tr>
<%
       while(rs.next()){
    	    ID = rs.getInt("ID");
    		roomID=rs.getInt("roomID");
    		floor=rs.getInt("floor");  //获取的楼层
    		type =rs.getString("type");
    		price=rs.getInt("price");
    		state=rs.getString("state");
    		isClear=rs.getString("isClear");
    		notes = rs.getString("notes");
    		isLock=rs.getString("isClear");
    		lockReason = rs.getString("lockReason"); 
    		isOrder=rs.getString("isOrder");
    		
    		if(state.equals("空闲")&&isClear.equals("1")){    //空闲净
    			color="#0099FF";
    			pl="image//free.png";
    			pc="image//free.png";
    			pr="image//free.png";
    			web="room-free_1";
    			room_0++;
    		}
    		else if(state.equals("空闲")&&isClear.equals("0")){   //空闲脏
    			color="#0099FF";
    			pl="image//free.png";
    			pc="image//clear.png";
    			pr="image//free.png";
    			web="room-free_0";
    			room_0++;
    		}
    		else if(state.equals("住人")&&type.equals("单人房")&&isClear.equals("1")){     //住人 单人房 干净
    			color="#0F0";
    			pl="image//free.png";
    			pc="image//people.png";
    			pr="image//free.png";
    			web="room-checkIn_1_1";
    			room_1++;
    		}
    		else if(state.equals("住人")&&type.equals("单人房")&&isClear.equals("0")){     //住人 单人房  脏
    			color="#0F0";
    			pl="image//free.png";
    			pc="image//people.png";
    			pr="image//free.png";
    			web="room-checkIn_1_0";
    			room_1++;
    		}
    		else if(state.equals("住人")&&type.equals("双人房")&&isClear.equals("1")){     //住人 双人房 干净
    			color="#0F0";
    			pl="image//free.png";
    			pc="image//people.png";
    			pr="image//free.png";
    			web="room-checkIn_2_1";
    			room_1++;
    		}
    		else if(state.equals("住人")&&type.equals("双人房")&&isClear.equals("0")){     //住人 双人房 脏
    			color="#0F0";
    			pl="image//free.png";
    			pc="image//people.png";
    			pr="image//free.png";
    			web="room-checkIn_2_0";
    			room_1++;
    		}
    		else if(state.equals("维修")){                        //维修
    			color="#FF0000";
    			pl="image//free.png";
    			pc="image/fox.png";
    			pr="image//free.png";
    			web="room-fox";
    			room_2++;
    		}
    		
    		if(floor!=temp_floor){
    			%>
    			</tr>
    			
    			<tr>
    			  <td>
    			    <table style="background-color:	#000000">
							<tr>
							  
							    <td> <p><font size="4" face="arial" color="	#FFFFFF"><%=floor%>楼</font></p></td>
							    
							</tr>
							
						</table>
    			    
    			  </td>
    			<% 
    			temp_floor=floor;   			  			
    		}
%>


   
	
   <td>
		<a href='<%=web%>.jsp?roomID=<%=roomID%>'>
		<table style="background-color:<%=color %>"  >
			<tr>
			    <td><%=roomID %></td>
			    <td><%=type %></td>
			</tr>
			<tr>
			    <td><%=price %></td>
			    <td><img src="<%=pc %>" width="40" height="40" /></td>
			</tr>
		</table>
		</a>
	</td>	
			
<%
        
        room_all++;
         }
    
%>


</tr>

<tr>
	<th style="background-color:#B8860B">全部（<%=room_all %>）</th>
	<th style="background-color:#0099FF">空闲（<%=room_0 %>/<%=room_all %>）</th>
	<th style="background-color:#0F0">住人（<%=room_1 %>/<%=room_all %>）</th>
	<th style="background-color:#FF0000">维修（<%=room_2 %>/<%=room_all %>）</th>
</tr>

</table>
</div>

<div id="nav">
<div style="background-color:#F60">
<h1 align="center">营业状况/房间检索</h1>
</div>

			<div class="pgsrch f-pr j-suggest" id="auto-id-ErvdJrthwDvbXbzT">
				<form id="searchForm" action="business.jsp">
				<input  type="text" name="sRoom" class="srch j-flag" value="">
				<a hidefocus="true" href="javascript:document.getElementById('searchForm').submit();" class="btn j-flag"
					title="搜索" >搜索</a>
				</form>	
			</div>
			<input onclick="location.href='business.jsp'"  type="button" value="显示所有房间" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input onclick="location.href='room-order.jsp'"  type="button" value="预订管理" />
			<input onclick="location.href='room-updatePrice_all.jsp'"  type="button" value="批处理修改房价" />
			<hr/>
			
<div>
房态<br />
<input type="checkbox" value="空净" id="state_1"/>空净  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" value="空脏" id="state_2"/>空脏<br />
<input type="checkbox" value="住人净" id="state_3"/>住人净&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" value="住人脏" id="state_4"/>住人脏<br />
<input type="checkbox" value="维修" id="state_5"/>维修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" value="预订" id="state_6"/>预订<br />
</div><hr/>
<div>
房型<br />
<input type="checkbox" value="单人房" id="type_1" />单人房<br />
<input type="checkbox" value="双人房" id="type_2" />双人房<br />
</div><hr/>
<div>
楼层<br />
<input type="checkbox" value="2" id="floor_2"/>2<br />
<input type="checkbox" value="3" id="floor_3"/>3<br />
<input type="checkbox" value="4" id="floor_4"/>4<br />
<input type="checkbox" value="5" id="floor_5"/>5<br />
<input type="checkbox" value="6" id="floor_6"/>6<br />
</div>
</div>
<script>
   var Box_2= document.getElementById('type_2');
   Box_2.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?type=2';
   }
   }
   var Box_1= document.getElementById('type_1');
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?type=1';
   }
   }
   var Box_1= document.getElementById('floor_2');
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?floor=2';
   }
   }
   var Box_1= document.getElementById('floor_3');
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?floor=3';
   }
   }
   var Box_1= document.getElementById('floor_4');
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?floor=4';
   }
   }
   var Box_1= document.getElementById('floor_5');
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?floor=5';
   }
   }
   var Box_1= document.getElementById('floor_6');
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?floor=6';
   }
   }
   
   var Box_1= document.getElementById('state_1');        //空净
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?state=0&&isClear=1';
   }
   }
   var Box_1= document.getElementById('state_2');        //空脏
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?state=0&&isClear=0';
   }
   }
   var Box_1= document.getElementById('state_3');        //住人净
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?state=1&&isClear=1';
   }
   }
   var Box_1= document.getElementById('state_4');        //住人脏
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?state=1&&isClear=0';
   }
   }
   var Box_1= document.getElementById('state_5');        //维修
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?state=2';
   }
   }
   var Box_1= document.getElementById('state_6');        //预订
   Box_1.onclick =function(){
   if(this.checked){
        //startOnlick();//选中后需要执行的方法
    	 window.location.href='business.jsp?isOrder=1';
   }
   }
</script>

</body>
</html>
