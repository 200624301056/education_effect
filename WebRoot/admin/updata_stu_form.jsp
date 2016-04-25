<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <jsp:useBean scope="page" id="Student" class="com.bar.db.Student" />
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
		Student.setStuid(lStuid);
		Student.init();
		
		//float Money = User.getMoney();
		
	%>
    
    
	<div align="center">
	<form name="form1" method="post" action="updata_stu_save.jsp" target="_self">
    	<input type="hidden" name="stuid" value="<%=lStuid%>">
		<input type="hidden" name="showPage" value="<%=strPage%>">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<td height="25" colspan="4" align="center"><h1 style="color:#0F3; font-size:14px">修改学生信息</h1>
	    <p style="color: #F00; font-size:12px">以下选项均为必填项，请认真填写，若填写错误，请删除错误信息后重新添加！</p></td>
	  </tr>
	<tr>
		<td width="13%" height="41" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
		<td width="30%" height="41" align="left">&nbsp;&nbsp;<input name="stu_name" type="text" class="input1" id="SUname" value="<%=Student.getSUname()%>"></td>
		<td width="20%" height="41" align="right">学员&nbsp;编号：</td>
		<td width="37%" height="41" align="left">&nbsp;&nbsp;<input name="stu_num" type="text" class="input1" id="stu_num" value="<%=Student.getStu_num()%>">例如：1988-09-20</td>
		
		</tr>
	<tr>
		<td width="13%" height="48" align="right">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
		<td width="30%" height="48" align="left">&nbsp;&nbsp;<input type="radio" value="男" name="sex" <%if(Student.getSex().equals("男")) out.println("checked");%>>男&nbsp;<input type="radio" value="女" name="sex" <%if(Student.getSex().equals("女")) out.println("checked");%>>女&nbsp;</td>
		<td width="20%" height="41" align="right">培训&nbsp;日期：</td>
		<td width="37%" height="41" align="left">&nbsp;&nbsp;<input name="train_date" type="text" class="input1" id="train_date" value="<%=Student.getT_date()%>">例如：1988-09-20</td>
	
	</tr>
	<tr>
		<td width="13%" height="39" align="right">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
	<td width="30%" height="39" align="left">&nbsp;&nbsp;<input name="grade" type="text" class="input1" id="grade" value="<%=Student.getGrade()%>"></td>
		<td width="20%" height="48" align="right">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
		<td width="37%" height="48" align="left">&nbsp;&nbsp;<input name="class_name" type="text" class="input1" value="<%=Student.getClass_name()%>"></td>
		
	</tr>
	<tr>
	  <td height="48" align="right">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</td>
	  <td height="48" align="left">&nbsp;&nbsp;<input name="school" type="text" class="input3" id="School" value="<%=Student.getSchool()%>"></td>
	  <td width="20%" height="39" align="right">是否&nbsp;回族：</td>
		<td width="37%" height="39" align="left">&nbsp;&nbsp;<input type="radio" value="0" name="hui_flag" <%if(Student.getHui().equals("0")) out.println("checked");%>>是&nbsp;<input type="radio" value="1" name="hui_flag" <%if(Student.getHui().equals("1")) out.println("checked");%>>否</td>
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
