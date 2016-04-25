<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('请先登录！');window.location.href='../index.jsp'</script>");	 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎进入管理系统</title>
<link rel=stylesheet type=text/css href="../lib/ware.css">
<style type="text/css">
@import url(images/left.css);
</style>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
 var obj = document.getElementById("nav").getElementsByTagName("li");
 
 for (var i=0; i<obj.length; i++) {
  obj[i].onmouseover=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseDown=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseUp=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onmouseout=function() {
   this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
  }
 }
}
function DoMenu(emid)
{
 var obj = document.getElementById(emid); 
 obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
 if((LastLeftID!="")&&(emid!=LastLeftID)) //关闭上一个Menu
 {
  document.getElementById(LastLeftID).className = "collapsed";
 }
 LastLeftID = emid;
}
function GetMenuID()
{
 var MenuID="";
 var _paramStr = new String(window.location.href);
 var _sharpPos = _paramStr.indexOf("#");
 
 if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
 {
  _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
 }
 else
 {
  _paramStr = "";
 }
 
 if (_paramStr.length > 0)
 {
  var _paramArr = _paramStr.split("&");
  if (_paramArr.length>0)
  {
   var _paramKeyVal = _paramArr[0].split("=");
   if (_paramKeyVal.length>0)
   {
    MenuID = _paramKeyVal[1];
   }
  }

 }
 
 if(MenuID!="")
 {
  DoMenu(MenuID)
 }
}
GetMenuID();
menuFix();
--></script>
</head>
<body>
<div id="PARENT">
<ul id="nav">
<li><a href="main.jsp" target="mainFrame">系统首页</a></li>
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">学生管理</a>
 <ul id="ChildMenu1" class="collapsed">
 <li><a href="admin_students.jsp" target="mainFrame">学生管理</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu2" onClick="DoMenu('ChildMenu2')">教师管理</a>
 <ul id="ChildMenu2" class="collapsed">
 <li><a href="admin_teacher.jsp" target="mainFrame">教师管理</a></li>
 </ul>
</li>
<li><a href="#Menu=ChildMenu3" onClick="DoMenu('ChildMenu3')">课程管理</a>
 <ul id="ChildMenu3" class="collapsed">
 <li><a href="admin_course.jsp" target="mainFrame">课程管理</a></li>
 <li><a href="shisizhongkecb.htm" target="mainFrame">课表查询</a></li>
 </ul>
</li>
<li><a href="#Menu=ChildMenu4" onClick="DoMenu('ChildMenu4')">宿舍管理</a>
 <ul id="ChildMenu4" class="collapsed">
 <li><a href="admin_dormitory.jsp" target="mainFrame">宿舍管理</a></li>
 <li><a href="admin_dro_dis.jsp" target="mainFrame">宿舍分配</a></li>
  <li><a href="admin_stu_dis.jsp" target="mainFrame">分配查询</a></li>
   <li><a href="admin_dor_pb.jsp" target="mainFrame">星级评比</a></li>
</ul>
</li>

<li><a href="#Menu=ChildMenu5" onClick="DoMenu('ChildMenu5')">成绩管理</a>
 <ul id="ChildMenu5" class="collapsed">
 <li><a href="admin_practice_score.jsp" target="mainFrame">实践活动课程成绩</a></li>
 <li><a href="admin_general_score.jsp" target="mainFrame">通用技术课程成绩</a></li>
 <li><a href="admin_integrate_score.jsp" target="mainFrame">综合素质成绩</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu6" onClick="DoMenu('ChildMenu6')">效果评估</a>
 <ul id="ChildMenu6" class="collapsed">
 <li><a href="admin_effect.jsp" target="mainFrame">效果评估</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu7" onClick="DoMenu('ChildMenu7')">网站管理</a>
 <ul id="ChildMenu7" class="collapsed">
 <li><a href="admin_info.jsp" target="mainFrame">管理员信息</a></li>
 </ul>
</li>
</ul>
</div>
</body>
</html>