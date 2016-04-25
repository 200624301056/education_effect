<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('请先登录！');window.location.href='../index.jsp'</script>");
	 
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>欢迎光临企业办公平台</title>
		<jsp:useBean scope="page" id="Dormitory" class="com.bar.db.Dormitory" />

	</head>

	<body bgcolor="#F2F2F2">
	<div align=center>
	<%
		String strPage = request.getParameter("showPage");
	//获取所要删除的员工信息的索引号
	String [] sDorID = request.getParameterValues("DeleteID");
	


//	String sDeleteDorID = "0";
	if (sDorID != null)
	{
		for(int i=0;i<sDorID.length;i++)
			{
			 String id_dorname = sDorID[i];
			 String a[] = id_dorname.split(":");			
			 String stuid=a[0];
			 String dor_name=a[1];
			
			if( Dormitory.deletedis(stuid)&& Dormitory.upDorflagm(dor_name))		//根据stuid删除宿舍分配信息&&根据宿舍名更新宿舍人数信息（减一）
			{
			 out.println("<font color=blue>"+dor_name+"宿舍分配信息删除成功</font>");
			}
			else
			{
				out.println("<p><font color=red>宿舍分配信息删除失败，请重试</font></p>");
				out.println("<input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\">");
			}
		}			
out.println("<p><a href=\"admin_stu_dis.jsp?showPage="+strPage+"\" target=\"_self\"><font color=blue>返回宿舍分配信息管理</font></a></p>");
			
	}
		
	%>
	</div>
	</body>
</html>
