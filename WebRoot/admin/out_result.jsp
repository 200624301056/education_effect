<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.Inspector"%>
<%@ page import="jxl.Workbook"%>
<%@ page import="jxl.write.Label"%>
<%@ page import="jxl.write.WritableSheet"%>
<%@ page import="jxl.write.WritableWorkbook"%>
<%@ page import="util.DBUtil"%>
<%@ include file="conn.jsp" %>

<% 
	request.setCharacterEncoding("utf-8"); 
%>

<%
	String xlsx = request.getParameter("filepath");
	String xls = xlsx.substring(xlsx.length()-4);
	
	//excel2007
	if(xls.equals("xlsx")){
		try {
		FileInputStream fis = new FileInputStream(xlsx); 
		int num=xlsx.lastIndexOf("/");
		String xlss=xlsx.substring(num);  //文件流
		Connection conn=null;
		conn=DBUtil.getConnection();
		String sql="select * from inspector_gen";
		PreparedStatement stat=conn.prepareStatement(sql);
		ResultSet rst=stat.executeQuery();
//		String data[][]=null;
		List<Inspector> list=new ArrayList<Inspector>();
		
		while(rst.next()){
			Inspector ins=new Inspector();
			ins.setIdInspector_gen(rst.getLong("idInspector_gen"));
			ins.setStu_num(rst.getString("stu_num"));
			ins.setScore_gen(rst.getString("score_gen"));
			ins.setSchool(rst.getString("school"));
			ins.setClass_name(rst.getString("class_name"));
			ins.setGrade(rst.getString("grade"));
			ins.setTerm(rst.getString("term"));
			list.add(ins);
//			int i=0;
//			data[i][0]=rst.getLong("idInspector_gen");
//			i++;
		}
		FileOutputStream fos=new FileOutputStream(xlsx);
		File outFile=new File(xlss);
		WritableWorkbook workbook=Workbook.createWorkbook(fos);
		WritableSheet sheet=workbook.createSheet("MLDN资料",0);
		Label lab=null;
		for(int i=0;i<list.size();i++){
			Inspector ipr=list.get(i);
			lab=new Label(0,i, ipr.getStu_num());
			sheet.addCell(lab);
			lab=new Label(1,i, ipr.getScore_gen());
			sheet.addCell(lab);
			lab=new Label(2, i, ipr.getSchool());
			sheet.addCell(lab);
			lab=new Label(3, i, ipr.getClass_name());
			sheet.addCell(lab);
			lab=new Label(4, i, ipr.getGrade());
			sheet.addCell(lab);
			lab=new Label(5, i, ipr.getTerm());
			sheet.addCell(lab);
		}
//		for(int i=0;i<data.length;i++){
//			for(int j=0;j<data[i].length;j++){
//				lab=new Label(j,i,data[i][j]);
//				sheet.addCell(lab);
//			}
//		}
		workbook.write();
		workbook.close();
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
			int num=xlsx.lastIndexOf("/");
		String xlss=xlsx.substring(num);   //文件流
		Connection conn=null;
		conn=DBUtil.getConnection();
		String sql="select * from inspector_gen";
		PreparedStatement stat=conn.prepareStatement(sql);
		ResultSet rst=stat.executeQuery();
//		String data[][]=null;
		List<Inspector> list=new ArrayList<Inspector>();
		
		while(rst.next()){
			Inspector ins=new Inspector();
			ins.setIdInspector_gen(rst.getLong("idInspector_gen"));
			ins.setStu_num(rst.getString("stu_num"));
			ins.setScore_gen(rst.getString("score_gen"));
			ins.setSchool(rst.getString("school"));
			ins.setClass_name(rst.getString("class_name"));
			ins.setGrade(rst.getString("grade"));
			ins.setTerm(rst.getString("term"));
			list.add(ins);
//			int i=0;
//			data[i][0]=rst.getLong("idInspector_gen");
//			i++;
		}
		FileOutputStream fos=new FileOutputStream(xlsx);
		File outFile=new File(xlss);
		WritableWorkbook workbook=Workbook.createWorkbook(fos);
		WritableSheet sheet=workbook.createSheet("MLDN资料",0);
		Label lab=null;
		for(int i=0;i<list.size();i++){
			Inspector ipr=list.get(i);
			lab=new Label(0,i, ipr.getStu_num());
			sheet.addCell(lab);
			lab=new Label(1,i, ipr.getScore_gen());
			sheet.addCell(lab);
			lab=new Label(2, i, ipr.getSchool());
			sheet.addCell(lab);
			lab=new Label(3, i, ipr.getClass_name());
			sheet.addCell(lab);
			lab=new Label(4, i, ipr.getGrade());
			sheet.addCell(lab);
			lab=new Label(5, i, ipr.getTerm());
			sheet.addCell(lab);
		}
//		for(int i=0;i<data.length;i++){
//			for(int j=0;j<data[i].length;j++){
//				lab=new Label(j,i,data[i][j]);
//				sheet.addCell(lab);
//			}
//		}
		workbook.write();
		workbook.close();
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