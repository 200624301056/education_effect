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


	<jsp:useBean scope="page" id="Dormitory" class="com.bar.db.Dormitory" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String dor_num = request.getParameter("dor_num");
		//Student.setStuid(sstuid);
		//long lddor_num = Long.parseLong(ddor_num);
		//User.setUname(sUserName);
		Dormitory.setDor_num(dor_num);
		
		if(Dormitory.exist())
		{
			out.println("<p>����&nbsp;<font color=red>"+dor_num+"</font>&nbsp;�Ѿ����ڣ�</p>");
			out.println("<input type=button name=btn1 value=���� onClick='window.history.go(-1)'>");
		}
		else
		{
			//String stu_name = request.getParameter("dor_num");	
	//		String sPwd = oMD5.getMD5ofStr(request.getParameter("PWD"));
			
			String dor_floor = request.getParameter("dor_floor");			
			String dor_bulid = request.getParameter("dor_bulid");
			String admin = request.getParameter("admin");			
			
			//long llstuid = Long.parseLong(sstuid);
			Dormitory.setDor_floor(dor_floor);
			Dormitory.setDor_bulid(dor_bulid);
			Dormitory.setAdmin(admin);
			
			if(Dormitory.addDor())
			{
				out.println("<p><font color=blue>���������Ϣ�ɹ�</font></p>");
				out.println("<a href='./add_dormitory.jsp' target='_self'><font color=blue>�������</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>�������Ϣʧ�ܣ����Ժ�����</font></p>");
				out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
			}
		} 
%>
</div>
</body>
</html>
