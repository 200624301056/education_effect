<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>

		<jsp:useBean scope="page" id="General" class="com.bar.db.General" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		
		String sstuid = request.getParameter("stuid");
		long lstuid = Long.parseLong(sstuid);
		General.setIdinspector_gen(lstuid);
		General.init();	

			String stu_name = request.getParameter("stu_name");
			String stu_num = request.getParameter("stu_num");
			String score_gen = request.getParameter("score_gen");
			String score_sj = request.getParameter("score_sj");			
			String school = request.getParameter("school");				
			String grade = request.getParameter("grade");			
			String class_name = request.getParameter("class_name");	
			String term = request.getParameter("term");
		//System.out.println(stu_name+stu_num+sex+train_date+class_name+grade+school+hui_flag+sstuid);
			
			General.setSUname(stu_name);
			General.setStu_num(stu_num);
			General.setScore_gen(score_gen);
			General.setScore_sj(score_sj);
			General.setSchool(school);
			General.setGrade(grade);	
			General.setClass_name(class_name);
			General.setTerm(term);
	
			if(General.modify_Gcor_info())
			{
				out.println("<p><font color=blue>修改通用技术成绩信息成功</font></p>");
				out.println("<P><a href='./admin_general_score.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回通用技术成绩信息管理</font></a></p>");
			}
			else
			{
				out.println("<p><font color=#0000FF>修改学生通用技术信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
%>
</div>
</body>
</html>
