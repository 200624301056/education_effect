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
		<td height="25" colspan="4" align="center"><h1 style="color:#0F3; font-size:14px">�޸�ѧ����Ϣ</h1>
	    <p style="color: #F00; font-size:12px">����ѡ���Ϊ�������������д������д������ɾ��������Ϣ��������ӣ�</p></td>
	  </tr>
	<tr>
		<td width="13%" height="41" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</td>
		<td width="30%" height="41" align="left">&nbsp;&nbsp;<input name="stu_name" type="text" class="input1" id="SUname" value="<%=Student.getSUname()%>"></td>
		<td width="20%" height="41" align="right">ѧԱ&nbsp;��ţ�</td>
		<td width="37%" height="41" align="left">&nbsp;&nbsp;<input name="stu_num" type="text" class="input1" id="stu_num" value="<%=Student.getStu_num()%>">���磺1988-09-20</td>
		
		</tr>
	<tr>
		<td width="13%" height="48" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
		<td width="30%" height="48" align="left">&nbsp;&nbsp;<input type="radio" value="��" name="sex" <%if(Student.getSex().equals("��")) out.println("checked");%>>��&nbsp;<input type="radio" value="Ů" name="sex" <%if(Student.getSex().equals("Ů")) out.println("checked");%>>Ů&nbsp;</td>
		<td width="20%" height="41" align="right">��ѵ&nbsp;���ڣ�</td>
		<td width="37%" height="41" align="left">&nbsp;&nbsp;<input name="train_date" type="text" class="input1" id="train_date" value="<%=Student.getT_date()%>">���磺1988-09-20</td>
	
	</tr>
	<tr>
		<td width="13%" height="39" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</td>
	<td width="30%" height="39" align="left">&nbsp;&nbsp;<input name="grade" type="text" class="input1" id="grade" value="<%=Student.getGrade()%>"></td>
		<td width="20%" height="48" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</td>
		<td width="37%" height="48" align="left">&nbsp;&nbsp;<input name="class_name" type="text" class="input1" value="<%=Student.getClass_name()%>"></td>
		
	</tr>
	<tr>
	  <td height="48" align="right">ѧ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;У��</td>
	  <td height="48" align="left">&nbsp;&nbsp;<input name="school" type="text" class="input3" id="School" value="<%=Student.getSchool()%>"></td>
	  <td width="20%" height="39" align="right">�Ƿ�&nbsp;���壺</td>
		<td width="37%" height="39" align="left">&nbsp;&nbsp;<input type="radio" value="0" name="hui_flag" <%if(Student.getHui().equals("0")) out.println("checked");%>>��&nbsp;<input type="radio" value="1" name="hui_flag" <%if(Student.getHui().equals("1")) out.println("checked");%>>��</td>
	  </tr>
	<tr>
	  <td height="39" colspan="4" align="center"><p>��дע�����</p>
	
	    <p>����Ѿ�ȷ����Ϣ��ȷ������&ldquo;���&rdquo;��ť����������&ldquo;���&rdquo;��ť�ػ�������д</p></td>
	  </tr>

	</table>
	<p>
	<input name="sub" type="submit" class="input2" value="�޸�">&nbsp;&nbsp;
	<input name="res" type="reset" class="input2" value="���">&nbsp;&nbsp;
     <input type="button" name="btn2" value="����" onClick="window.history.go(-1)" class="input2">
	</p>
	</form>
	</div>
	</body>
</html>
