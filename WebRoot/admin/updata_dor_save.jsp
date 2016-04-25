<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body{margin-top:50px; text-align:center; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color:#CCC}

</style>

	<jsp:useBean scope="page" id="Dormitory" class="com.bar.db.Dormitory" />
</head>
<body bgcolor="#F2F2F2">
<div align="center">
<%
		request.setCharacterEncoding("gb2312");
	    String strPage = request.getParameter("showPage");
		
		String sDorid = request.getParameter("Dorid");
		long lDorid = Long.parseLong(sDorid);
		Dormitory.setDorid(lDorid);
		Dormitory.init();	

			String dor_num = request.getParameter("dor_num");
			String dor_floor = request.getParameter("dor_floor");
			String dor_bulid = request.getParameter("dor_bulid");
			String admin = request.getParameter("admin");		
			
			Dormitory.setDor_num(dor_num);
			Dormitory.setDor_floor(dor_floor);
			Dormitory.setDor_bulid(dor_bulid);
			Dormitory.setAdmin(admin);
			
			if(Dormitory.modify_dor_info())
			{
				out.println("<p><font color=blue>修改宿舍信息成功</font></p>");
				out.println("<P><a href='./admin_dormitory.jsp?showPage="+strPage+"' target='_self'><font color=blue>返回宿舍信息管理</font></a></p>");
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
