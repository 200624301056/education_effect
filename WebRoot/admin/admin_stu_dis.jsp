<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('请先登录！');window.location.href='../index.jsp'</script>");
	 
%>
<script language="javascript">  
//全选和全不选（第一个参数为复选框名称，第二个参数为是全选还是全不选）  
function allCheck(name,boolValue) {  
    var allvalue = document.getElementsByName(name);   
    for (var i = 0; i < allvalue.length; i++) {        
        if (allvalue[i].type == "checkbox")             
            allvalue[i].checked = boolValue;             
    }  
}   
}
//反选 参数为复选框名称  
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
	//初始化分页显示类
	pages.initialize(rs,12);
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
		<form action="admin_stu_dis.jsp" method="post" name="tiaojian"> 
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
		  	<option value="" >--选择学期--</option>
            <option value="1">第一学期</option>
            <option value="2">第二学期</option>
            <option value="3">第三学期</option>
            <option value="4">第四学期</option>
          </select>&nbsp;&nbsp; 性别：
		      <select name="sex">
		  	<option value="" >--选择性别--</option>
            <option value="男">男生</option>
            <option value="女">女生</option>
          </select> 
		  &nbsp;&nbsp;姓名：<input type="text" name="stu_name"  width="80" > &nbsp;&nbsp;
		  宿舍编号：<input type="text" name="dor_name"  width="80" >&nbsp;&nbsp; <input type="Submit" name="Submit" value="提交">	
		</form>
		<form name="form1" method="post" action="delete_stu_dor.jsp" target="_self">
		<input type="hidden" name="showPage" value="<%=showPage%>">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size:12px;" >
			<tr>
				  <td height="25" colspan="12" align="center"><em><font size="3"><strong>宿舍分配信息查询</strong></font></em>			
				  </td>
		  </tr>
			<tr bgcolor="#CC99FF">
			<th width="5%" height="30" align="center"><em>选中</em></th>
			<th width="10%" height="30" align="center"><em>学员编号</em></th>
			<th width="10%" height="30" align="center"><em>姓名</em></th>
			<th width="5%" align="center"><em>性别</em></th>			
			<th width="15%" height="30" ><em>学校</em></th>
			<th width="10%" height="30" align="center"><em>年级</em></th>
			<th width="5%" align="center"><em>班级</em></th>
			<th width="5%" align="center"><em>学期</em></th>
			<th width="8%" align="center"><em>宿舍编号</em></th>
			<th width="16%" align="center"><em>宿舍舍长</em></th>
			<th width="6%" align="center"><em>班主任</em></th>
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
				//显示舍长的姓名和学号			
				String dor_leader=sData[9];
				Dormitory.setDor_leader(dor_leader);
				ResultSet rss = Dormitory.show_dor_leader(dor_leader);
				if (rss.next()){
				String dor_le=rss.getString(1);
				out.print(dor_le);
				out.print("("+dor_leader+")");}
				%><br></td>
			<td width="6%" height="25" align="center"><%=sData[10]%><br></td>
            <td width="5%" height="25" align="center">&nbsp;<a href="updata_Dormitory_score.jsp?Stuid=<%=sData[0]%>&amp;showPage=<%=showPage%>" target="_self"><font color="#0000ff">修改</font></a></td>
			</tr>
				
		<% 
				 
			} 
		%>
		</table>
		    <a href="javascript:allCheck('DeleteID',true)">全选</a>   
    <a href="javascript:allCheck('DeleteID',false)">全不选</a>   
    <a href="javascript:reserveCheck('DeleteID')">反选</a> 
		<p><em><input type="submit" name="sub" class="input1" value="删除选中宿舍分配信息"> 
		&nbsp;&nbsp; 
		<input type="button" name="btn" class="input1" onclick="javascript:window.location='add_Dormitory_score.jsp'" value="添加新学宿舍分配信息"> 
		&nbsp;&nbsp; 
		<input type="button" class="input1" value="批量分配信息" onclick="window.open('import_Dormitory.htm')">
		</em>
		</p>
		</form>
		<p>
		<form action="admin_stu_dis.jsp" method="post" target="_self">	
			第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=pages.getPageCount()%></font>页&nbsp;
			<a href="admin_stu_dis.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
					<a href="admin_stu_dis.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
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
					<a href="admin_stu_dis.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[下一页]&nbsp;");
				}
			%> 
			<a href="admin_stu_dis.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
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
