<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>
<jsp:useBean scope="page" id="Integrate" class="com.bar.db.Integrate" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		
		String sstuid = request.getParameter("stuid");
		long lstuid = Long.parseLong(sstuid);
		Integrate.setStuid(lstuid);
		Integrate.init();	

			String stu_name = request.getParameter("stu_name");
			String stu_num = request.getParameter("stu_num");
			String Score_fis = request.getParameter("Score_fis");
			String Score_sec = request.getParameter("Score_sec");
			String Score_thr = request.getParameter("Score_thr");
			String Score_fou = request.getParameter("Score_fou");		
			String school = request.getParameter("school");				
			String grade = request.getParameter("grade");			
			String class_name = request.getParameter("class_name");	
			String term = request.getParameter("term");
		//System.out.println(stu_name+stu_num+sex+train_date+class_name+grade+school+hui_flag+sstuid);
			
			Integrate.setSUname(stu_name);
			Integrate.setStu_num(stu_num);
			Integrate.setScore_fir(Score_fis);
			Integrate.setScore_sec(Score_sec);
			Integrate.setScore_thr(Score_thr);
			Integrate.setScore_fou(Score_fou);
			Integrate.setSchool(school);
			Integrate.setGrade(grade);	
			Integrate.setClass_name(class_name);
			Integrate.setTerm(term);
	
			if(Integrate.modify_Intsco_info())
			{
				out.println("<p><font color=blue>修改综合素质成绩信息成功</font></p>");
				out.println("<P><a href='./admin_integrate_score.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回综合素质成绩信息管理</font></a></p>");
			}
			else
			{
				out.println("<p><font color=#0000FF>修改综合素质成绩信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
%>
</div>
</body>
</html>
