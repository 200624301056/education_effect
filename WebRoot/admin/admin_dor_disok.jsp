<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������ҵ�칫ƽ̨</title>
		<jsp:useBean scope="page" id="Dormitory" class="com.bar.db.Dormitory" />
		<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage_stu" />

	</head>

	<body bgcolor="#F2F2F2">
	<div align=center>
	<%

	//��ȡ��Ҫ����İ༶��Ϣ
	request.setCharacterEncoding("gb2312");
	String stu_num="";
	String stu_name="";
	String school="";
	String grade="";
	String class_name="";
	String sex="";
	String term="";
	String class_n="";
	String dor_leader="";
	String class_teacher="";
	 school=request.getParameter("school");
	 grade=request.getParameter("grade");
	 //class_name=request.getParameter("class_name");
	 term=request.getParameter("term"); 
	 sex=request.getParameter("sex");
	 dor_leader=request.getParameter("dor_leader");
	 class_teacher=request.getParameter("class_teacher");
	if (school==null || grade==null || sex==null)
	{ out.println("<p><font color=#0000FF>����ѡ��Ҫ�����ѧ����Ϣ</font></p>");
	out.println("<input type=button name=btn2 value=����ѡ�� onClick='window.history.go(-1)'>");
	return;
	}else
	{ class_n=school+grade+sex+"��";
	
	}
	
	ResultSet rs = Dormitory.show_dor_dis(school,grade,sex);
	pages.initialize(rs,12);
	int showCount=0;
	int pageCount = 0;
	//��ȡ��ת����Ŀ��ҳ��
	pageCount=pages.getPageCount();
	showCount=pages.getRowCount();
	int lastnum=0;
	if (showCount<=12){
	lastnum=showCount;
	}else{
	lastnum=showCount%12;
	}
	//��ȡҪ��ʾ�����ݼ���
		
	%>	
	<%=class_n%>��<font color="#FF0000"><%=showCount%></font>��ͬѧ/ÿ�������ܹ�����<font color=red>12</font>��ͬѧ/����Ҫ����<font color=red><%=pages.getPageCount()%></font>������/���һ���������<font color=red><%=lastnum%></font>��
	<p><%			
		//��ȡ��Ҫ�����ѧ����Ϣ��������
	String[] dornum = request.getParameterValues("dornum");	
	
		if (dornum == null ||dornum.length != pageCount ){	
		out.println("<p><font color=#0000FF>������������"+pageCount+"��</font></p>");
		out.println("<input type=button name=btn2 value=���� onClick='window.history.go(-1)'>");
		}
		else
	{	
		String dor_name = "0";
		int stcount = 0;	
		for(int j=0,showPage=1;j<dornum.length;j++,showPage=showPage+1)//ÿ���������12��ѧ��������������ѭ����Ȼ�������ż�1
		{ 
		Vector vData=pages.getPage(showPage);
			dor_name = dornum[j];
					out.println("<p>"+dor_name+"��������ѧ����:");
					stcount=vData.size();
					
				for(int i=0;i<vData.size();i++)
					{ 	
						//��ʾ����					
						String[] sData=(String[])vData.get(i);
						stu_num=sData[1];
						stu_name=sData[2];
						sex=sData[3];
						school=sData[5];
						grade=sData[6];
						class_name=sData[7];
						if(i%12==0){dor_leader=stu_num;}	//ÿ������ĵ�һ��ѧԱΪ���༶ѧ���᳤			
						Dormitory.setStu_num(stu_num);
						Dormitory.setSUname(stu_name);
						Dormitory.setSex(sex);
						Dormitory.setSchool(school);
						Dormitory.setGrade(grade);
						Dormitory.setClass_name(class_name);
						Dormitory.setTerm(term);
						Dormitory.setDor_name(dor_name);
						Dormitory.setDor_leader(dor_leader);
						Dormitory.setClass_teacher(class_teacher);				
						Dormitory.setStcount(stcount);
			///	ResultSet rsc = Dormitory.show_dor_count(dor_name);
			if(Dormitory.addDordis())		//ִ�в������
			{
				out.println("<p><font color=blue>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+stu_num+"�������ɹ�</font></p>");	
				Dormitory.upDorflag(dor_name); //����������סѧ������			
			}
			else
			{
				out.println("<p><font color=red>"+stu_num+"�������ʧ�ܣ�������</font></p>");
			}
							
				}
				
		}out.println("<a href='admin_dor_dis.jsp' target='_self'><font color=blue>�������</font></a>");		
	}	

	%>
	</div>
	</body>
</html>
