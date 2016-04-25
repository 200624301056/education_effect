<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('请先登录！');window.location.href='../index.jsp'</script>");
	 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Student" class="com.bar.db.Student" />
		<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage_stu" />
         <style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		td{border-right:1px #999 dashed; border-bottom:1px #999 dashed;}
		.input1{width:120px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		.input2{width:80px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		</style>
	     <script type="text/JavaScript">
         </script>
	</head>
	<%
	request.setCharacterEncoding("gb2312");
	String school="";
	String grade="";
	String class_name="";
	
	 school=request.getParameter("school");
	 //System.out.print(school);
	 grade=request.getParameter("grade");
	  //System.out.print(grade);
	 class_name=request.getParameter("class_name");
	 // System.out.print(class_name);

		//获取所有学员信息
	ResultSet rs = Student.show_students(school,grade,class_name);
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
		<form action="admin_students.jsp" method="post" name="tiaojian"> 
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
		  <label>
		  <input type="Submit" name="Submit" value="提交">
		  </label>
		</form>
		<form name="form1" method="post" action="delete_stu.jsp" target="_self">
		<input type="hidden" name="showPage" value="<%=showPage%>">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
			<tr bgcolor="#CC99FF">
			<th width="2%" height="30" align="center">选中</th>
			<th width="3%" height="30" align="center">学员编号</th>
			<th width="4%" height="30" align="center">姓名</th>
			<th width="3%" align="center">性别</th>
			<th width="15%" height="30" >培训日期</th>
			<th width="12%" height="30" align="center">学校</th>
			<th width="5%" align="center">年级</th>
			<th width="5%" align="center">班级</th>
			<th width="5%" align="center">是否回族</th>
			<th width="5%" height="30" align="center">修改</th>
			</tr>
		<%			
			//循环显示当前页的学员信息
			for(int i=0;i<vData.size();i++)
			{ 
				//显示数据
				String[] sData=(String[])vData.get(i);
		%>
				<tr>
				<td width="2%" height="25" align="center">&nbsp;<input type="checkbox" name="DeleteID" value="<%=sData[0]%>"></td>
				<td width="8%" height="25" align="center"><%=sData[1]%></td>
			    <td width="4%" height="25" align="center"><font color="#0000FF"><%=sData[2]%></font></td>
			    <td width="3%" height="25" align="center"><%=sData[3]%></td>
			    <td width="6%" height="25" align="center"><%=sData[4]%></td>
			    <td width="9%" align="center"><%=sData[5]%></td>
				<td width="7%" height="25" align="center">&nbsp;<%=sData[6]%></td>
			    <td width="5%" height="25" align="center"><%=sData[7]%></td>
			    <td width="5%" height="25" align="center">
			    <%
			   String huizu=sData[8];
			    if (huizu.equals("0")){out.println("是");}
			    else
			    {out.println("否");}
			    %>
			    
			    </td>
                <td width="5%" height="25" align="center">&nbsp;<a href="updata_stu_form.jsp?Stuid=<%=sData[0]%>&showPage=<%=showPage%>" target="_self"><font color="#0000FF">修改</font></a></td>
				</tr>
		<%
				
			}
		%>
		</table>
		<p><input name="sub" type="submit" class="input1" value="删除选中的学生">
		&nbsp;&nbsp;
		<input name="btn" type="button" class="input1" onClick="javascript:window.location='add_student.jsp'" value="添加新学生">
		&nbsp;&nbsp;
		<input type="button" class="input1" value="批量导入" onClick="window.open('import_stu.htm')">
		</p>
		</form>
		<p>
		<form action="admin_students.jsp" method="post" target="_self">	
			第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=pages.getPageCount()%></font>页&nbsp;
			<a href="admin_students.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
					<a href="admin_students.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
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
					<a href="admin_students.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[下一页]&nbsp;");
				}
			%> 
			<a href="admin_students.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
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
		
	</div>
	</body>
</html>
