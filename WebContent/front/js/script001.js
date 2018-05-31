window.onload=choosePicture;

var myPicture=new Array("../Images/1.jpg","../Images/2.jpg","../Images/3.jpg","../Images/4.jpg","../Images/5.jpg","../Images/6.jpg","../Images/7.jpg","../Images/8.jpg","../Images/9.jpg");
var thisAD;


function choosePicture() {
    thisAD=Math.floor((Math.random()*myPicture.length));
    document.getElementById("myPicture").src=myPicture[thisAD];

    rotate();
}
function rotate() {
    thisAD++;
    if(thisAD==myPicture.length)
    {
        thisAD=0;
    }
    document.getElementById("myPicture").src=myPicture[thisAD];

    setTimeout(rotate,3*1000);
}