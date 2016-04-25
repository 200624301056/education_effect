<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <jsp:useBean scope="page" id="Teacher" class="com.bar.db.Teacher" />

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
		String tea_num = request.getParameter("Teaid");
		//long tea_num = Long.parseLong(tTeaid);
		String xueke = "";
		Teacher.setTea_num(tea_num);
		Teacher.init();
		
		//float Money = User.getMoney();
		
	%>
    
    
	<div align="center">
	<form name="form1" method="post" action="updata_tea_save.jsp" target="_self">
    	<input type="hidden" name="tea_num" value="<%=tea_num%>">
		<input type="hidden" name="showPage" value="<%=strPage%>">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<td height="25" colspan="4" align="center"><h1 style="color:#0F3; font-size:14px">修改教师信息</h1>
	      <p style="color: #F00; font-size:12px">以下选项均为必填项，请认真填写，若填写错误，请删除错误信息后重新添加！</p></td>
	  </tr>
	<tr>
		<td width="13%" height="41" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
		<td width="30%" height="41" align="left">&nbsp;&nbsp;<input name="tea_name" type="text" class="input1" id="SUname" value="<%=Teacher.getT_name()%>"></td>
		<td width="20%" height="41" align="right">教师&nbsp;编号：</td>
		<td width="37%" height="41" align="left">&nbsp;&nbsp;<%=Teacher.getTea_num()%></td>
		
		</tr>
	<tr>
		<td width="13%" height="48" align="right">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
		<td width="30%" height="48" align="left">&nbsp;&nbsp;<input type="radio" value="男" name="tea_sex" <%if(Teacher.getT_sex().equals("男")) out.println("checked");%>>男&nbsp;<input type="radio" value="女" name="tea_sex" <%if(Teacher.getT_sex().equals("女")) out.println("checked");%>>女&nbsp;</td>
		<td width="20%" height="41" align="right">电话&nbsp;号码：</td>
		<td width="37%" height="41" align="left">&nbsp;&nbsp;<input name="tel" type="text" class="input1" id="tel" value="<%=Teacher.getT_tel()%>"></td>
	
	</tr>
	<tr>
		<td width="13%" height="39" align="right">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
	    <td width="30%" height="39" align="left">&nbsp;&nbsp;<input name="tea_age" type="text" class="input1" id="tea_age" value="<%=Teacher.getTea_age()%>"></td>
		<td width="20%" height="48" align="right">任教&nbsp;学科：</td>
		<td width="37%" height="48" align="left">&nbsp;&nbsp;		 
		 <select name="tea_xueke">
		      <%
		      xueke=Teacher.getTea_xueke();
				ResultSet rss=Teacher.show_xueke(xueke);
				if (rss.next()){
	%>
		    <option value="<%=xueke%>"><%=rss.getString(1)%></option>
		    <% } 
			ResultSet rsc = Teacher.show_xueke();
			while(rsc.next()){
			%>
			 <option value="<%=rsc.getString(1)%>"><%=rsc.getString(2)%></option>
			<%
			}%>
	      </select></td>
		
	</tr>
	<tr>
	  <td height="48" align="right">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
	  <td height="48" align="left">&nbsp;&nbsp;<input name="tea_zhicheng" type="text" class="input3" id="tea_zhicheng" value="<%=Teacher.getTea_zhicheng()%>"></td>
	  <td width="20%" height="39" align="right">&nbsp;</td>
		<td width="37%" height="39" align="left">&nbsp;&nbsp;

	    </td>
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
