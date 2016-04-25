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
	 	long score_g = 0;
	 	String score_gen = "";
	 	String school = "";
	 	String class_name = "";
	 	String grade = "";
	 	long term = 0; 
		String term_str = "";
	 	StringBuffer errors = new StringBuffer();//excel错误提示
		String sql= "insert into inspector_gen(stu_num,stu_name,score_gen,school,grade,class_name,term) values(?,?,?,?,?,?,?)";
		//循环取excel中 每一行的值
		for(int i=1;i<=totalRow;i++){  

		      row=sheet.getRow(i);  
		      //学号
			  cell=row.getCell((short) 0);  
		      stu_num=(long)cell.getNumericCellValue();
		      stu_num_str = String.valueOf(stu_num);  
		      if(stu_num_str.length()!=10 || stu_num_str.length()==0 || !stu_num_str.matches("\\d*")){
		      	errors.append("<p>excel中第"+(i+1)+"行-学号-长度不是10的数字;</p>");
		      }
		      //姓名
			  cell=row.getCell((short) 1);  
		      stu_name = cell.getStringCellValue();
		      if( stu_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-姓名-不能为空;</p>");
		      }
		      //分数
		      cell=row.getCell((short) 2);  
		      score_g=(long)cell.getNumericCellValue();
		      score_gen = String.valueOf(score_g);  
		      if(score_gen.length()>3 || score_gen.length()==0 || !score_gen.matches("\\d*")){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数-不能为空;</p>");
		      }
		      cell=row.getCell((short) 3);  
		      school = cell.getStringCellValue();
		      if( school.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学校名称-不能为空;</p>");
		      }
		      cell=row.getCell((short) 4);  
		      grade = cell.getStringCellValue();
		      if(grade.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-年级-不能为空;</p>");
		      }
		      cell=row.getCell((short) 5);  
		      class_name = cell.getStringCellValue(); 
		      if(class_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-班级-不能为空;</p>");
		      }

		      cell=row.getCell((short) 6);	      
		      term=(long)cell.getNumericCellValue();
		      term_str = String.valueOf(term); 
		      if(term_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学期名称-不能为空;</p>");
		      }	
		      //每一行没errors错误,则添加到数据库
		      if(errors.length()==0){
			      pst=conn.prepareStatement(sql);
			      pst.setString(1,stu_num_str);
			      pst.setString(2,stu_name);  
			      pst.setString(3,score_gen); 
			      pst.setString(4,school);
			      pst.setString(5,grade); 
			      pst.setString(6,class_name);	      
			      pst.setString(7,term_str);
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
	      	  out.print("<script>window.location.href='select.htm'</script>");
	     }else{
	     	  out.println(errors+"\n");
	     	  out.print("<p style='color: red'>请将excel中以成功导入的数据删除后,再修改excel中有错的数据从新导入！</p>");
	     	  out.print("<a href='import.htm'>返回excel批量导入页面</a>");
	     }
	     }catch(FileNotFoundException e){
	     	out.print("<script>alert('数据导入失败...')</script>"+e.getMessage()); 
	     	out.print("<script>window.location.href='select.htm'</script>");
	     }catch(IOException ex){  
	   	    out.print("<script>alert('数据导入失败...')</script>"+ex.getMessage()); 
	     	out.print("<script>window.location.href='select.htm'</script>");
	    }catch(SQLException exx){  
		    out.print("<script>alert('数据导入失败,是否重复导入部分数据...')</script>"+exx.getMessage()); 
	     	out.print("<script>window.location.href='select.htm'</script>");
	    }catch(IllegalStateException exxx){
	    	out.print("<script>alert('数据导入失败,查看excel中数据的录入是否合法...')</script>"+exxx.getMessage()); 
	     	out.print("<script>window.location.href='select.htm'</script>");
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
		long score_g = 0;     
	 	long stu_num = 0;      		//excel中stu_num的类型
		String stu_num_str = "";	//传入数据库的stu_num类型型
	 	String stu_name = "";
	 	String score_gen = "";
	 	String school = "";
	 	String class_name = "";
	 	String grade = "";
	 	long term = 0; 
		String term_str = "";
	 	StringBuffer errors = new StringBuffer();//excel错误提示
		String sql= "insert into inspector_gen(stu_num,stu_name,score_gen,school,grade,class_name,term) values(?,?,?,?,?,?,?)";
		//循环取excel中 每一行的值
		for(int i=1;i<=totalRow;i++){  
			//这里假设excel的每一行值都不为空,如有空值则加判断 if (row.GetCell((short) 7)==null){ XXX=""}
		      row=sheet.getRow(i);  
		      //学号
			  cell=row.getCell((short) 0);  
		      stu_num=(long)cell.getNumericCellValue();
		      stu_num_str = String.valueOf(stu_num);  
		      if(stu_num_str.length()!=10 || stu_num_str.length()==0 || !stu_num_str.matches("\\d*")){
		      	errors.append("<p>excel中第"+(i+1)+"行-学号-长度不是10的数字;</p>");
		      }
		      //姓名
			  cell=row.getCell((short) 1);  
		      stu_name = cell.getStringCellValue();
		      if( stu_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-姓名-不能为空;</p>");
		      }
		      //分数
		      cell=row.getCell((short) 2);  
		      score_g=(long)cell.getNumericCellValue();
		      score_gen = String.valueOf(score_g);  
		      if(score_gen.length()>3 || score_gen.length()==0 || !score_gen.matches("\\d*")){
		      	errors.append("<p>excel中第"+(i+1)+"行-分数-不能为空;</p>");
		      }
		      cell=row.getCell((short) 3);  
		      school = cell.getStringCellValue();
		      if( school.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学校名称-不能为空;</p>");
		      }
		      cell=row.getCell((short) 4);  
		      grade = cell.getStringCellValue();
		      if(grade.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-年级-不能为空;</p>");
		      }
		      cell=row.getCell((short) 5);  
		      class_name = cell.getStringCellValue(); 
		      if(class_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-班级-不能为空;</p>");
		      }

		      cell=row.getCell((short) 6);	      
		      term=(long)cell.getNumericCellValue();
		      term_str = String.valueOf(term); 
		      if(term_str.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学期名称-不能为空;</p>");
		      }	
		      //每一行没errors错误,则添加到数据库
		      if(errors.length()==0){
			      pst=conn.prepareStatement(sql);
			      pst.setString(1,stu_num_str);
			      pst.setString(2,stu_name);  
			      pst.setString(3,score_gen); 
			      pst.setString(4,school);
			      pst.setString(5,grade); 
			      pst.setString(6,class_name);		      
			      pst.setString(7,term_str);
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
	      	  out.print("<script>window.location.href='select.htm'</script>");
	     }else{
	     	  out.println(errors+"\n");
	     	  out.print("<p style='color: red'>请将excel中以成功导入的数据删除后,再修改excel中有错的数据从新导入！</p>");
	     	  out.print("<a href='import.htm'>返回excel批量导入页面</a>");
	     }
	     }catch(FileNotFoundException e){
	     	out.print("<script>alert('数据导入失败e...')</script>"+e.getMessage()); 
	     	out.print("<script>window.location.href='select.htm'</script>");
	     }catch(IOException ex){  
	   	    out.print("<script>alert('数据导入失败ex...')</script>"+ex.getMessage()); 
	     	out.print("<script>window.location.href='select.htm'</script>");
	    }catch(SQLException exx){  
		    out.print("<script>alert('数据导入失败,是否重复导入部分数据...')</script>"+exx.getMessage()); 
	     	out.print("<script>window.location.href='select.htm'</script>");
	    }catch(IllegalStateException exxx){
	    	out.print("<script>alert('数据导入失败exxx...')</script>"+exxx.getMessage()); 
	     	//out.print("<script>window.location.href='select.htm'</script>");
	    }
	}						
%>