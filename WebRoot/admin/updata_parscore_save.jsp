<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>

	<jsp:useBean scope="page" id="Score" class="com.bar.db.Score" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		
		String sstuid = request.getParameter("stuid");
		long lstuid = Long.parseLong(sstuid);
		Score.setStuid(lstuid);
		Score.init();	

			String stu_name = request.getParameter("stu_name");
			String stu_num = request.getParameter("stu_num");
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
			String term = request.getParameter("term");
		//System.out.println(stu_name+stu_num+sex+train_date+class_name+grade+school+hui_flag+sstuid);
			
			Score.setSUname(stu_name);
			Score.setStu_num(stu_num);
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
			Score.setTerm(term);
	
			if(Score.modify_sco_info())
			{
				out.println("<p><font color=blue>修改实践活动课程分数信息成功</font></p>");
				out.println("<P><a href='./admin_practice_score.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回实践活动课程分数信息管理</font></a></p>");
			}
			else
			{
				out.println("<p><font color=#0000FF>修改实践活动课程分数信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
%>
</div>
</body>
</html>
