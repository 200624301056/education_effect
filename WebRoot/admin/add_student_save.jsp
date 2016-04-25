<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


	<jsp:useBean scope="page" id="Student" class="com.bar.db.Student" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String sstu_num = request.getParameter("stu_num");
		//Student.setStuid(sstuid);
		long lsstu_num = Long.parseLong(sstu_num);
		Student.setStuid(lsstu_num);
		
		if(Student.exist())
		{
			out.println("<p>用户名&nbsp;<font color=red>"+sstu_num+"</font>&nbsp;已经存在！</p>");
			out.println("<input type=button name=btn1 value=返回 onClick='window.history.go(-1)'>");
		}
		else
		{
			String stu_name = request.getParameter("stu_name");
			String stu_num = request.getParameter("stu_num");	
	//		String sPwd = oMD5.getMD5ofStr(request.getParameter("PWD"));
			
			String sex = request.getParameter("sex");			
			String train_date = request.getParameter("train_date");
			String grade = request.getParameter("grade");			
			String class_name = request.getParameter("class_name");
			String school = request.getParameter("school");
			String hui_flag = request.getParameter("hui_flag");
			//System.out.println(stu_name+stu_num+sex+train_date+grade+class_name+school+hui_flag);
			//long llstuid = Long.parseLong(sstuid);
			Student.setStu_num(stu_num);
			Student.setSUname(stu_name);
			Student.setSex(sex);
			Student.setT_date(train_date);
			Student.setClass_name(class_name);
			Student.setGrade(grade);
			Student.setSchool(school);
			Student.setHui(hui_flag);
			
			if(Student.addstu())
			{
				out.println("<p><font color=blue>添加学生信息成功</font></p>");
				out.println("<a href='./add_student.jsp' target='_self'><font color=blue>继续添加</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>添加学生息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
		} 
%>
</div>
</body>
</html>
