<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('���ȵ�¼��');window.location.href='../index.jsp'</script>");
	 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>��ӭ������ҵ�칫ƽ̨</title>
	<style type="text/css">
	body{margin:0 auto; padding-top:10px; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
	.input1{width:250px; height:20px;}
	.input2{ width:80px; height:20px; border: 1px #999 dashed; background-color:#333; color:#fff}
	.input3{width:300px; height:20px;}
	</style>
	</head>
	<body bgcolor="#F2F2F2">
	<div align="center">
	<form name="form1" method="post" action="add_course_save.jsp" target="_self">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<td height="25" colspan="4" align="center"><h1 style="color:#0F3; font-size:14px">�����¿γ���Ϣ</h1>
	      <p style="color: #F00; font-size:12px">����ѡ���Ϊ�������������д������д������ɾ��������Ϣ���������ӣ�</p></td>
	  </tr>
	<tr>
		<td width="13%"height="41" align="right">�γ̱�ţ�</td>
		<td width="30%"height="41" align="left">&nbsp;&nbsp;<input name="course_num" type="text" class="input1" id="Name" size="20"></td>
		<td width="20%"height="41" align="right">�γ����ƣ�</td>
		<td width="37%"height="41" align="left">&nbsp;&nbsp;<input name="course_name" type="text" class="input1" id="Birth" size="20"></td>
	</tr>
		<td width="13%"height="39" align="right">�γ̷�����</td>
		<td width="30%"height="39" align="left">&nbsp;&nbsp;<input name="course_score" type="text" class="input1" id="Tel" size="20"></td>
		<td width="20%"height="48" align="right">�γ�����:		  </td>
		<td width="37%"height="48" align="left">&nbsp;&nbsp;
		  <select name="course_type">
            <option value="ͨ�ü���">ͨ�ü���</option>
            <option value="�ۺ�ʵ��">�ۺ�ʵ��</option>
          </select></td>
	</tr>
	<tr>
	  <td height="39" colspan="4" align="center"><p>��дע�����</p>
	    <p>����Ѿ�ȷ����Ϣ��ȷ������&ldquo;����&rdquo;��ť����������&ldquo;���&rdquo;��ť�ػ�������д</p></td>
	  </tr>
	</table>
	<p>
	<input name="sub" type="submit" class="input2" value="����">&nbsp;&nbsp;
	<input name="res" type="reset" class="input2" value="���">&nbsp;&nbsp;
    <input type="button" name="btn2" value="����" onClick="window.history.go(-1)" class="input2">
	</p>
	</form>
	</div>
	</body>
</html>