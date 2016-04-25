<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

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
	<script type="text/javascript">  
            function myCheck()  
            {  
               for(var i=0;i<document.form1.elements.length-1;i++)  
               {  
                  if(document.form1.elements[i].value=="")  
                  {  
                     alert("所有选项都必须选择！！！");  
                     document.form1.elements[i].focus();  
                     return false;  
                  }  
               }  
               return true;  
                
            }
		  function myCheck2()  
            {  
               for(var i=0;i<document.form2.elements.length-1;i++)  
               {  
                  if(document.form2.elements[i].value=="")  
                  {  
                     alert("还有选项没填写！！！");  
                     document.form2.elements[i].focus();  
                     return false;  
                  }  
               }  
               return true;  
                
            }    
        </script> 

<body>
<table width="100%" border="0">
  <tr><td width="18%"> <p align="left">选择要分配宿舍的学生： </td> 
    <td width="82%">
     <form action="" method="post" name="form1" onSubmit="return myCheck()">
        &nbsp;&nbsp;
                <select name="school">
                  <option value="">--选择学校--</option>
                  <option value="一中">一中</option>
                  <option value="二中">二中</option>
                  <option value="十四中">白城十四中</option>
                </select>
        &nbsp;&nbsp;
        <select name="grade">
          <option value="">--选择年级--</option>
          <option value="高一">高一</option>
          <option value="高二">高二</option>
        </select>
        &nbsp;&nbsp;
		        <select name="sex">
          <option value="">--选择性别--</option>
          <option value="男">男</option>
          <option value="女">女</option>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="Submit" name="Submit" value="提交">
      <p>
    </form></td>
  </tr>

  <tr>
     <td>&nbsp;</td>
  <td>
    <%
	request.setCharacterEncoding("gb2312");
	String school="";
	String grade="";
	//String class_name="";
	String term="";
	String sex="";
	String class_n="";
	 school=request.getParameter("school");
	 grade=request.getParameter("grade");
	// class_name=request.getParameter("class_name");
	// term=request.getParameter("term"); 
	 sex=request.getParameter("sex");
	if (school!=null && grade!=null && sex!=null)
	{ class_n=school+grade+sex+"生";
	}else
	{ class_n="全校";}
	
	ResultSet rs = Dormitory.show_dor_dis(school,grade,sex);
	pages.initialize(rs,12);
	String strPage=null;
	int showCount=0;
	int showPage = 1;
	int pageCount = 0;
	//获取跳转到的目的页面

	pageCount=pages.getPageCount();
	showCount=pages.getRowCount();	
	int lastnum=0;
	if (showCount<=12){
	lastnum=showCount;
	}else{
	lastnum=showCount%12;
	}
	//获取要显示的数据集合
	Vector vData=pages.getPage(showPage);	
	%>	
	<%=class_n%>同学共<font color="#FF0000"><%=showCount%></font>名/每间宿舍能够分配<font color=red>12</font>名同学/共需要分配<font color=red><%=pages.getPageCount()%></font>间宿舍/最后一间宿舍分配<font color=red><%=lastnum%></font>人

	
	</td>
 
  </tr>
  <tr>
    <td colspan="2">选择要分配的寝室：</td>
  </tr>
  <tr>
    <td colspan="2">
	  <form name="form2" action="admin_dor_disok.jsp" method="post" onSubmit="return myCheck2()">
      <table width="100%" border="0">
        <tr>
          <td width="3%"><div align="right">宿<br>舍<br>编<br>号</div></td>
          <td width="97%"><%ResultSet rsd = Dormitory.show_dor();
		  //if (rsd.next()){
		  int j=0;
		  int scount=0;
		   while(rsd.next()){
		   	scount=rsd.getInt(6);
		   if(scount>0){
		   %>
		  <input name="dornum" type="checkbox" value="<%=rsd.getString(2)%>" disabled="disabled"><%=rsd.getString(2)%>(<%=scount%>)  
		   <%}
		   else{		   
			%>
		     <input name="dornum" type="checkbox" value="<%=rsd.getString(2)%>" ><%=rsd.getString(2)%>(<font color="#FF0000"> <%=scount%></font>)  
		   <%  }
		   j=j+1;
		   if (j%15==0){		//每隔15个换行输出
		   %><p><%
		   			
		   }
		   }
		   //}
		  // else {out.println("暂无宿舍信息");}
		   %></td>
         
          </tr>
		        <tr>
          <td>&nbsp;&nbsp;</td>
          <td colspan="8">输入班主任姓名：
            <input name="class_teacher" type="text">&nbsp;&nbsp;
			选择学期：   
			 <select name="term">
		  	<option value="" >--选择学期--</option>
            <option value="1">第一学期</option>
            <option value="2">第二学期</option>
            <option value="3">第三学期</option>
            <option value="4">第四学期</option> </select></td>
          </tr>
        <tr>
          <td><input name="school" type="hidden" value="<%=school%>">
          <input name="grade" type="hidden" value="<%=grade%>">
          <input name="sex" type="hidden" value="<%=sex%>"></td>
          <td colspan="8"><div align="center">
            <input type="submit" name="Submit2" value="确认分配">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="重置">
          </div></td>
          </tr>
      </table>
	  </form>      </td>
  </tr>
</table>

</body>
</html>
