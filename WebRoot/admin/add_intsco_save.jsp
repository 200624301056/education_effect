<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<jsp:useBean scope="page" id="Integrate" class="com.bar.db.Integrate" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String sstu_num = request.getParameter("stu_num");
		String sterm = request.getParameter("term");
		//Student.setStuid(sstuid);
		//long lsstu_num = Long.parseLong(sstu_num);
		Integrate.setStu_num(sstu_num);
		Integrate.setTerm(sterm);
		if(Integrate.exist())
		{
			out.println("<p>��&nbsp;<font color=red>"+sterm+"</font>&nbsp;ѧ�ڵ�ѧ��&nbsp;<font color=red>"+sstu_num+"</font>&nbsp;�ɼ���Ϣ�Ѿ����ڣ�</p>");
			out.println("<input type=button name=btn1 value=���� onClick='window.history.go(-1)'>");
		}
		else
		{
			String stu_name = request.getParameter("stu_name");
			//String stu_num = request.getParameter("stu_num");
			String Score_fis = request.getParameter("Score_fis");
			String Score_sec = request.getParameter("Score_sec");
			String Score_thr = request.getParameter("Score_thr");
			String Score_fou = request.getParameter("Score_fou");			
			String school = request.getParameter("school");				
			String grade = request.getParameter("grade");			
			String class_name = request.getParameter("class_name");	
			String term = request.getParameter("term");
			System.out.println(stu_name+Score_fis+Score_sec+Score_thr+Score_fou+grade+class_name+school+term);
			//long llstuid = Long.parseLong(sstuid);
			Integrate.setSUname(stu_name);
			Integrate.setStu_num(sstu_num);
			Integrate.setScore_fir(Score_fis);
			Integrate.setScore_sec(Score_sec);
			Integrate.setScore_thr(Score_thr);
			Integrate.setScore_fou(Score_fou);
			Integrate.setSchool(school);
			Integrate.setGrade(grade);	
			Integrate.setClass_name(class_name);
			Integrate.setTerm(sterm);
			
			if(Integrate.addIntsco())
			{
				out.println("<p><font color=blue>���ѧ���ۺ����ʳɼ���Ϣ�ɹ�</font></p>");
				out.println("<a href='./add_integrate_score.jsp' target='_self'><font color=blue>�������</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>���ѧ���ۺ����ʳɼ�Ϣʧ�ܣ����Ժ�����</font></p>");
				out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
			}
		} 
%>
</div>
</body>
</html>
