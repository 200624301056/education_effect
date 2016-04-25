<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.poi.xssf.usermodel.*"%>
<%@ page import="org.apache.poi.hssf.usermodel.*"%>
<%@ page import="java.io.*"%>
<%@ include file="conn.jsp"%>
<% 
	request.setCharacterEncoding("utf-8"); 
%>

<%
	String xlsx = request.getParameter("filepath");
	String xls = xlsx.substring(xlsx.length()-4);
	Connection conn = getConnection();
	PreparedStatement pst = null;
	//excel2007
	if(xls.equals("xlsx")){
		try {
		FileInputStream fis = new FileInputStream(xlsx);   //文件流
		XSSFWorkbook workbook = new XSSFWorkbook(fis);  //创建工作簿
		XSSFSheet sheet = workbook.getSheetAt(0);  //工作表,0表示一个表
		XSSFRow row = null;  //excel的行
		XSSFCell cell = null; //列
		int totalRow = sheet.getLastRowNum(); //excel总记录数
     		long stu_num = 0;      		//excel中stu_num的类型
		 	String stu_num_str = "";	//传入数据库的stu_num类型型
			String stu_name = "";
			long score_fis = 0; 
		 	String score_fis_str = "";	 	
			long score_sec = 0;	
			String score_sec_str = "";
			long score_thr = 0; 
			String score_thr_str = "";
			long score_fou = 0; 
			String score_fou_str = "";
		 	
	 	StringBuffer errors = new StringBuffer();//excel错误提示
		String sql= "insert into score_zhsz(stu_num, stu_name, score_fis, score_sec, score_thr, score_fou) values(?,?,?,?,?,?)";
		//循环取excel中 每一行的值
		for(int i=1;i<=totalRow;i++){  
			//这里假设excel的每一行值都不为空,如有空值则加判断 if (row.GetCell((short) 7)==null){ XXX=""}
		      row=sheet.getRow(i);  
	
			  //学生学号
		      cell=row.getCell((short) 0);  
		      stu_num=(long)cell.getNumericCellValue();
		      stu_num_str = String.valueOf(stu_num);  
		      if(stu_num_str.length()!=10 || stu_num_str.length()==0 || !stu_num_str.matches("\\d*")){
		      	errors.append("<p>excel中第"+(i+1)+"行-学号-长度不是10的数字;</p>");
		      }
			  
		      //学生姓名
		      cell=row.getCell((short) 1);
		      stu_name=cell.getStringCellValue().toString();		      
		      if(stu_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学生姓名-不能为空;</p>");
		      }


		      //分数1
		      cell=row.getCell((short) 2);
		     // score_fis=cell.getStringCellValue().toString();
		      score_fis=(long)cell.getNumericCellValue();
		      score_fis_str = String.valueOf(score_fis); 
		      if(score_fis_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数1-不能为空;</p>");
		      }
		      //分数2
		      cell=row.getCell((short) 3);
		      score_sec=(long)cell.getNumericCellValue();
		      score_sec_str = String.valueOf(score_sec); 
		      if(score_sec_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数2-不能为空;</p>");
		      }
		      //分数3
		      cell=row.getCell((short) 4);
		      //score_thr=cell.getStringCellValue().toString();
		      score_thr=(long)cell.getNumericCellValue();
		      score_thr_str = String.valueOf(score_thr); 
		      if(score_thr_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数3-不能为空;</p>");
		      }
		      //分数4
		      cell=row.getCell((short) 5);
		      //score_fou=cell.getStringCellValue().toString();
		      score_fou=(long)cell.getNumericCellValue();
		      score_fou_str = String.valueOf(score_fou); 
		      if(score_fou_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数4-不能为空;</p>");
		      }
		      //分数5
		    
		      if(errors.length()==0){
			      pst=conn.prepareStatement(sql);
			      pst.setString(1,stu_num_str);  
			      pst.setString(2,stu_name);  
			      pst.setString(3,score_fis_str);  
			      pst.setString(4,score_sec_str);  
			      pst.setString(5,score_thr_str);
			      pst.setString(6,score_fou_str);
			      pst.execute();
			      out.println("<p style='color: red'>excel第"+(i+1)+"行数据导入成功;</p>");
		     }else{
				continue;		     
		     }
	     }
	     if(errors.length()== 0){
	     	  pst.close();  
	      	  conn.close();
	     	  out.print("<script>alert('数据已成功导入...')</script>");
	      	  out.print("<script>window.close();</script>");
	     }else{
	     	  out.println(errors+"\n");
	     	  out.print("<p style='color: red'>请将excel中以成功导入的数据删除后,再修改excel中有错的数据从新导入！</p>");
	     	  out.print("<a href='import.htm'>返回excel批量导入页面</a>");
	     }
	     }catch(FileNotFoundException e){
	     	out.print("<script>alert('数据导入失败...')</script>"+e.getMessage()); 
	     	out.print("<script>window.close();</script>");
	     }catch(IOException ex){  
	   	    out.print("<script>alert('数据导入失败...')</script>"+ex.getMessage()); 
	     	out.print("<script>window.close();</script>");
	    }catch(SQLException exx){  
		    out.print("<script>alert('数据导入失败,是否重复导入部分数据...')</script>"+exx.getMessage()); 
	     	out.print("<script>window.close();</script>");
	    }catch(IllegalStateException exxx){
	    	out.print("<script>alert('数据导入失败,查看excel中数据的录入是否合法...')</script>"+exxx.getMessage()); 
	     	//out.print("<script>window.location.href='select.htm'</script>");
	    }
	}else{
		//excel2003
		try{
			FileInputStream fin = new FileInputStream(xlsx);
			HSSFWorkbook workbook=new HSSFWorkbook(fin);
			HSSFSheet sheet=workbook.getSheetAt(0);
			HSSFRow row=null;//对应excel的行  
     		HSSFCell cell=null;//对应excel的列  
     		int totalRow=sheet.getLastRowNum();//得到excel的总记录条数
      		long stu_num = 0;      		//excel中stu_num的类型
		 	String stu_num_str = "";	//传入数据库的stu_num类型型
			String stu_name = "";
			long score_fis = 0; 
		 	String score_fis_str = "";	 	
			long score_sec = 0;	
			String score_sec_str = "";
			long score_thr = 0; 
			String score_thr_str = "";
			long score_fou = 0; 
			String score_fou_str = "";

		 	StringBuffer errors = new StringBuffer();//excel错误提示
			String sql= "insert into score_zhsz(stu_num,stu_name,score_fis,score_sec,score_thr,score_fou) values(?,?,?,?,?,?)";
			//循环取excel中 每一行的值
			for(int i=1;i<=totalRow;i++){  
			      row=sheet.getRow(i);  
			   //学生学号
		      cell=row.getCell((short) 0);  
		      stu_num=(long)cell.getNumericCellValue();
		      stu_num_str = String.valueOf(stu_num);  
		      if(stu_num_str.length()!=10 || stu_num_str.length()==0 || !stu_num_str.matches("\\d*")){
		      	errors.append("<p>excel中第"+(i+1)+"行-学号-长度不是10的数字;</p>");
		      }
			  
		      //学生姓名
		      cell=row.getCell((short) 1);
		      stu_name=cell.getStringCellValue().toString();		      
		      if(stu_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学生姓名-不能为空;</p>");
		      }


		      //分数1
		      cell=row.getCell((short) 2);
		     // score_fis=cell.getStringCellValue().toString();
		      score_fis=(long)cell.getNumericCellValue();
		      score_fis_str = String.valueOf(score_fis); 
		      if(score_fis_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数1-不能为空;</p>");
		      }
		      //分数2
		      cell=row.getCell((short) 3);
		      score_sec=(long)cell.getNumericCellValue();
		      score_sec_str = String.valueOf(score_sec); 
		      if(score_sec_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数2-不能为空;</p>");
		      }
		      //分数3
		      cell=row.getCell((short) 4);
		      //score_thr=cell.getStringCellValue().toString();
		      score_thr=(long)cell.getNumericCellValue();
		      score_thr_str = String.valueOf(score_thr); 
		      if(score_thr_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数3-不能为空;</p>");
		      }
		      //分数4
		      cell=row.getCell((short) 5);
		      //score_fou=cell.getStringCellValue().toString();
		      score_fou=(long)cell.getNumericCellValue();
		      score_fou_str = String.valueOf(score_fou); 
		      if(score_fou_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数4-不能为空;</p>");
		      }	  
		     
		      if(errors.length()==0){
			      pst=conn.prepareStatement(sql);
			      pst.setString(1,stu_num_str);  
			      pst.setString(2,stu_name);  
			      pst.setString(3,score_fis_str);  
			      pst.setString(4,score_sec_str);  
			      pst.setString(5,score_thr_str);
			      pst.setString(6,score_fou_str);
			      pst.execute();
			      out.println("<p style='color: red'>excel第"+(i+1)+"行数据导入成功;</p>");
			     }else{
					continue;		     
			     }
	     }
	     if(errors.length()== 0){
	     	  pst.close();  
	      	  conn.close();
	     	  out.print("<script>alert('数据已成功导入...')</script>");
	      	  out.print("<script>window.close();</script>");
	     }else{
	     	  out.println(errors+"\n");
	     	  out.print("<p style='color: red'>请将excel中以成功导入的数据删除后,再修改excel中有错的数据从新导入！</p>");
	     	  out.print("<a href='import_Intscore.htm'>返回excel批量导入页面</a>");
	     }
	     }catch(FileNotFoundException e){
	     	out.print("<script>alert('数据导入失败e...')</script>"+e.getMessage()); 
	     	out.print("<script>window.close();</script>");
	     }catch(IOException ex){  
	   	    out.print("<script>alert('数据导入失败ex...')</script>"+ex.getMessage()); 
	     	out.print("<script>window.close();</script>");
	     }catch(SQLException exx){  
		    out.print("<script>alert('数据导入失败,是否重复导入部分数据...')</script>"+exx.getMessage()); 
	     	out.print("<script>window.close();</script>");
	     }catch(IllegalStateException exxx){
	    	out.print("<script>alert('数据导入失败exxx...')</script>"+exxx.getMessage()); 
	     	//out.print("<script>window.close();</script>");
	    }
	}		
%>