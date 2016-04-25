<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>

	<jsp:useBean scope="page" id="Course" class="com.bar.db.Course" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		
		String sCorid = request.getParameter("Corid");
		long lCorid = Long.parseLong(sCorid);
		Course.setCouid(lCorid);
		Course.init();	

			String course_num = request.getParameter("Course_num");
			String course_name = request.getParameter("Course_name");
			String course_score = request.getParameter("Course_score");	
			String course_type = request.getParameter("Course_type");		
			
			Course.setCourse_num(course_num);
			Course.setCourse_name(course_name);
			Course.setCourse_score(course_score);
			Course.setCourse_type(course_type);

			
			if(Course.modify_cor_info())
			{
				out.println("<p><font color=blue>修改课程信息成功</font></p>");
				out.println("<P><a href='./admin_course.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回课程信息管理</font></a></p>");
			}
			else
			{
				out.println("<p><font color=#0000FF>修改宿舍信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
%>
</div>
</body>
</html>
