<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

	<jsp:useBean scope="page" id="Score" class="com.bar.db.Score" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String sstu_num = request.getParameter("stu_num");
		String sterm = request.getParameter("term");
		//Student.setStuid(sstuid);
		//long lsstu_num = Long.parseLong(sstu_num);
		Score.setStu_num(sstu_num);
		Score.setTerm(sterm);
		if(Score.exist())
		{
			out.println("<p>第&nbsp;<font color=red>"+sterm+"</font>&nbsp;学期的学生&nbsp;<font color=red>"+sstu_num+"</font>&nbsp;成绩信息已经存在！</p>");
			out.println("<input type=button name=btn1 value=返回 onClick='window.history.go(-1)'>");
		}
		else
		{
			String stu_name = request.getParameter("stu_name");
			//String stu_num = request.getParameter("stu_num");
			String Score_fis = request.getParameter("Score_fis");
			String Score_sec = request.getParameter("Score_sec");
			String Score_thr = request.getParameter("Score_thr");
			String Score_fou = request.getParameter("Score_fou");
			String Score_fiv = request.getParameter("Score_fiv");
			String Score_six = request.getParameter("Score_six");
			String Score_sev = request.getParameter("Score_sev");
			String Score_eig = request.getParameter("Score_eig");			
			String school = request.getParameter("school");				
			String grade = request.getParameter("grade");			
			String class_name = request.getParameter("class_name");	
			//String term = request.getParameter("term");
			//System.out.println(stu_name+stu_num+sex+train_date+grade+class_name+school+hui_flag);
			//long llstuid = Long.parseLong(sstuid);
			Score.setSUname(stu_name);
			Score.setStu_num(sstu_num);
			Score.setScore_fis(Score_fis);
			Score.setScore_sec(Score_sec);
			Score.setScore_thr(Score_thr);
			Score.setScore_fou(Score_fou);
			Score.setScore_fiv(Score_fiv);
			Score.setScore_six(Score_six);
			Score.setScore_sev(Score_sev);
			Score.setScore_eig(Score_eig);
			Score.setSchool(school);
			Score.setGrade(grade);	
			Score.setClass_name(class_name);
			Score.setTerm(sterm);
			
			if(Score.addsco())
			{
				out.println("<p><font color=blue>添加学生信息成功</font></p>");
				out.println("<a href='./add_practice_score.jsp' target='_self'><font color=blue>继续添加</font></a>");
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
