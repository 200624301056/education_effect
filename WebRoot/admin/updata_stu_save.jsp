<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>

	<jsp:useBean scope="page" id="Student" class="com.bar.db.Student" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		
		String sstuid = request.getParameter("stuid");
		long lstuid = Long.parseLong(sstuid);
		Student.setStuid(lstuid);
		Student.init();	

			String stu_name = request.getParameter("stu_name");
			String stu_num = request.getParameter("stu_num");
			String sex = request.getParameter("sex");
			String train_date = request.getParameter("train_date");
			String class_name = request.getParameter("class_name");		
			String grade = request.getParameter("grade");
			String school = request.getParameter("school");
			String hui_flag = request.getParameter("hui_flag");
		//	String sMoney = request.getParameter("Money");
	//		float Money =  Float.parseFloat(sMoney);
			//System.out.println(stu_name+stu_num+sex+train_date+class_name+grade+school+hui_flag+sstuid);
			
			Student.setSUname(stu_name);
			Student.setStu_num(stu_num);
			Student.setSex(sex);
			Student.setT_date(train_date);
			Student.setClass_name(class_name);
			Student.setGrade(grade);
			Student.setSchool(school);
			Student.setHui(hui_flag);
	//		User.setMoney(Money);
			//Student.modify_info();
			if(Student.modify_stu_info())
			{
				out.println("<p><font color=blue>修改学生信息成功</font></p>");
				out.println("<P><a href='./admin_students.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回学生信息管理</font></a></p>");
			}
			else
			{
				out.println("<p><font color=#0000FF>修改学生信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
%>
</div>
</body>
</html>
