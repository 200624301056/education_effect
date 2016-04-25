<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <jsp:useBean scope="page" id="Score" class="com.bar.db.Score" />
	<style type="text/css">
	body{margin:0 auto; padding-top:10px; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
	.input1{width:250px; height:20px;}
	.input2{ width:80px; height:20px; border: 1px #999 dashed; background-color:#333; color:#fff}
	.input3{width:250px; height:20px;}
	</style>
	</head>
	<body bgcolor="#F2F2F2">
    
    <%
	    String strPage = request.getParameter("showPage");
		String sStuid = request.getParameter("Stuid");
		long lStuid = Long.parseLong(sStuid);
		Score.setStuid(lStuid);
		Score.init();
	%>
    
    
	<div align="center">
	<form name="form1" method="post" action="updata_parscore_save.jsp" target="_self">
    	<input type="hidden" name="stuid" value="<%=lStuid%>">
		<input type="hidden" name="showPage" value="<%=strPage%>">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<td height="25" colspan="4" align="center"><h1 style="color:#0F3; font-size:14px">修改实践活动课程成绩信息</h1>
	      <p style="color: #F00; font-size:12px">以下选项均为必填项，请认真填写，若填写错误，请删除错误信息后重新添加！</p></td>
	  </tr>
	<tr>
		<td width="13%" height="41" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
		<td width="30%" height="41" align="left">&nbsp;
		  <input name="stu_name" type="text" class="input1" id="Score_fis5" value="<%=Score.getSUname()%>"></td>
		<td width="20%" height="41" align="right">学员&nbsp;编号：</td>
		<td width="37%" height="41" align="left">&nbsp;
	    <input name="stu_num" type="text" class="input1" id="Score_fis4" value="<%=Score.getStu_num()%>"></td>
	  </tr>
	<tr>
		<td width="13%" height="48" align="right">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
		<td width="30%" height="48" align="left">&nbsp;
		  <input name="term" type="text" class="input1" id="Score_fis6" value="<%=Score.getTerm()%>"></td>
		<td width="20%" height="41" align="right">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</td>
		<td width="37%" height="41" align="left">&nbsp;
	    <input name="school" type="text" class="input1" id="Score_fis3" value="<%=Score.getSchool()%>"></td>
	</tr>
	<tr>
		<td width="13%" height="39" align="right">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
	<td width="30%" height="39" align="left">&nbsp;
	  <input name="grade" type="text" class="input1" id="Score_fis" value="<%=Score.getGrade()%>"></td>
		<td width="20%" height="48" align="right">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
		<td width="37%" height="48" align="left">&nbsp;
		<input name="class_name" type="text" class="input1" id="Score_fis2" value="<%=Score.getClass_name()%>"></td>
	</tr>
	  	<tr>
	  <td height="48" align="right">1.CS真人对抗：</td>
	  <td height="48" align="left">&nbsp;&nbsp;
	    <input name="Score_fis" type="text" class="input1" id="SUname" value="<%=Score.getScore_fis()%>"></td>
	  <td width="20%" height="39" align="right">2.组合障碍：</td>
		<td width="37%" height="39" align="left">&nbsp;&nbsp;
		  <input name="Score_sec" type="text" class="input1" id="stu_name" value="<%=Score.getScore_sec()%>"></td>
	  </tr>
	  	<tr>
	  <td height="48" align="right">3.无线电测向：</td>
	  <td height="48" align="left">&nbsp;&nbsp;
	    <input name="Score_thr" type="text" class="input1" id="stu_name2" value="<%=Score.getScore_thr()%>"></td>
	  <td width="20%" height="39" align="right">4.多米诺骨牌：</td>
		<td width="37%" height="39" align="left">&nbsp;&nbsp;
		  <input name="Score_fou" type="text" class="input1" id="stu_name3" value="<%=Score.getScore_fou()%>"></td>
	  </tr>
	  	<tr>
	  <td height="48" align="right">5.水上溜索：</td>
	  <td height="48" align="left">&nbsp;&nbsp;
	    <input name="Score_fiv" type="text" class="input1" id="stu_name4" value="<%=Score.getScore_fiv()%>"></td>
	  <td width="20%" height="39" align="right">6.电网：</td>
		<td width="37%" height="39" align="left">&nbsp;&nbsp;
		  <input name="Score_six" type="text" class="input1" id="stu_name5" value="<%=Score.getScore_six()%>"></td>
	  </tr>
	  	<tr>
	  <td height="48" align="right">7.家常菜制作：</td>
	  <td height="48" align="left">&nbsp;&nbsp;
	    <input name="Score_sev" type="text" class="input1" id="stu_name6" value="<%=Score.getScore_sev()%>"></td>
	  <td width="20%" height="39" align="right">8.军训成绩 ：</td>
		<td width="37%" height="39" align="left">&nbsp;&nbsp;
		  <input name="Score_eig" type="text" class="input1" id="stu_name7" value="<%=Score.getScore_eig()%>"></td>
	  </tr>
	<tr>
	  <td height="39" colspan="4" align="center"><p>填写注意事项：</p>
	
	    <p>如果已经确认信息正确，请点击&ldquo;添加&rdquo;按钮，否则请点击&ldquo;清除&rdquo;按钮重或者新填写</p></td>
	  </tr>
	</table>
	<p>
	<input name="sub" type="submit" class="input2" value="修改">&nbsp;&nbsp;
	<input name="res" type="reset" class="input2" value="清除">&nbsp;&nbsp;
     <input type="button" name="btn2" value="返回" onClick="window.history.go(-1)" class="input2">
	</p>
	</form>
	</div>
	</body>
</html>
