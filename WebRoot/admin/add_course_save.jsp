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


	<jsp:useBean scope="page" id="Course" class="com.bar.db.Course" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String course_num = request.getParameter("course_num");
		Course.setCourse_num(course_num);
		
		if(Course.exist())
		{
			out.println("<p>����&nbsp;<font color=red>"+course_num+"</font>&nbsp;�Ѿ����ڣ�</p>");
			out.println("<input type=button name=btn1 value=���� onClick='window.history.go(-1)'>");
		}
		else
		{
			//String stu_name = request.getParameter("dor_num");	
	//		String sPwd = oMD5.getMD5ofStr(request.getParameter("PWD"));
			
			String course_name = request.getParameter("course_name");			
			String course_score = request.getParameter("course_score");			
			String course_type = request.getParameter("course_type");	
			//long llstuid = Long.parseLong(sstuid);
			Course.setCourse_name(course_name);
			Course.setCourse_score(course_score);
			Course.setCourse_type(course_type);
			
			if(Course.addCor())
			{
				out.println("<p><font color=blue>��ӿγ���Ϣ�ɹ�</font></p>");
				out.println("<a href='./add_course.jsp' target='_self'><font color=blue>�������</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>��ӿγ�Ϣʧ�ܣ����Ժ�����</font></p>");
				out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
			}
		} 
%>
</div>
</body>
</html>
