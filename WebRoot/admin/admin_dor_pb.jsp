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
		<jsp:useBean scope="page" id="Dormitory" class="com.bar.db.Dormitory" />
		<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage_stu" />
         <style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		td{border-right:1px #999 dashed; border-bottom:1px #999 dashed;}
		.input1{width:120px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		.input2{width:80px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		</style>
	</head>
	<body bgcolor="#F2F2F2">
	<div align="center"><form action="" method="post" name="tiaojian"> 
	 <select name="term">
		  	<option value="" >--选择学期--</option>
            <option value="1">第一学期</option>
            <option value="2">第二学期</option>
            <option value="3">第三学期</option>
            <option value="4">第四学期</option>
		  </select>&nbsp;&nbsp;&nbsp;
			<input name="" type="submit" value="提交">
		</form></div>	<br>
		<%	String term="";
	 term=request.getParameter("term");
	if (term==null){
	  term="1";}	 %>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
		<tr >
		  <th colspan="6">女宿舍星级评比第一名</th>
		</tr>
			<tr bgcolor="#CC99FF">
			<th width="10%" height="30" align="center">名次</th>
			<th width="20%" height="30" align="center">宿舍编号</th>
			<th width="20%" align="center">分数</th>
			<th width="20%" height="30" >舍长</th>
			<th width="20%" height="30" >学期</th>
			<th width="10%" height="30" align="center">班主任</th>
			</tr>
		<%	
 

	ResultSet rsf = Dormitory.show_dor_pbf(term);
			//循环显示当前页的学员信息
			//if (rsf.next()){
			
			while(rsf.next()){
		%>
				<tr>
				<td width="10%" height="25" align="center">1</td>
			    <td width="20%" height="25" align="center"><font color="#0000FF"><%=rsf.getString(1)%></font></td>
			    <td width="20%" height="25" align="center"><%=rsf.getString(2)%></td>
			    <td width="20%" height="25" align="center"><%=rsf.getString(3)%></td>
				<td width="20%" height="25" align="center"><%=rsf.getString(4)%></td>
			    <td width="10%" align="center"><%=rsf.getString(5)%></td>
				</tr>
		<%
				
			}
			//else
			//out.println("暂无排名信息")；
			
			//}
		%>
		</table>
		
		<p>&nbsp;</p>

		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
		<tr ><th colspan="6">男宿舍星级评比第一名</th>
		</tr>
			<tr bgcolor="#CC99FF">
			<th width="10%" height="30" align="center">名次</th>
			<th width="20%" height="30" align="center">宿舍编号</th>
			<th width="20%" align="center">分数</th>
			<th width="20%" height="30" >舍长</th>
			<th width="20%" height="30" >学期</th>
			<th width="10%" height="30" align="center">班主任</th>
			</tr>
		<%		
		//获取所有学员信息
	ResultSet rsm = Dormitory.show_dor_pbm(term);	
			//循环显示当前页的学员信息
		while(rsm.next()){
		%>
				<tr>
				<td width="10%" height="25" align="center">1</td>
		    	<td width="20%" height="25" align="center"><font color="#0000FF"><%=rsm.getString(1)%></font></td>
			    <td width="20%" height="25" align="center"><%=rsm.getString(2)%></td>
			    <td width="20%" height="25" align="center"><%=rsm.getString(3)%></td>
				<td width="20%" height="25" align="center"><%=rsm.getString(4)%></td>
			    <td width="10%" align="center"><%=rsm.getString(5)%></td>
				</tr>
		<%
				
			}
		%>
		</table>
	</body>
</html>
