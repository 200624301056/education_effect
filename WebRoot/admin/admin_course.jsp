<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('���ȵ�¼��');window.location.href='../index.jsp'</script>");
	 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Course" class="com.bar.db.Course" />
		<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage_stu" />
         <style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		td{border-right:1px #999 dashed; border-bottom:1px #999 dashed;}
		.input1{width:120px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		.input2{width:80px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		</style>
	</head>
	<%

	//��ȡ����ѧԱ��Ϣ
	ResultSet rs = Course.show_cor();
	//��ʼ����ҳ��ʾ��
	pages.initialize(rs,25);
	String strPage=null;
	int showPage = 1;
	//��ȡ��ת����Ŀ��ҳ��
	strPage=request.getParameter("showPage");
	if (strPage==null)
	{
		showPage=1;
	}
	else
	{
		try
		{
			showPage=Integer.parseInt(strPage);
		}
		catch(NumberFormatException e)
		{
			showPage = 1;
		}
		if(showPage<1) 
		{
			showPage=1;
		}
		if(showPage>pages.getPageCount()) 
		{
			showPage=pages.getPageCount();
		}
	}	
	//��ȡҪ��ʾ�����ݼ���
	Vector vData=pages.getPage(showPage);	
%>
	<body bgcolor="#F2F2F2">
		<div align="center">
		<form name="form1" method="post" action="delete_cor.jsp" target="_self">
		<input type="hidden" name="showPage" value="<%=showPage%>">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
			<tr bgcolor="#CC99FF">
			<th width="5%" height="30" align="center">ѡ��</th>
			<th width="5%" height="30" align="center">���</th>
			<th width="20%" height="30" align="center">�γ̱��</th>
			<th width="25%" align="center">�γ�����</th>
			<th width="15%" height="30" >�γ��ܷ���</th>
			<th width="20%" height="30" >�γ�����</th>
			<th width="10%" height="30" align="center">�޸�</th>
			</tr>
		<%			
			//ѭ����ʾ��ǰҳ��ѧԱ��Ϣ
			for(int i=0;i<vData.size();i++)
			{ 
				//��ʾ����
				String[] sData=(String[])vData.get(i);
		%>
				<tr>
				<td width="2%" height="25" align="center">&nbsp;<input type="checkbox" name="DeleteID" value="<%=sData[0]%>"></td>
				<td width="8%" height="25" align="center"><%=sData[0]%></td>
			    <td width="4%" height="25" align="center"><font color="#0000FF"><%=sData[1]%></font></td>
			    <td width="3%" height="25" align="center"><%=sData[2]%></td>
			    <td width="6%" height="25" align="center"><%=sData[3]%></td>
			    <td width="6%" height="25" align="center"><%=sData[4]%></td>
                <td width="5%" height="25" align="center">&nbsp;<a href="updata_cor_form.jsp?Corid=<%=sData[0]%>&showPage=<%=showPage%>" target="_self"><font color="#0000FF">�޸�</font></a></td>
				</tr>
		<%
				
			}
		%>
		</table>
		<p><input name="sub" type="submit" class="input1" value="ɾ��ѡ�еĿγ�">
		&nbsp;&nbsp;
		<input name="btn" type="button" class="input1" onClick="javascript:window.location='add_course.jsp'" value="����¿γ�">
		</p>
		</form>
		<p>
		<form action="admin_course.jsp" method="post" target="_self">	
			��<font color="#FF0000"><%=showPage%></font>ҳ/��<font color=red><%=pages.getPageCount()%></font>ҳ&nbsp;
			<a href="admin_course.jsp?showPage=1" target="_self"><font color="#0000FF">[��ҳ]</font></a>&nbsp;			
			<%
				//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
				if(showPage > 1)
				{				
			%>
					<a href="admin_course.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
  <%
				}
				else
				{
					out.println("[��һҳ]&nbsp;");
				}
				//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
				if(showPage < pages.getPageCount())
				{				
			%>
					<a href="admin_course.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[��һҳ]&nbsp;");
				}
			%> 
			<a href="admin_course.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[βҳ]</font> </a>&nbsp;
			ת��
			<select name="showPage">
			<%
				for(int x=1;x<=pages.getPageCount();x++)
				{
			%>
					<option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
			<%
				}
			%>
			</select>
			ҳ&nbsp;
	      <input name="go" type="submit" class="input2" value="�ύ"/>
		</form>
		</p>
		<%//rs.close();%>
	</div>
	</body>
</html>
