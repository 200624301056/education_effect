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
                     alert("����ѡ�����ѡ�񣡣���");  
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
                     alert("����ѡ��û��д������");  
                     document.form2.elements[i].focus();  
                     return false;  
                  }  
               }  
               return true;  
                
            }    
        </script> 

<body>
<table width="100%" border="0">
  <tr><td width="18%"> <p align="left">ѡ��Ҫ���������ѧ���� </td> 
    <td width="82%">
     <form action="" method="post" name="form1" onSubmit="return myCheck()">
        &nbsp;&nbsp;
                <select name="school">
                  <option value="">--ѡ��ѧУ--</option>
                  <option value="һ��">һ��</option>
                  <option value="����">����</option>
                  <option value="ʮ����">�׳�ʮ����</option>
                </select>
        &nbsp;&nbsp;
        <select name="grade">
          <option value="">--ѡ���꼶--</option>
          <option value="��һ">��һ</option>
          <option value="�߶�">�߶�</option>
        </select>
        &nbsp;&nbsp;
		        <select name="sex">
          <option value="">--ѡ���Ա�--</option>
          <option value="��">��</option>
          <option value="Ů">Ů</option>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="Submit" name="Submit" value="�ύ">
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
	{ class_n=school+grade+sex+"��";
	}else
	{ class_n="ȫУ";}
	
	ResultSet rs = Dormitory.show_dor_dis(school,grade,sex);
	pages.initialize(rs,12);
	String strPage=null;
	int showCount=0;
	int showPage = 1;
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
	Vector vData=pages.getPage(showPage);	
	%>	
	<%=class_n%>ͬѧ��<font color="#FF0000"><%=showCount%></font>��/ÿ�������ܹ�����<font color=red>12</font>��ͬѧ/����Ҫ����<font color=red><%=pages.getPageCount()%></font>������/���һ���������<font color=red><%=lastnum%></font>��

	
	</td>
 
  </tr>
  <tr>
    <td colspan="2">ѡ��Ҫ��������ң�</td>
  </tr>
  <tr>
    <td colspan="2">
	  <form name="form2" action="admin_dor_disok.jsp" method="post" onSubmit="return myCheck2()">
      <table width="100%" border="0">
        <tr>
          <td width="3%"><div align="right">��<br>��<br>��<br>��</div></td>
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
		   if (j%15==0){		//ÿ��15���������
		   %><p><%
		   			
		   }
		   }
		   //}
		  // else {out.println("����������Ϣ");}
		   %></td>
         
          </tr>
		        <tr>
          <td>&nbsp;&nbsp;</td>
          <td colspan="8">���������������
            <input name="class_teacher" type="text">&nbsp;&nbsp;
			ѡ��ѧ�ڣ�   
			 <select name="term">
		  	<option value="" >--ѡ��ѧ��--</option>
            <option value="1">��һѧ��</option>
            <option value="2">�ڶ�ѧ��</option>
            <option value="3">����ѧ��</option>
            <option value="4">����ѧ��</option> </select></td>
          </tr>
        <tr>
          <td><input name="school" type="hidden" value="<%=school%>">
          <input name="grade" type="hidden" value="<%=grade%>">
          <input name="sex" type="hidden" value="<%=sex%>"></td>
          <td colspan="8"><div align="center">
            <input type="submit" name="Submit2" value="ȷ�Ϸ���">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="����">
          </div></td>
          </tr>
      </table>
	  </form>      </td>
  </tr>
</table>

</body>
</html>
