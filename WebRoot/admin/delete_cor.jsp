<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('���ȵ�¼��');window.location.href='../index.jsp'</script>");
	 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������ҵ�칫ƽ̨</title>
		<jsp:useBean scope="page" id="Course" class="com.bar.db.Course" />

	</head>

	<body bgcolor="#F2F2F2">
	<div align=center>
	<%
	String strPage = request.getParameter("showPage");

	//��ȡ��Ҫɾ����Ա����Ϣ��������
	String[] sCorID = request.getParameterValues("DeleteID");	
	String sDeleteDorID = "0";
	if (sCorID != null)
	{
		for(int i=0;i<sCorID.length;i++)
		{
			sDeleteDorID = sDeleteDorID +"," + sCorID[i];	
		}		
	}	
		//ɾ��ѡ�е�Ա����Ϣ
		if(Course.delete(sDeleteDorID))
		{
			out.println("<p><font color=blue>�γ���Ϣɾ���ɹ�</font></p>");
			out.println("<p><a href=\"admin_course.jsp?showPage="+strPage+"\" target=\"_self\"><font color=blue>����ѧ��ʵ����γ̳ɼ���Ϣ����</font></a></p>");
		}
		else
		{
			out.println("<p><font color=red>�γ���Ϣɾ��ʧ�ܣ�������</font></p>");
			out.println("<input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
		}
	%>
	</div>
	</body>
</html>
