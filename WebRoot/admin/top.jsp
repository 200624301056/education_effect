<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import ="java.sql.*,java.io.*,java.util.*" %>
<%
String uname = (String) session.getAttribute("uname");	
if(session.getAttribute("uname")==null)
     out.print("<script>alert('请先登录！');window.location.href='../index.jsp'</script>");
	 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{
	margin:0 auto;
	background:url(images/top_bg.jpg) repeat-x center center;
	font-family:Georgia, "Times New Roman", Times, serif;
	font-size:12px;
	background-color: #52B43B;
	margin-left: 0px;
	margin-right: 0px;
	}

.header{ 
    width:960px;
	padding-top:5px;
    text-align:center;
	margin: 0 auto;
    }
.header .left{ 
    width:90px;
	height:90px;
	float:left;
    text-align:center;
	margin: 0 auto;
    }
.header .right{
	width:760px;
	height:90px;
	float:left;
	margin:0 auto;
	}
.font1{font-size:18px;line-height:50px; float:left; color:#FFF;margin-top:20px; margin-left:5px; }
.font2{font-size:12px;line-height:50px; float:left; margin-left:5px; color:#FFF; }
.font3{font-size:12px; line-height:50px; color:#FFF; margin-top:40px; width:350px; float:right;}
</style>
</head>
<body>
<center>
<div class="header">
<div class="left"><img src="images/logo.gif" width="90" height="90"></div>

<div class="right">

<div class="font1"><b>学生综合实践活动教育效果分析管理系统后台</b></div>

<div class="font3">
欢迎您的登陆:<%=uname%> | <a href="admin_info.jsp" target="mainFrame">浏览个人信息</a> | <a href="login_out.jsp" target="_parent">退出登陆</a> </div>
</div>
</div>
</center>
</body>
</html>