<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('���ȵ�¼��');window.location.href='../index.jsp'</script>");	 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӭ�������ϵͳ</title>
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
 if((LastLeftID!="")&&(emid!=LastLeftID)) //�ر���һ��Menu
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
<li><a href="main.jsp" target="mainFrame">ϵͳ��ҳ</a></li>
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">ѧ������</a>
 <ul id="ChildMenu1" class="collapsed">
 <li><a href="admin_students.jsp" target="mainFrame">ѧ������</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu2" onClick="DoMenu('ChildMenu2')">��ʦ����</a>
 <ul id="ChildMenu2" class="collapsed">
 <li><a href="admin_teacher.jsp" target="mainFrame">��ʦ����</a></li>
 </ul>
</li>
<li><a href="#Menu=ChildMenu3" onClick="DoMenu('ChildMenu3')">�γ̹���</a>
 <ul id="ChildMenu3" class="collapsed">
 <li><a href="admin_course.jsp" target="mainFrame">�γ̹���</a></li>
 <li><a href="shisizhongkecb.htm" target="mainFrame">�α��ѯ</a></li>
 </ul>
</li>
<li><a href="#Menu=ChildMenu4" onClick="DoMenu('ChildMenu4')">�������</a>
 <ul id="ChildMenu4" class="collapsed">
 <li><a href="admin_dormitory.jsp" target="mainFrame">�������</a></li>
 <li><a href="admin_dro_dis.jsp" target="mainFrame">�������</a></li>
  <li><a href="admin_stu_dis.jsp" target="mainFrame">�����ѯ</a></li>
   <li><a href="admin_dor_pb.jsp" target="mainFrame">�Ǽ�����</a></li>
</ul>
</li>

<li><a href="#Menu=ChildMenu5" onClick="DoMenu('ChildMenu5')">�ɼ�����</a>
 <ul id="ChildMenu5" class="collapsed">
 <li><a href="admin_practice_score.jsp" target="mainFrame">ʵ����γ̳ɼ�</a></li>
 <li><a href="admin_general_score.jsp" target="mainFrame">ͨ�ü����γ̳ɼ�</a></li>
 <li><a href="admin_integrate_score.jsp" target="mainFrame">�ۺ����ʳɼ�</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu6" onClick="DoMenu('ChildMenu6')">Ч������</a>
 <ul id="ChildMenu6" class="collapsed">
 <li><a href="admin_effect.jsp" target="mainFrame">Ч������</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu7" onClick="DoMenu('ChildMenu7')">��վ����</a>
 <ul id="ChildMenu7" class="collapsed">
 <li><a href="admin_info.jsp" target="mainFrame">����Ա��Ϣ</a></li>
 </ul>
</li>
</ul>
</div>
</body>
</html>