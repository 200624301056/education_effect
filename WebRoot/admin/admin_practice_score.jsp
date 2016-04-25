<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Score" class="com.bar.db.Score" />
		<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage_stu" />
         <style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		td{border-right:1px #999 dashed; border-bottom:1px #999 dashed;}
		.input1{width:130px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		.input2{width:80px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		</style>
	</head>
	<%
	request.setCharacterEncoding("gb2312");
	String school="";
	String grade="";
	String class_name="";
	String term="";
	String stu_name="";
	String stu_num="";
	 school=request.getParameter("school");
	 grade=request.getParameter("grade");
	 class_name=request.getParameter("class_name");
	 term=request.getParameter("term");
	 stu_name=request.getParameter("stu_name");
	 stu_num=request.getParameter("stu_num");
	//��ȡ����ѧԱ��Ϣ
	ResultSet rs = Score.show_score(school,grade,class_name,term,stu_name,stu_num);
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
		<form action="admin_practice_score.jsp" method="post" name="tiaojian"> 
		  ���������ң� 
		    &nbsp;&nbsp;
		  <select name="school">
            <option value="">--ѡ��ѧУ--</option>
            <option value="һ��">һ��</option>
            <option value="����">����</option>
            <option value="ʮ����">�׳�ʮ����</option>
          </select>&nbsp;&nbsp;
		  
		  <select name="grade">
            <option value="">--ѡ���꼶--</option>
            <option value="��һ">��һ</option>
            <option value="�߶�">�߶�</option>
          </select>&nbsp;&nbsp;
		  <select name="class_name">
            <option value="">--ѡ��༶--</option>
            <option value="1��">һ��</option>
            <option value="2��">����</option>
			<option value="3��">����</option>
			<option value="4��">�İ�</option>
			<option value="5��">���</option>
			<option value="6��">����</option>
			<option value="7��">�߰�</option>
          </select>&nbsp;&nbsp;
           <select name="term">
            <option value="">--ѡ��ѧ��--</option>
            <option value="1">��һѧ��</option>
            <option value="2">�ڶ�ѧ��</option>
			<option value="3">����ѧ��</option>
			<option value="4">����ѧ��</option>
          </select>&nbsp;&nbsp;������<input type="text" name="stu_name" >&nbsp;&nbsp;ѧ�ţ�<input type="text" name="stu_num" > &nbsp;&nbsp; <input type="Submit" name="Submit" value="�ύ">		 
		</form>
		<form name="form1" method="post" action="delete_prasco.jsp" target="_self">
		<input type="hidden" name="showPage" value="<%=showPage%>">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
			<tr>
				  <td height="25" colspan="16" align="center"><font size="3"><strong>�ۺ�ʵ���γ̳ɼ�����</strong></font></td>
		  </tr>
			<tr bgcolor="#CC99FF">
			<th width="5%" height="30" align="center">ѡ��</th>
			<th width="8%" height="30" align="center">ѧԱ���</th>
			<th width="5%" height="30" align="center">����</th>
			<th width="10%" align="center">CS���˶Կ�</th>
			<th width="5%" height="30" >����ϰ�</th>
			<th width="7%" height="30" align="center">���ߵ����</th>
			<th width="7%" align="center">����ŵ����</th>
			<th width="5%" align="center">ˮ������</th>
			<th width="5%" align="center">����</th>
			<th width="7%" align="center">�ҳ�������</th>
			<th width="6%" align="center">��ѵ�ɼ�</th>
			<th width="5%" align="center">ѧУ</th>
			<th width="5%" align="center">�꼶</th>
			<th width="5%" align="center">�༶</th>
			<th width="5%" align="center">ѧ��</th>
			<th width="8%" height="30" align="center">�޸�</th>
			</tr>
		<%			
			//ѭ����ʾ��ǰҳ��ѧԱ��Ϣ
			for(int i=0;i<vData.size();i++)
			{ 
				//��ʾ����
				String[] sData=(String[])vData.get(i);
		%>
				<tr>
				<td width="5%" height="25" align="center"><input type="checkbox" name="DeleteID" value="<%=sData[0]%>"></td>
				<td width="8%" height="25" align="center"><%=sData[1]%></td>
			    <td width="5%" height="25" align="center"><font color="#0000FF"><%=sData[2]%></font></td>
			    <td width="10%" height="25" align="center"><%=sData[3]%></td>
			    <td width="5%" height="25" align="center"><%=sData[4]%></td>
			    <td width="7%" align="center"><%=sData[5]%></td>
				<td width="7%" height="25" align="center"><%=sData[6]%></td>
			    <td width="5%" height="25" align="center"><%=sData[7]%></td>
			    <td width="5%" height="25" align="center"><%=sData[8]%></td>
				<td width="6%" height="25" align="center"><%=sData[9]%></td>
				<td width="5%" height="25" align="center"><%=sData[10]%></td>
			    <td width="5%" height="25" align="center"><%=sData[11]%></td>
			    <td width="5%" height="25" align="center"><%=sData[12]%></td>
				<td width="5%" height="25" align="center"><%=sData[13]%></td>
				<td width="5%" height="25" align="center"><%=sData[14]%></td>
                <td width="8%" height="25" align="center">&nbsp;<a href="updata_practice_score.jsp?Stuid=<%=sData[0]%>&showPage=<%=showPage%>" target="_self"><font color="#0000FF">�޸�</font></a></td>
				</tr>
				
		<%
				
			}
		%>
		</table>
		<p><input name="sub" type="submit" class="input1" value="ɾ��ѡ�е�ѧ���ɼ�">
		&nbsp;&nbsp;
		<input name="btn" type="button" class="input1" onClick="javascript:window.location='add_practice_score.jsp'" value="�����ѧ���ɼ�">
		&nbsp;&nbsp;
		<input type="button" class="input1" value="��������ɼ�" onClick="window.open('import_score.htm')">
		</p>
		</form>
		
		<form action="admin_practice_score.jsp" method="post" target="_self">	
			��<font color="#FF0000"><%=showPage%></font>ҳ/��<font color=red><%=pages.getPageCount()%></font>ҳ&nbsp;
			<a href="admin_practice_score.jsp?showPage=1" target="_self"><font color="#0000FF">[��ҳ]</font></a>&nbsp;			
			<%
				//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
				if(showPage > 1)
				{				
			%>
					<a href="admin_practice_score.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
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
					<a href="admin_practice_score.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[��һҳ]&nbsp;");
				}
			%> 
			<a href="admin_practice_score.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[βҳ]</font> </a>&nbsp;
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
		
		<%rs.close();%>
	</div>
	</body>
</html>
