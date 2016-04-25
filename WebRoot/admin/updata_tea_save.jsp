<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>

	<jsp:useBean scope="page" id="Teacher" class="com.bar.db.Teacher" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		String stea_num = request.getParameter("tea_num");		
		Teacher.setTea_num(stea_num);
		Teacher.init();	

			String tea_name = request.getParameter("tea_name");
		//	String tea_num = request.getParameter("tea_num");		
			String tea_sex = request.getParameter("tea_sex");			
			String tel = request.getParameter("tel");
			String tea_age = request.getParameter("tea_age");
			String tea_zhicheng = request.getParameter("tea_zhicheng");
			String tea_xueke = request.getParameter("tea_xueke");
			//System.out.println(tea_name+tea_sex+tel+tea_age+tea_zhicheng+tea_xueke);
			
			//Teacher.setTea_num(tea_num);
			Teacher.setT_name(tea_name);
			Teacher.setT_sex(tea_sex);
			Teacher.setT_tel(tel);
			Teacher.setTea_age(tea_age);
			Teacher.setTea_zhicheng(tea_zhicheng);
			Teacher.setTea_xueke(tea_xueke);
			
			if(Teacher.modify_tea_info())
			{
				out.println("<p><font color=blue>修改教师信息成功</font></p>");
				out.println("<P><a href='./admin_teacher.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回学生信息管理</font></a></p>");
			}
			else
			{
				out.println("<p><font color=#0000FF>修改教师信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
%>
</div>
</body>
</html>
