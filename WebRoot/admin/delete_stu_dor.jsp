<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('���ȵ�¼��');window.location.href='../index.jsp'</script>");
	 
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������ҵ�칫ƽ̨</title>
		<jsp:useBean scope="page" id="Dormitory" class="com.bar.db.Dormitory" />

	</head>

	<body bgcolor="#F2F2F2">
	<div align=center>
	<%
		String strPage = request.getParameter("showPage");
	//��ȡ��Ҫɾ����Ա����Ϣ��������
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
			
			if( Dormitory.deletedis(stuid)&& Dormitory.upDorflagm(dor_name))		//����stuidɾ�����������Ϣ&&������������������������Ϣ����һ��
			{
			 out.println("<font color=blue>"+dor_name+"���������Ϣɾ���ɹ�</font>");
			}
			else
			{
				out.println("<p><font color=red>���������Ϣɾ��ʧ�ܣ�������</font></p>");
				out.println("<input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\">");
			}
		}			
out.println("<p><a href=\"admin_stu_dis.jsp?showPage="+strPage+"\" target=\"_self\"><font color=blue>�������������Ϣ����</font></a></p>");
			
	}
		
	%>
	</div>
	</body>
</html>
