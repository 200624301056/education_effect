<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('请先登录！');window.location.href='../index.jsp'</script>");
	 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>欢迎光临企业办公平台</title>
	<style type="text/css">
	body{margin:0 auto; padding-top:10px; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
	.input1{width:250px; height:20px;}
	.input2{ width:80px; height:20px; border: 1px #999 dashed; background-color:#333; color:#fff}
	.input3{width:300px; height:20px;}
	</style>
	</head>
	<body bgcolor="#F2F2F2">
	<div align="center">
	<form name="form1" method="post" action="add_dor_save.jsp" target="_self">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<td height="25" colspan="4" align="center"><h1 style="color:#0F3; font-size:14px">添加新宿舍信息</h1>
	      <p style="color: #F00; font-size:12px">以下选项均为必填项，请认真填写，若填写错误，请删除错误信息后重新添加！</p></td>
	  </tr>
	<tr>
		<td width="13%"height="41" align="right">宿舍名称：</td>
		<td width="30%"height="41" align="left">&nbsp;&nbsp;<input name="dor_num" type="text" class="input1" id="Name" size="20"></td>
		<td width="20%"height="41" align="right">楼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;层：</td>
		<td width="37%"height="41" align="left">&nbsp;&nbsp;<input name="dor_floor" type="text" class="input1" id="Birth" size="20"></td>
	</tr>
		<td width="13%"height="39" align="right">宿舍楼名称：</td>
		<td width="30%"height="39" align="left">&nbsp;&nbsp;<input name="dor_bulid" type="text" class="input1" id="Tel" size="20"></td>
		<td width="20%"height="48" align="right">管&nbsp;理&nbsp;员：</td>
		<td width="37%"height="48" align="left">&nbsp;&nbsp;<input name="admin" type="text" class="input1" size="20"></td>
	</tr>
	<tr>
	  <td height="39" colspan="4" align="center"><p>填写注意事项：</p>
	    <p>如果已经确认信息正确，请点击&ldquo;添加&rdquo;按钮，否则请点击&ldquo;清除&rdquo;按钮重或者新填写</p></td>
	  </tr>

	</table>
	<p>
	<input name="sub" type="submit" class="input2" value="添加">&nbsp;&nbsp;
	<input name="res" type="reset" class="input2" value="清除">&nbsp;&nbsp;
    <input type="button" name="btn2" value="返回" onClick="window.history.go(-1)" class="input2">
	</p>
	</form>
	</div>
	</body>
</html>
