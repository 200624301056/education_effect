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
		<jsp:useBean scope="page" id="Teacher" class="com.bar.db.Teacher" />

	</head>

	<body bgcolor="#F2F2F2">
	<div align=center>
	<%
	String strPage = request.getParameter("showPage");

	//��ȡ��Ҫɾ����ѧ����Ϣ��������
	String[] sTeaID = request.getParameterValues("DeleteID");
		
	String sDeleteUserID = "0";
	if (sTeaID != null)
	{
		for(int i=0;i<sTeaID.length;i++)
		{
			sDeleteUserID = sDeleteUserID +"," + sTeaID[i];	
		}		
	}	
		//ɾ��ѡ�е�Ա����Ϣ
		if(Teacher.delete(sDeleteUserID))
		{
			out.println("<p><font color=blue>��ʦ��Ϣɾ���ɹ�</font></p>");
			out.println("<p><a href=\"admin_teacher.jsp?showPage="+strPage+"\" target=\"_self\"><font color=blue>���ؽ�ʦ��Ϣ����</font></a></p>");
		}
		else
		{	
			out.println("<p><font color=red>��ʦ��Ϣɾ��ʧ�ܣ�������</font></p>");
			out.println("<input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
		}
	%>
	</div>
	</body>
</html>
