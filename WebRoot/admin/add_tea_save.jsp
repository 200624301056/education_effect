<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('请先登录！');window.location.href='../index.jsp'</script>");
	 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


	<jsp:useBean scope="page" id="Teacher" class="com.bar.db.Teacher" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
		String stea_num = request.getParameter("tea_num");
		Teacher.setTea_num(stea_num);
		
		if(Teacher.exist())
		{
			out.println("<p>用户名&nbsp;<font color=red>"+stea_num+"</font>&nbsp;已经存在！</p>");
			out.println("<input type=button name=btn1 value=返回 onClick='window.history.go(-1)'>");
		}
		else
		{
			String tea_name = request.getParameter("tea_name");
			String tea_num = request.getParameter("tea_num");		
			String tea_sex = request.getParameter("tea_sex");			
			String tel = request.getParameter("tel");
			String tea_age = request.getParameter("age");
			String tea_zhicheng = request.getParameter("zhicheng");
			String tea_xueke = request.getParameter("xueke");
			
			//long llstuid = Long.parseLong(sstuid);
			Teacher.setTea_num(tea_num);
			Teacher.setT_name(tea_name);
			Teacher.setT_sex(tea_sex);
			Teacher.setT_tel(tel);
			Teacher.setTea_age(tea_age);
			Teacher.setTea_zhicheng(tea_zhicheng);
			Teacher.setTea_xueke(tea_xueke);
			
		if(Teacher.addtea())
			{
				out.println("<p><font color=blue>添加教师信息成功</font></p>");
				out.println("<a href='./add_teacher.jsp' target='_self'><font color=blue>继续添加</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>添加教师息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
		} 
%>
</div>
</body>
</html>
