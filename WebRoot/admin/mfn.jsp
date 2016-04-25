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
<table style="border: 0px;width: 80px;height: 40px;">
<% 
	int num=82;
	for(int i=0;i<100-num;i++){
 %>
<tr style="width: 40px;height: 10px;">&nbsp;</tr>
<%
	}
 %>
 <% 
	for(int i=0;i<num;i++){
 %>
<tr style="background-color: red;width: 40px;height: 10px;">&nbsp;</tr>
<%
	}
 %>
 </table>
 </div>
 <div id="dis" style="float:left;margin:0 50px;border:0;padding:0;"  >
<table style="border: 0px;width: 80px;height: 40px;">
<% 
	int nub=86;
	for(int i=0;i<100-nub;i++){
 %>
<tr style="width: 40px;height: 10px;">&nbsp;</tr>
<%
	}
 %>
 <% 
	for(int i=0;i<nub;i++){
 %>
<tr style="background-color: red;width: 40px;height: 10px;">&nbsp;</tr>
<%
	}
 %>
 </table>
 </div>
</form>
</body>
</html>