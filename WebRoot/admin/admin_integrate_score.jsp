<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Integrate" class="com.bar.db.Integrate" />
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

	//获取所有学员信息
	ResultSet rs = Integrate.show_Intscore(school,grade,class_name,term,stu_name,stu_num);
	//初始化分页显示类
	pages.initialize(rs,25);
	String strPage=null;
	int showPage = 1;
	//获取跳转到的目的页面
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
	//获取要显示的数据集合
	Vector vData=pages.getPage(showPage);	
%>
	<body bgcolor="#F2F2F2">
		<div align="center">
		<form action="admin_integrate_score.jsp" method="post" name="tiaojian"> 
		  按条件查找： 
		    &nbsp;&nbsp;
		  <select name="school">
            <option value="">--选择学校--</option>
            <option value="一中">一中</option>
            <option value="二中">二中</option>
            <option value="十四中">白城十四中</option>
          </select>&nbsp;&nbsp;
		  
		  <select name="grade">
            <option value="">--选择年级--</option>
            <option value="高一">高一</option>
            <option value="高二">高二</option>
          </select>&nbsp;&nbsp;
		  <select name="class_name">
            <option value="">--选择班级--</option>
            <option value="1班">一班</option>
            <option value="2班">二班</option>
			<option value="3班">三班</option>
			<option value="4班">四班</option>
			<option value="5班">五班</option>
			<option value="6班">六班</option>
			<option value="7班">七班</option>
          </select>&nbsp;&nbsp;
           <select name="term">
            <option value="">--选择学期--</option>
            <option value="1">第一学期</option>
            <option value="2">第二学期</option>
			<option value="3">第三学期</option>
			<option value="4">第四学期</option>
          </select>&nbsp;&nbsp;姓名：<input type="text" name="stu_name" >&nbsp;&nbsp;学号：<input type="text" name="stu_num" > &nbsp;&nbsp; <input type="Submit" name="Submit" value="提交">		 
		</form>
		<form name="form1" method="post" action="delete_intsco.jsp" target="_self">
		<em><input type="hidden" name="showPage" value="<%=showPage%>"></em>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
			<tr>
				  <td height="25" colspan="12" align="center"><em><font size="3"><strong>综合素质成绩管理</strong></font></em></td>
		  </tr>
			<tr bgcolor="#CC99FF">
			<th width="5%" height="30" align="center"><em>选中</em></th>
			<th width="15%" height="30" align="center"><em>学员编号</em></th>
			<th width="15%" height="30" align="center"><em>姓名</em></th>
			<th width="10%" align="center"><em>寝室卫生</em></th>
			<th width="10%" height="30" ><em>食堂卫生</em></th>
			<th width="10%" height="30" align="center"><em>课间纪律</em></th>
			<th width="10%" height="30" align="center"><em>晚间活动</em></th>
			<th width="5%" align="center">学校</th>
			<th width="5%" align="center">年级</th>
			<th width="5%" align="center">班级</th>
			<th width="5%" align="center">学期</th>
			<th width="5%" height="30" align="center"><em>修改</em></th>
			</tr>
		<%			 
			//循环显示当前页的学员信息 
			for(int i=0;i<vData.size();i++) 
			{  
				//显示数据 
				String[] sData=(String[])vData.get(i); 
		%>
				<tr>
				<td width="5%" height="25" align="center"><em>&nbsp; 
				  <input type="checkbox" name="DeleteID" value="<%=sData[0]%>"></em></td>
				<td width="15%" height="25" align="center"><em><%=sData[1]%></em><br></td>
			    <td width="15%" height="25" align="center"><em><font color="#0000ff"><%=sData[2]%></font></em><br></td>
			    <td width="10%" height="25" align="center"><em><%=sData[3]%></em><br></td>
			    <td width="10%" height="25" align="center"><em><%=sData[4]%></em><br></td>
			    <td width="10%" align="center"><em><%=sData[5]%></em><br></td>
			    <td width="10%" align="center"><em><%=sData[6]%></em><br></td>
				<td width="5%" height="25" align="center"><em><%=sData[7]%></em><br></td>
				<td width="5%" height="25" align="center"><em><%=sData[8]%></em><br></td>
			    <td width="5%" height="25" align="center"><em><%=sData[9]%></em><br></td>
			    <td width="5%" align="center"><em><%=sData[10]%></em><br></td>
                <td width="5%" height="25" align="center"><em>&nbsp;<a href="updata_integrate_score.jsp?Stuid=<%=sData[0]%>&amp;showPage=<%=showPage%>" target="_self"><font color="#0000ff">修改</font></a></em></td>
				</tr>
				
		<%  
			} 
		%>
		</table>
		<p><em><input type="submit" name="sub" class="input1" value="删除选中的学生成绩"> 
		&nbsp;&nbsp; 
		<input type="button" name="btn" class="input1" onclick="javascript:window.location='add_integrate_score.jsp'" value="添加新学生成绩"> 
		&nbsp;&nbsp; 
		<input type="button" class="input1" value="批量导入成绩" onclick="window.open('import_Intscore.htm')"></em>
		</p>
		</form>
		<p>
		<form action="admin_integrate_score.jsp" method="post" target="_self">	
			第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=pages.getPageCount()%></font>页&nbsp;
			<a href="admin_integrate_score.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
					<a href="admin_integrate_score.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
  <%
				}
				else
				{
					out.println("[上一页]&nbsp;");
				}
				//判断"下一页"链接是否要显示
				if(showPage < pages.getPageCount())
				{				
			%>
					<a href="admin_integrate_score.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[下一页]&nbsp;");
				}
			%> 
			<a href="admin_integrate_score.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
			转到
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
			页&nbsp;
	      <input name="go" type="submit" class="input2" value="提交"/>
		</form>
		</p>
		<%rs.close();%>
	</div>
	</body>
</html>
