<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>首页</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <script src="../js/script001.js"></script>
<link rel="stylesheet" href="../CSS/script001.css">
    <link rel="stylesheet" href="../CSS/reset.min.css">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/calendar.css" />
    <style type="text/css">
        .container {width: 100%;margin: 100px auto;height: 100px}
        .photo {float: left; width: 30%;}
        .content {float: right; width: 70%;}
        .orderButton {float: right; width: 30%;}
         .mask_calendar {
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0,0,0,.4);
            display: none;
        }
        .calendar {
            height: 400px;
            position: fixed;
            bottom: 0;
            left: 0;
        }
        .Date_lr{width:50%;text-align:center;}
        .span21{
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%,-50%);
            transform: translate(-50%,-50%);
            font-size:14px;
            color: #666;
            border: 1px solid #e5e5e5;
            padding:2px 8px;
            line-height: 20px;
            border-radius: .2rem;
            background-color: #fff;
        }
        #checkinout{
            height: 50px;
            line-height: 50px;
            position: relative;
            margin: 10px;
            padding: 2px 0;
            display: -webkit-box;
            display: flex;
            border: 1px solid #e5e5e5;
            border-radius: .02rem;
            background-color: #fff;
        }
        #firstSelect p{line-height:25px;color: #999;font-size:12px;}
        #startDate{border:0;position: absolute;left: 0;margin: 0 auto;width: 50%;font-size: 16px;color: #05c0ad;text-align: center;}
        #endDate{border:0;position: absolute;right: 0;margin:auto 0;width:50%;font-size: 16px;color: #05c0ad;text-align: center;}
        .mask_calendar {
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0,0,0,.4);
            display: none;
            z-index: 9999;
        }
        .calendar {
            height: 400px;
            position: fixed;
            bottom: 0;
            left: 0;
        }
        .animated {
            animation-duration: 1s;
            animation-fill-mode: both;
        }
        @keyframes slideInDown {
            from {
                transform: translate3d(0, -100%, 0);
                visibility: visible;
            }

            to {
                transform: translate3d(0, 0, 0);
            }
        }
        .slideInDown {
            animation-name: slideInDown;
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
<div>
    <img src="../Images/1.jpg" id="myPicture" width="100%" height="600" alt="HotelImage">
</div>
    <div class="tab-wrapper">
        <ul class="tab-menu">
            <li class="active">酒店预订</li>
            <li>酒店信息</li>
            
        </ul>
        <div class="tab-content">
            <div>
                <!-- <div id="firstSelect">
                    <input type="text" id="startDate" readonly />
                    <input type="text" id="endDate" readonly/>
                </div> -->
               
                <div class="mask_calendar">
                    <div class="calendar"></div>
                </div>
               
                
                <div class="container">
                    <div class="photo"><img src="../Images/2.jpg" style="height: 150px;width: 200px" /></div>
                    <div class="content">
                        <br><br>
                        <div>
                            <span>单人房</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span style="color: coral">价格：80元起</span></div>
                        
                    </div>
                    <div class="orderButton"><input type="button" value="预订" class="button003" onclick="window.location.href='front_order.jsp'" ></div>
                </div>
                <div class="container">
                    <div class="photo"><img src="../Images/2.jpg" style="height: 150px;width: 200px" /></div>
                    <div class="content">
                        <br><br>
                        <div>
                            <span>双人房</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span style="color: coral">价格：100元起</span></div>
                       
                    </div>
                    <div class="orderButton"><input type="button" value="预订" class="button003" onclick="window.location.href='front_order_2.jsp'"></div>
                </div>
            </div>
            <div>
                <h2>地址：</h2> <p>广东省韶关市韶关学院</p>
                <br>
               <h2>联系电话：</h2> <p>8888-8888888</p>
            </div>
            <div>3</div>
        </div><!-- //tab-content -->
    </div><!-- //tab-wrapper -->
    <script src='../js/jquery.min.js'></script>
    <script  src="../js/index.js"></script>
    <script type="text/javascript" src="../js/date.js"></script>
<script>
    $(function(){
        $('#firstSelect').on('click',function () {
            $('.mask_calendar').show();
        });
        $('.mask_calendar').on('click',function (e) {
            if(e.target.className == "mask_calendar"){
                $('.calendar').slideUp(200);
                $('.mask_calendar').fadeOut(200);
            }
        })
        $('#firstSelect').calendarSwitch({
            selectors : {
                sections : ".calendar"
            },
            index : 4,      //å±ç¤ºçæä»½ä¸ªæ°
            animateFunction : "slideToggle",        //å¨ç»ææ
            controlDay:true,//ç¥å¦æ§å¶å¨daysnumberå¤©ä¹åï¼è¿ä¸ªæ°å¼çè®¾ç½®åææ¯æ»æ¾ç¤ºå¤©æ°å¤§äº90å¤©
            daysnumber : "90",     //æ§å¶å¤©æ°
            comeColor : "#2EB6A8",       //å¥ä½é¢è²
            outColor : "#2EB6A8",      //ç¦»åºé¢è²
            comeoutColor : "#E0F4F2",        //å¥ä½åç¦»åºä¹é´çé¢è²
            callback :function(){//åè°å½æ°
                $('.mask_calendar').fadeOut(200);
                var startDate = $('#startDate').val();  //å¥ä½çå¤©æ°
                var endDate = $('#endDate').val();      //ç¦»åºçå¤©æ°
                var NumDate = $('.NumDate').text();    //å±å¤å°æ
                console.log(startDate);
                console.log(endDate);
                console.log(NumDate);
                
            }  ,
            comfireBtn:'.comfire'//ç¡®å®æé®çclassæèid
        });
        var b=new Date();
        var ye=b.getFullYear();
        var mo=b.getMonth()+1;
        mo = mo<10?"0"+mo:mo;
        var da=b.getDate();
        da = da<10?"0"+da:da;
        $('#startDate').val(ye+'-'+mo+'-'+da);
        b=new Date(b.getTime()+24*3600*1000);
        var ye=b.getFullYear();
        var mo=b.getMonth()+1;
        mo = mo<10?"0"+mo:mo;
        var da=b.getDate();
        da = da<10?"0"+da:da;
        $('#endDate').val(ye+'-'+mo+'-'+da);
    });
</script>

</div>
</body>
</html>