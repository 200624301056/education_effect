<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.text.NumberFormat"%>
<%
if(session.getAttribute("uname")==null)
     out.print("<script>alert('请先登录！');window.location.href='../index.jsp'</script>");
	 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="Effect" class="com.bar.db.Effect" />
		<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage_stu" />
		
         <style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		td{border-right:1px #999 dashed; border-bottom:1px #999 dashed;}
		.input1{width:130px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		.input2{width:80px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		</style>
	</head>
	<%

	//获取所有学员信息
	String stu_numy="";
	ResultSet rs = Effect.show_stunum();
	
	
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
		<em><input type="hidden" name="showPage" value="<%=showPage%>"></em>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
			<tr>
				  <td height="25" colspan="24" align="center"><em><font size="3"><strong>效果评估</strong></font></em></td>
		  </tr>
			<tr bgcolor="#CC99FF">
			
			<th width="7%" rowspan="2" align="center"><em>学员编号</em></th>
			<th width="8%" rowspan="2" align="center"><em>姓名</em></th>
			<th colspan="4" align="center"><em>实践活动课程成绩</em></th>
			<th height="30" colspan="4" ><em>通用技术课程成绩</em></th>
			<th height="30" colspan="4" align="center"><em>综合素质成绩</em></th>
			<th colspan="7" align="center"><em>总成绩</em></th>
			</tr>
			<tr bgcolor="#CC99FF">
			
			<th width="5%" align="center">第一学期</th>
			<th width="5%" align="center">第二学期</th>
			<th width="5%" align="center">第三学期</th>
			<th width="5%" height="30" >第四学期</th>
			<th width="5%" >第一学期</th>
			<th width="5%" >第二学期</th>
			<th width="5%" >第三学期</th>
			<th width="5%" height="30" align="center">第四学期</th>
			<th width="5%" align="center">第一学期</th>
			<th width="5%" align="center">第二学期</th>
			<th width="5%" align="center">第三学期</th>
			<th width="5%" align="center">第四学期</th>
			<th width="5%" align="center">第一学期</th>
			<th width="7%" align="center">第二学期</th>
			<th width="6%" align="center">第三学期</th>
			<th width="7%" align="center">第四学期</th>
			</tr>
		<%			 
			//循环显示当前页的学员信息 
			for(int i=0;i<vData.size();i++) 
			{  
				//显示数据 
				String[] sData=(String[])vData.get(i); 
				stu_numy=sData[0];			
				%>
			<tr>
				<td width="7%" height="25" align="center"><%=sData[0]%></td>
				<td height="25" align="center"><a href="stu_effect.jsp?stuid=<%=sData[0]%>"><%=sData[1]%></a></td>
				<%
			ResultSet rss = Effect.show_sj_score(stu_numy);
			double ssjavg=0;
			String sjavg="";
	
			while(rss.next()){
				int aa=0;			
				aa=rss.getInt("score_fis");
				int bb=0;
				bb=rss.getInt("score_sec");
				int cc=0;
				cc=rss.getInt("score_thr");
				int dd=0;
				dd=rss.getInt("score_fou");
				int ee=0;
				ee=rss.getInt("score_fiv");
				int ff=0;
				ff=rss.getInt("score_six");
				int gg=0;
				gg=rss.getInt("score_sev");
			 ssjavg=(double)(aa+bb+cc+dd+ee+ff+gg)/7;	
       DecimalFormat df2  = new DecimalFormat("###.00");
      sjavg=df2.format(ssjavg);
    
		%>
			    <td height="25" align="center"><%=sjavg%></td>
<%} %>
		<%
			ResultSet rss2 = Effect.show_sj_score2(stu_numy);
			double ssjavg2=0;
			while(rss2.next()){
				int aa2=0;			
				aa2=rss2.getInt("score_fis");
				int bb2=0;
				bb2=rss2.getInt("score_sec");
				int cc2=0;
				cc2=rss2.getInt("score_thr");
				int dd2=0;
				dd2=rss2.getInt("score_fou");
				int ee2=0;
				ee2=rss2.getInt("score_fiv");
				int ff2=0;
				ff2=rss2.getInt("score_six");
				int gg2=0;
				gg2=rss2.getInt("score_sev");
			    ssjavg2=(double)(aa2+bb2+cc2+dd2+ee2+ff2+gg2)/7;
			      DecimalFormat df2  = new DecimalFormat("###.00");
      			String sjavg2=df2.format(ssjavg2);		
		%>
			    <td height="25" align="center"><%=sjavg2%></td>
		<%} %>
		<%
			ResultSet rss3 = Effect.show_sj_score3(stu_numy);
			double ssjavg3=0;		
			while(rss3.next()){
				int aa3=0;			
				aa3=rss3.getInt("score_fis");
				int bb3=0;
				bb3=rss3.getInt("score_sec");
				int cc3=0;
				cc3=rss3.getInt("score_thr");
				int dd3=0;
				dd3=rss3.getInt("score_fou");
				int ee3=0;
				ee3=rss3.getInt("score_fiv");
				int ff3=0;
				ff3=rss3.getInt("score_six");
				int gg3=0;
				gg3=rss3.getInt("score_sev");
			    ssjavg3=(double)(aa3+bb3+cc3+dd3+ee3+ff3+gg3)/7;
			    DecimalFormat df2  = new DecimalFormat("###.00");
      			String sjavg3=df2.format(ssjavg3);			
		%>
			    <td height="25" align="center"><%=sjavg3%></td>
		 	<%} %>
		 	<%
			ResultSet rss4 = Effect.show_sj_score4(stu_numy);
			double ssjavg4=0;
			while(rss4.next()){
				int aa4=0;			
				aa4=rss4.getInt("score_fis");
				int bb4=0;
				bb4=rss4.getInt("score_sec");
				int cc4=0;
				cc4=rss4.getInt("score_thr");
				int dd4=0;
				dd4=rss4.getInt("score_fou");
				int ee4=0;
				ee4=rss4.getInt("score_fiv");
				int ff4=0;
				ff4=rss4.getInt("score_six");
				int gg4=0;
				gg4=rss4.getInt("score_sev");
			    ssjavg4=(double)(aa4+bb4+cc4+dd4+ee4+ff4+gg4)/7;
			     DecimalFormat df2  = new DecimalFormat("###.00");
      			String sjavg4=df2.format(ssjavg4);		
      			
		%>
			    <td height="25" align="center"><%=sjavg4%></td>
			 <%} %>
			   <% 
			   ResultSet rsg = Effect.show_ge_score(stu_numy);
			     double ggeavg=0;
			     while(rsg.next()){			  
			     ggeavg=(double)rsg.getInt("score_gen");
			      DecimalFormat df2  = new DecimalFormat("###.00");
      			String geavg=df2.format(ggeavg);
			  %>  
			    <td height="25" align="center"><%=geavg%></td>
			 <%} %>
			   	<% 
			   ResultSet rsg2 = Effect.show_ge_score2(stu_numy);
			     double ggeavg2=0;			     
			     while(rsg2.next()){
			     ggeavg2=(double)rsg2.getInt("score_gen");
			     DecimalFormat df2  = new DecimalFormat("###.00");
      			String geavg2=df2.format(ggeavg2);
			  %> 
			    <td height="25" align="center"><%=geavg2%></td>
			    <%} %>
			   	<% 
			   ResultSet rsg3 = Effect.show_ge_score3(stu_numy);
			      double ggeavg3=0;	
			     while(rsg3.next()){
			     ggeavg3=(double)rsg3.getInt("score_gen");
			      DecimalFormat df2  = new DecimalFormat("###.00");
      			String geavg3=df2.format(ggeavg3);
			  %> 
			    <td height="25" align="center"><%=geavg3%></td>
			  <%} %>
			   	<% 
			   ResultSet rsg4 = Effect.show_ge_score4(stu_numy);
			       double ggeavg4=0;
			     while(rsg4.next()){		   
			     ggeavg4=(double)rsg4.getInt("score_gen");			     
			      DecimalFormat df2  = new DecimalFormat("###.00");
      			String geavg4=df2.format(ggeavg4);
      			
			  %> 
	
			    <td height="25" align="center"><%=geavg4%></td>
			  <%} %>
			     <% 
			   ResultSet rsz = Effect.show_zh_score(stu_numy);
			    double zzhavg=0;
			     while(rsz.next()){
			     int za=0;
			    za=rsz.getInt("score_fi");
				int zb=0;
				zb=rsz.getInt("score_se");
				int zc=0;
				zc=rsz.getInt("score_th");
				int zd=0;
				zd=rsz.getInt("score_fo");
				zzhavg=(double)(za+zb+zc+zd)/4;
				 DecimalFormat df2  = new DecimalFormat("###.00");
      			String zhavg=df2.format(zzhavg);
			  %> 
			    <td height="25" align="center"><%=zhavg%></td>
	<%} %>
			     <% 
			   ResultSet rsz2 = Effect.show_zh_score2(stu_numy);
			     double zzhavg2=0;
		 	     while(rsz2.next()){
			     int za2=0;
			    za2=rsz2.getInt("score_fi");
				int zb2=0;
				zb2=rsz2.getInt("score_se");
				int zc2=0;
				zc2=rsz2.getInt("score_th");
				int zd2=0;
				zd2=rsz2.getInt("score_fo");
				zzhavg2=(double)(za2+zb2+zc2+zd2)/4;
				DecimalFormat df2  = new DecimalFormat("###.00");
      			String zhavg2=df2.format(zzhavg2);
			  %> 
			    <td height="25" align="center"><%=zhavg2%></td>
<%} %>
			     <% 
			   ResultSet rsz3 = Effect.show_zh_score3(stu_numy);
			     double zzhavg3=0;
			     while(rsz3.next()){
			     int za3=0;
			    za3=rsz3.getInt("score_fi");
				int zb3=0;
				zb3=rsz3.getInt("score_se");
				int zc3=0;
				zc3=rsz3.getInt("score_th");
				int zd3=0;
				zd3=rsz3.getInt("score_fo");
				zzhavg3=(double)(za3+zb3+zc3+zd3)/4;
				DecimalFormat df2  = new DecimalFormat("###.00");
      			String zhavg3=df2.format(zzhavg3);
			  %> 
			    <td height="25" align="center"><%=zhavg3%></td>
			    <%} %>
	
				 <% 
			   ResultSet rsz4 = Effect.show_zh_score4(stu_numy);
			      double zzhavg4=0;
			     while(rsz4.next()){
			     int za4=0;
			    za4=rsz4.getInt("score_fi");
				int zb4=0;
				zb4=rsz4.getInt("score_se");
				int zc4=0;
				zc4=rsz4.getInt("score_th");
				int zd4=0;
				zd4=rsz4.getInt("score_fo");
				zzhavg4=(double)(za4+zb4+zc4+zd4)/4;
				DecimalFormat df2  = new DecimalFormat("###.00");
      			String zhavg4=df2.format(zzhavg4);
			  %> 
			    <td height="25" align="center"><%=zhavg4%></td>
			    <%} %>
		<%
		double aallavg=(double)ssjavg+ggeavg+zzhavg;
			DecimalFormat df1  = new DecimalFormat("###.00");
      			String allavg=df1.format(aallavg);
		double aallavg2=(double)ssjavg2+ggeavg2+zzhavg2;
			DecimalFormat df2  = new DecimalFormat("###.00");
      			String allavg2=df2.format(aallavg2);
		double aallavg3=(double)ssjavg3+ggeavg3+zzhavg3;
			DecimalFormat df3  = new DecimalFormat("###.00");
      			String allavg3=df3.format(aallavg3);
		double aallavg4=(double)ssjavg4+ggeavg4+zzhavg4;
			DecimalFormat df4  = new DecimalFormat("###.00");
      			String allavg4=df4.format(aallavg4);
		
		
		 %>
				<td height="25" align="center"><%=allavg%></td>
				<td height="25" align="center"><%=allavg2%></td>
				<td height="25" align="center"><%=allavg3%></td>
				<td height="25" align="center"><%=allavg4%></td>
				</tr>
				
		<% 			
			} 
		%>
		</table>

		<p>
		<form action="admin_effect.jsp" method="post" target="_self">	
			第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=pages.getPageCount()%></font>页&nbsp;
			<a href="admin_effect.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
					<a href="admin_effect.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
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
					<a href="admin_effect.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[下一页]&nbsp;");
				}
			%> 
			<a href="admin_effect.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
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
	</body>
</html>
