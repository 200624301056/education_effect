<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('���ȵ�¼��');window.location.href='../index.jsp'</script>");
	 
%>
<script language="javascript">  
//ȫѡ��ȫ��ѡ����һ������Ϊ��ѡ�����ƣ��ڶ�������Ϊ��ȫѡ����ȫ��ѡ��  
function allCheck(name,boolValue) {  
    var allvalue = document.getElementsByName(name);   
    for (var i = 0; i < allvalue.length; i++) {        
        if (allvalue[i].type == "checkbox")             
            allvalue[i].checked = boolValue;             
    }  
}   
}
//��ѡ ����Ϊ��ѡ������  
function reserveCheck(name){  
    var revalue = document.getElementsByName(name);   
    for(i=0;i<revalue.length;i++){  
        if(revalue[i].checked == true)   
            revalue[i].checked = false;  
        else   
            revalue[i].checked = true;  
    }  
}  
</script>  
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Dormitory" class="com.bar.db.Dormitory" />
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
	String sex="";
	String dor_name="";
	 school=request.getParameter("school");
	 grade=request.getParameter("grade");
	 class_name=request.getParameter("class_name");
	 term=request.getParameter("term");
	 stu_name=request.getParameter("stu_name");
	 sex=request.getParameter("sex");
	 dor_name=request.getParameter("dor_name");
	ResultSet rs = Dormitory.show_stu_dis(school,grade,class_name,term,sex,stu_name,dor_name);
	//��ʼ����ҳ��ʾ��
	pages.initialize(rs,12);
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
		<form action="admin_stu_dis.jsp" method="post" name="tiaojian"> 
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
		  	<option value="" >--ѡ��ѧ��--</option>
            <option value="1">��һѧ��</option>
            <option value="2">�ڶ�ѧ��</option>
            <option value="3">����ѧ��</option>
            <option value="4">����ѧ��</option>
          </select>&nbsp;&nbsp; �Ա�
		      <select name="sex">
		  	<option value="" >--ѡ���Ա�--</option>
            <option value="��">����</option>
            <option value="Ů">Ů��</option>
          </select> 
		  &nbsp;&nbsp;������<input type="text" name="stu_name"  width="80" > &nbsp;&nbsp;
		  �����ţ�<input type="text" name="dor_name"  width="80" >&nbsp;&nbsp; <input type="Submit" name="Submit" value="�ύ">	
		</form>
		<form name="form1" method="post" action="delete_stu_dor.jsp" target="_self">
		<input type="hidden" name="showPage" value="<%=showPage%>">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size:12px;" >
			<tr>
				  <td height="25" colspan="12" align="center"><em><font size="3"><strong>���������Ϣ��ѯ</strong></font></em>			
				  </td>
		  </tr>
			<tr bgcolor="#CC99FF">
			<th width="5%" height="30" align="center"><em>ѡ��</em></th>
			<th width="10%" height="30" align="center"><em>ѧԱ���</em></th>
			<th width="10%" height="30" align="center"><em>����</em></th>
			<th width="5%" align="center"><em>�Ա�</em></th>			
			<th width="15%" height="30" ><em>ѧУ</em></th>
			<th width="10%" height="30" align="center"><em>�꼶</em></th>
			<th width="5%" align="center"><em>�༶</em></th>
			<th width="5%" align="center"><em>ѧ��</em></th>
			<th width="8%" align="center"><em>������</em></th>
			<th width="16%" align="center"><em>�����᳤</em></th>
			<th width="6%" align="center"><em>������</em></th>
			<th width="5%" height="30" align="center"><em>�޸�</em></th>
			</tr>
		<%			 
			//ѭ����ʾ��ǰҳ��ѧԱ��Ϣ 
			for(int i=0;i<vData.size();i++) 
			{  
				//��ʾ���� 
				String[] sData=(String[])vData.get(i); 
		%>
			<tr>
			<td width="5%" height="25" align="center">&nbsp; 
	 <input type="checkbox" id="DeleteID" name="DeleteID" value="<%=sData[0]%>:<%=sData[8]%>"/></td>
			<td width="10%" height="25" align="center"><%=sData[1]%><br></td>
			<td width="10%" height="25" align="center"><font color="#0000ff"><%=sData[2]%></font><br></td>
			<td width="5%" height="25" align="center"><%=sData[3]%><br></td>
			<td width="15%" height="25" align="center"><%=sData[4]%><br></td>
			<td width="10%" height="25" align="center"><%=sData[5]%><br></td>
			<td width="5%" align="center"><%=sData[6]%><br></td>
			<td width="5%" height="25" align="center"><%=sData[7]%><br></td>
			<td width="8%" height="25" align="center"><a href="admin_stu_dis.jsp?dor_name=<%=sData[8]%>" target="_self"><%=sData[8]%></a><br></td>
				<td width="16%" height="25" align="center"><%	
				//��ʾ�᳤��������ѧ��			
				String dor_leader=sData[9];
				Dormitory.setDor_leader(dor_leader);
				ResultSet rss = Dormitory.show_dor_leader(dor_leader);
				if (rss.next()){
				String dor_le=rss.getString(1);
				out.print(dor_le);
				out.print("("+dor_leader+")");}
				%><br></td>
			<td width="6%" height="25" align="center"><%=sData[10]%><br></td>
            <td width="5%" height="25" align="center">&nbsp;<a href="updata_Dormitory_score.jsp?Stuid=<%=sData[0]%>&amp;showPage=<%=showPage%>" target="_self"><font color="#0000ff">�޸�</font></a></td>
			</tr>
				
		<% 
				 
			} 
		%>
		</table>
		    <a href="javascript:allCheck('DeleteID',true)">ȫѡ</a>   
    <a href="javascript:allCheck('DeleteID',false)">ȫ��ѡ</a>   
    <a href="javascript:reserveCheck('DeleteID')">��ѡ</a> 
		<p><em><input type="submit" name="sub" class="input1" value="ɾ��ѡ�����������Ϣ"> 
		&nbsp;&nbsp; 
		<input type="button" name="btn" class="input1" onclick="javascript:window.location='add_Dormitory_score.jsp'" value="�����ѧ���������Ϣ"> 
		&nbsp;&nbsp; 
		<input type="button" class="input1" value="����������Ϣ" onclick="window.open('import_Dormitory.htm')">
		</em>
		</p>
		</form>
		<p>
		<form action="admin_stu_dis.jsp" method="post" target="_self">	
			��<font color="#FF0000"><%=showPage%></font>ҳ/��<font color=red><%=pages.getPageCount()%></font>ҳ&nbsp;
			<a href="admin_stu_dis.jsp?showPage=1" target="_self"><font color="#0000FF">[��ҳ]</font></a>&nbsp;			
			<%
				//�ж�"��һҳ"�����Ƿ�Ҫ��ʾ
				if(showPage > 1)
				{				
			%>
					<a href="admin_stu_dis.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
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
					<a href="admin_stu_dis.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[��һҳ]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[��һҳ]&nbsp;");
				}
			%> 
			<a href="admin_stu_dis.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[βҳ]</font> </a>&nbsp;
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
		<%rs.close();%>
	</div>
	</body>
</html>
