<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.text.NumberFormat"%>
<% 
	request.setCharacterEncoding("utf-8"); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<title>欢迎进入管理系统</title>
<link type="text/css" rel="Stylesheet" href="first.css"> 
<script type=text/javascript></script>
<jsp:useBean scope="page" id="Effect" class="com.bar.db.Effect" />
<style type="text/css">
<!--
.STYLE4 {color: #000000; font-size: 18px; font-family: }
.STYLE5 {font-size: 12px; color:#FF0000;}
-->
</style>
<%
String stu_numy = request.getParameter("stuid");
%>
</head>
<body>
<table width="100%" cellpadding="0" cellspacing="1">
  <tr bgcolor="#CC99FF">
    <td colspan="16" align="center"><%=stu_numy%>同学的培训效果走势图</td>
  </tr>
  <tr bgcolor="#CC99FF">
    <td colspan="4"><div align="center" class="STYLE4">实践活动课程成绩走势</div></td>
    <td colspan="4"><div align="center" class="STYLE4">通用技术课程成绩走势</div></td>
    <td colspan="4"><div align="center" class="STYLE4">综合素质成绩走势</div></td>
    <td colspan="4"><div align="center" class="STYLE4">总成绩走势</div></td>
  </tr>
  <tr>
    <td><div id="dis" style="float:left;margin:0 5px;border:0;padding:0;"  >

<% 
	
	ResultSet rss = Effect.show_sj_score(stu_numy);
			double ssjavg=0;
			String sjavg="";
	
			if (rss.next()){
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
			 ssjavg=(double)(aa+bb+cc+dd+ee+ff+gg)/7;	}
     //  DecimalFormat df2  = new DecimalFormat("###.00");
      //sjavg=df2.format(ssjavg);
 %>
<div style="width:50px; height:<%=(100-ssjavg)*3 %>px;"></div>
<div style="width:50px; height:<%=ssjavg*3 %>px; background-color:#009900"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	//int nub=85;
	ResultSet rss2 = Effect.show_sj_score2(stu_numy);
			double ssjavg2=0;
		if (rss2.next()){
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
			    ssjavg2=(double)(aa2+bb2+cc2+dd2+ee2+ff2+gg2)/7;}
			    
			  //    DecimalFormat df2  = new DecimalFormat("###.00");
      		//	String sjavg2=df2.format(ssjavg2);	
 %>
 <div style="width:50px; height:<%=(100-ssjavg2)*3 %>px; "></div>
<div style="width:50px; height:<%=ssjavg2*3 %>px; background-color:#009900"></div>
</div></td>

    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	//int nub=85;
		ResultSet rss3 = Effect.show_sj_score3(stu_numy);
			double ssjavg3=0;		
			if (rss3.next()){
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
			    }
			  //  DecimalFormat df2  = new DecimalFormat("###.00");
      			//String sjavg3=df2.format(ssjavg3);	
 %>
 <div style="width:50px; height:<%=(100-ssjavg3)*3 %>px; "></div>
<div style="width:50px; height:<%=ssjavg3*3 %>px; background-color:#009900"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	ResultSet rss4 = Effect.show_sj_score4(stu_numy);
			double ssjavg4=0;
			if (rss4.next()){
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
			    }
			   //  DecimalFormat df2  = new DecimalFormat("###.00");
      			//String sjavg4=df2.format(ssjavg4);
 %>
 <div style="width:50px; height:<%=(100-ssjavg4)*3 %>px;  "></div>
<div style="width:50px; height:<%=ssjavg4*3 %>px; background-color:#009900"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	ResultSet rsg = Effect.show_ge_score(stu_numy);
			     double ggeavg=0;
			     if (rsg.next()){			  
			     ggeavg=(double)rsg.getInt("score_gen");
			     }
			   //   DecimalFormat df2  = new DecimalFormat("###.00");
      		//	String geavg=df2.format(ggeavg);
 %>
 <div style="width:50px; height:<%=(100-ggeavg)*3 %>px;  "></div>
<div style="width:50px; height:<%=ggeavg*3 %>px; background-color:#FF9900"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	ResultSet rsg2 = Effect.show_ge_score2(stu_numy);
			     double ggeavg2=0;			     
			     if (rsg2.next()){
			     ggeavg2=(double)rsg2.getInt("score_gen");
			     }
			  //   DecimalFormat df2  = new DecimalFormat("###.00");
      		//	String geavg2=df2.format(ggeavg2);
 %>
 <div style="width:50px; height:<%=(100-ggeavg2)*3 %>px;  "></div>
<div style="width:50px; height:<%=ggeavg2*3 %>px; background-color:#FF9900"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	  ResultSet rsg3 = Effect.show_ge_score3(stu_numy);
			      double ggeavg3=0;	
			     if (rsg3.next()){
			     ggeavg3=(double)rsg3.getInt("score_gen");
			     }
			   //   DecimalFormat df2  = new DecimalFormat("###.00");
      			//String geavg3=df2.format(ggeavg3);
 %>
 <div style="width:50px; height:<%=(100-ggeavg3)*3 %>px;  "></div>
<div style="width:50px; height:<%=ggeavg3*3 %>px; background-color:#FF9900"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	ResultSet rsg4 = Effect.show_ge_score4(stu_numy);
			       double ggeavg4=0;
			     if (rsg4.next()){		   
			     ggeavg4=(double)rsg4.getInt("score_gen");	
			     }		     
			    //  DecimalFormat df2  = new DecimalFormat("###.00");
      			//String geavg4=df2.format(ggeavg4);
 %>
 <div style="width:50px; height:<%=(100-ggeavg4)*3 %>px;  "></div>
<div style="width:50px; height:<%=ggeavg4*3 %>px; background-color:#FF9900"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	 ResultSet rsz = Effect.show_zh_score(stu_numy);
			    double zzhavg=0;
			     if (rsz.next()){
			     int za=0;
			    za=rsz.getInt("score_fi");
				int zb=0;
				zb=rsz.getInt("score_se");
				int zc=0;
				zc=rsz.getInt("score_th");
				int zd=0;
				zd=rsz.getInt("score_fo");
				zzhavg=(double)(za+zb+zc+zd)/4;
				}
				// DecimalFormat df2  = new DecimalFormat("###.00");
      			//String zhavg=df2.format(zzhavg);
 %>
 <div style="width:50px; height:<%=(100-zzhavg)*3 %>px;  "></div>
<div style="width:50px; height:<%=zzhavg*3 %>px; background-color:#0000FF"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	 ResultSet rsz2 = Effect.show_zh_score2(stu_numy);
			     double zzhavg2=0;
		 	    if (rsz2.next()){
			     int za2=0;
			    za2=rsz2.getInt("score_fi");
				int zb2=0;
				zb2=rsz2.getInt("score_se");
				int zc2=0;
				zc2=rsz2.getInt("score_th");
				int zd2=0;
				zd2=rsz2.getInt("score_fo");
				zzhavg2=(double)(za2+zb2+zc2+zd2)/4;
				}
				//DecimalFormat df2  = new DecimalFormat("###.00");
      			//String zhavg2=df2.format(zzhavg2);
 %>
 <div style="width:50px; height:<%=(100-zzhavg2)*3 %>px;  "></div>
<div style="width:50px; height:<%=zzhavg2*3 %>px; background-color:#0000FF"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
	 ResultSet rsz3 = Effect.show_zh_score3(stu_numy);
			     double zzhavg3=0;
			     if (rsz3.next()){
			     int za3=0;
			    za3=rsz3.getInt("score_fi");
				int zb3=0;
				zb3=rsz3.getInt("score_se");
				int zc3=0;
				zc3=rsz3.getInt("score_th");
				int zd3=0;
				zd3=rsz3.getInt("score_fo");
				zzhavg3=(double)(za3+zb3+zc3+zd3)/4;
				//DecimalFormat df2  = new DecimalFormat("###.00");
      			//String zhavg3=df2.format(zzhavg3);
      			}
 %>
 <div style="width:50px; height:<%=(100-zzhavg3)*3 %>px;  "></div>
<div style="width:50px; height:<%=zzhavg3*3 %>px; background-color:#0000FF"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
<% 
 ResultSet rsz4 = Effect.show_zh_score4(stu_numy);
			      double zzhavg4=0;
			     if (rsz4.next()){
			     int za4=0;
			    za4=rsz4.getInt("score_fi");
				int zb4=0;
				zb4=rsz4.getInt("score_se");
				int zc4=0;
				zc4=rsz4.getInt("score_th");
				int zd4=0;
				zd4=rsz4.getInt("score_fo");
				zzhavg4=(double)(za4+zb4+zc4+zd4)/4;
				//DecimalFormat df2  = new DecimalFormat("###.00");
      			//String zhavg4=df2.format(zzhavg4);
      			}
 %>
 <div style="width:50px; height:<%=(100-zzhavg4)*3 %>px;  "></div>
<div style="width:50px; height:<%=zzhavg4*3 %>px; background-color:#0000FF"></div>
</div></td>
<%		
		double aallavg=(double)(ssjavg+ggeavg+zzhavg)/3;
			//DecimalFormat df1  = new DecimalFormat("###.00");
      			//String allavg=df1.format(aallavg);
		double aallavg2=(double)(ssjavg2+ggeavg2+zzhavg2)/3;
			//DecimalFormat df2  = new DecimalFormat("###.00");
      			//String allavg2=df2.format(aallavg2);
		double aallavg3=(double)(ssjavg3+ggeavg3+zzhavg3)/3;
			//DecimalFormat df3  = new DecimalFormat("###.00");
      			//String allavg3=df3.format(aallavg3);
		double aallavg4=(double)(ssjavg4+ggeavg4+zzhavg4)/3;
			//DecimalFormat df4  = new DecimalFormat("###.00");
      			//String allavg4=df4.format(aallavg4);
		 %> 
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
 <div style="width:50px; height:<%=(100-aallavg)*3 %>px;  "></div>
<div style="width:50px; height:<%=aallavg*3 %>px; background-color:#FF0000"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
 <div style="width:50px; height:<%=(100-aallavg2)*3 %>px;  "></div>
<div style="width:50px; height:<%=aallavg2*3 %>px; background-color:#FF0000"></div>
</div></td>
    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
 <div style="width:50px; height:<%=(100-aallavg3)*3 %>px;  "></div>
<div style="width:50px; height:<%=aallavg3*3 %>px; background-color:#FF0000"></div>
</div></td>
	    <td><div style="float:left;margin:0 5px;border:0;padding:0;">
 <div style="width:50px; height:<%=(100-aallavg4)*3 %>px;  "></div>
<div style="width:50px; height:<%=aallavg4*3 %>px; background-color:#FF0000"></div>
</div></td>
  </tr>
  <tr bgcolor="#CC99FF">
    <td><div align="center"><strong><span class="STYLE5">第一学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第二学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第三学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第四学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第一学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第二学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第三学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第四学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第一学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第二学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第三学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第四学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第一学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第二学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第三学期</span></strong></div></td>
    <td><div align="center"><strong><span class="STYLE5">第四学期</span></strong></div></td>
  </tr>
</table>


</body>
</html>