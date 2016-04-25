<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎进入管理系统</title>
<link type="text/css"rel="Stylesheet"href="first.css"> 
<style type="text/css">
@import url(images/left.css);
</style>
<script type=text/javascript>
</script>
</head>
<body text="red">
<form style="border: 0px;">
<div id="dis" style="float:left;margin:0 50px;border:0;padding:0;"  >

<% 
	int num=82;
	//for(int i=0;i<100-num;i++){
 %>
<div style="width:100px; height:<%=(100-num)*3 %>px; background-color:#000000 "></div>
<div style="width:100px; height:<%=num*3 %>px; background-color:#FF0000"></div>
</div>
<div style="float:left;margin:0 50px;border:0;padding:0;">
<% 
	int nub=85;
 %>
 <div style="width:100px; height:<%=(100-nub)*3 %>px;background-color:#000000 "></div>
<div style="width:100px; height:<%=nub*3 %>px; background-color:#FF0000"></div>
</div>
</form>
</body>
</html>