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
     		long stu_num = 0;      //excel中stu_num的类型
		 	String stu_num_str = "";//传入数据库的stu_num类型型
			String stu_name = "";
		 	String sex = "";
		 	int sex_int = 0;
			String train_date = "";	
			String school = "";
			String grade = "";
			String class_name = "";
		 	String hui_flag = "";
		 	int hui_flag_int= 0;
	 	StringBuffer errors = new StringBuffer();//excel错误提示
		String sql= "insert into admin_stu(stu_num, stu_name, sex, train_date, school, grade, class_name, hui_flag) values(?,?,?,?,?,?,?,?)";
		//循环取excel中 每一行的值
		for(int i=1;i<=totalRow;i++){  
			//这里假设excel的每一行值都不为空,如有空值则加判断 if (row.GetCell((short) 7)==null){ XXX=""}
		      row=sheet.getRow(i);  
	
			  //学生学号
		      cell=row.getCell((short) 0);  
		      stu_num=(long)cell.getNumericCellValue();
		      stu_num_str = String.valueOf(stu_num);  
		      if(stu_num_str.length()!=10 || stu_num_str.length()==0 || !stu_num_str.matches("\\d*")){
		      	errors.append("<p>excel中第"+(i+1)+"行-学单号-长度不为10为数字;</p>");
		      }
			  
		      //学生姓名
		      cell=row.getCell((short) 1);
		      stu_name=cell.getStringCellValue().toString();
		      if(stu_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学生姓名-不能为空;</p>");
		      }
		      //性别
		      cell=row.getCell((short) 2);  
		      sex=cell.getStringCellValue().toString();
		      if(sex.equals("男")){
		      	sex_int = 1;
		      }else if(sex.equals("女")){
		      	sex_int = 2;
		      }else{
		      	errors.append("<p>excel中第"+(i+1)+"行-性别-须为男或女;</p>");
		      }
			  //培训日期  
		      cell=row.getCell((short) 3);  
		      train_date=cell.getStringCellValue().toString();
		      if(train_date.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-培训日期-不能为空;</p>");
		      } 
		      //学校名称
		      cell=row.getCell((short) 4);
		      school=cell.getStringCellValue().toString();
		      if(school.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学校名称-不能为空;</p>");
		      }
		      //年级名称
		      cell=row.getCell((short) 5);
		      grade=cell.getStringCellValue().toString();
		      if(grade.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-年级名称-不能为空;</p>");
		      }
		      //班级名称
		      cell=row.getCell((short) 6);
		      class_name=cell.getStringCellValue().toString();
		      if(class_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-班级名称-不能为空;</p>");
		      }
		      //是否回族
		      cell=row.getCell((short) 7);  
		      hui_flag=cell.getStringCellValue().toString();
		      if(hui_flag.equals("是")){
		      	hui_flag_int = 1;
		      }else if(hui_flag.equals("否")){
		      	hui_flag_int = 2;
		      }else{
		      	errors.append("<p>excel中第"+(i+1)+"行-是否回族 -须为是或否;</p>");
		      }
		      if(errors.length()==0){
			      pst=conn.prepareStatement(sql);
			      pst.setString(1,stu_num_str);  
			      pst.setString(2,stu_name);  
			      pst.setInt(3,sex_int);  
			      pst.setString(4,train_date);  
			      pst.setString(5,school);
			      pst.setString(6, grade);
			      pst.setString(7,class_name);  
			      pst.setInt(8,hui_flag_int);
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
	     	out.print("<script>window.close();</script>");
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
     		long stu_num = 0;      //excel中stu_num的类型
		 	String stu_num_str = "";//传入数据库的stu_num类型型
			String stu_name = "";
		 	String sex = "";
		 	int sex_int = 0;
			String train_date = "";	
			String school = "";
			String grade = "";
			String class_name = "";
		 	String hui_flag = "";
		 	int hui_flag_int= 0;

		 	StringBuffer errors = new StringBuffer();//excel错误提示
			String sql= "insert into admin_stu(stu_num, stu_name, sex, train_date, school, grade, class_name, hui_flag) values(?,?,?,?,?,?,?,?)";
			//循环取excel中 每一行的值
			for(int i=1;i<=totalRow;i++){  
			      row=sheet.getRow(i);  
			  //学生学号
		      cell=row.getCell((short) 0);  
		      stu_num=(long)cell.getNumericCellValue();
		      stu_num_str = String.valueOf(stu_num);  
		      if(stu_num_str.length()!=10 || stu_num_str.length()==0 || !stu_num_str.matches("\\d*")){
		      	errors.append("<p>excel中第"+(i+1)+"行-学号-长度不为6为数字;</p>");
		      }
			  
		      //学生姓名
		      cell=row.getCell((short) 1);
		      stu_name=cell.getStringCellValue().toString();
		      if(stu_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学生姓名-不能为空;</p>");
		      }
		      //性别
		      cell=row.getCell((short) 2);  
		      sex=cell.getStringCellValue().toString();
		      if(sex.equals("男")){
		      	sex_int = 1;
		      }else if(sex.equals("女")){
		      	sex_int = 2;
		      }else{
		      	errors.append("<p>excel中第"+(i+1)+"行-性别-须为男或女;</p>");
		      }
			  //培训日期  
		      cell=row.getCell((short) 3);  
		      train_date=cell.getStringCellValue().toString();
		      if(train_date.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-培训日期-不能为空;</p>");
		      } 
		      //学校名称
		      cell=row.getCell((short) 4);
		      school=cell.getStringCellValue().toString();
		      if(school.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-学校名称-不能为空;</p>");
		      }
		      //年级名称
		      cell=row.getCell((short) 5);
		      grade=cell.getStringCellValue().toString();
		      if(grade.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-年级名称-不能为空;</p>");
		      }
		      //班级名称
		      cell=row.getCell((short) 6);
		      class_name=cell.getStringCellValue().toString();
		      if(class_name.length()==0){
		      	errors.append("<p>excel中第"+(i+1)+"行-班级名称-不能为空;</p>");
		      }
		      //是否回族
		      cell=row.getCell((short) 7);  
		      hui_flag=cell.getStringCellValue().toString();
		      if(hui_flag.equals("是")){
		      	hui_flag_int = 1;
		      }else if(hui_flag.equals("否")){
		      	hui_flag_int = 2;
		      }else{
		      	errors.append("<p>excel中第"+(i+1)+"行-是否回族 -须为是或否;</p>");
		      }
		      if(errors.length()==0){
			      pst=conn.prepareStatement(sql);
			      pst.setString(1,stu_num_str);  
			      pst.setString(2,stu_name);  
			      pst.setInt(3,sex_int);  
			      pst.setString(4,train_date);  
			      pst.setString(5,school);
			      pst.setString(6, grade);
			      pst.setString(7,class_name);  
			      pst.setInt(8,hui_flag_int);
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
	     	out.print("<script>window.close();</script>");
	    }
	}		
%>