<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<jsp:useBean scope="page" id="General" class="com.bar.db.General" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String sstu_num = request.getParameter("stu_num");
		String sterm = request.getParameter("term");
		General.setStu_num(sstu_num);
		General.setTerm(sterm);
		if(General.exist())
		{
			out.println("<p>��&nbsp;<font color=red>"+sterm+"</font>&nbsp;ѧ�ڵ�ѧ��&nbsp;<font color=red>"+sstu_num+"</font>&nbsp;�ɼ���Ϣ�Ѿ����ڣ�</p>");
			out.println("<input type=button name=btn1 value=���� onClick='window.history.go(-1)'>");
		}
		else
		{
			String stu_name = request.getParameter("stu_name");
			String score_gen = request.getParameter("score_gen");
			String score_sj = request.getParameter("score_sj");			
			String school = request.getParameter("school");				
			String grade = request.getParameter("grade");			
			String class_name = request.getParameter("class_name");	

			General.setSUname(stu_name);
			General.setStu_num(sstu_num);
			General.setScore_gen(score_gen);
			General.setScore_sj(score_sj);
			General.setSchool(school);
			General.setGrade(grade);	
			General.setClass_name(class_name);
			General.setTerm(sterm);
			
			if(General.addGCor())
			{
				out.println("<p><font color=blue>���ѧ����Ϣ�ɹ�</font></p>");
				out.println("<a href='./add_general_score.jsp' target='_self'><font color=blue>�������</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>���ѧ��Ϣʧ�ܣ����Ժ�����</font></p>");
				out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
			}
		} 
%>
</div>
</body>
</html>
