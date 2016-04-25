/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class General extends ExecuteDB
{
	//定义类成员变量
	private long idinspector_gen;
	private String stu_num;
	private String stu_name;
	private String score_gen;
	private String score_sj;
	private String genSql;
	private String school;
	private String grade;
	private String class_name;
	private String term;
	
	
    //构造函数，对成员变量进行初始化赋值
	public General()
	{
		super();
		this.idinspector_gen=0;
		this.stu_num="";
		this.stu_name="";
		this.score_gen="";
		this.score_sj="";
		this.genSql="";
		this.school="";
		this.grade="";
		this.class_name="";
		this.term="";
	}

	//添加新用户，往admin_stu数据表中添加一条新记录
	public boolean addGCor()
	{
		this.genSql="insert into inspector_gen ";
		this.genSql=this.genSql + "(stu_num,stu_name,score_gen,score_sj,school,grade,class_name,term) ";
		this.genSql=this.genSql + "values('" + this.stu_num + "','" + this.stu_name + "','" + this.score_gen + "','" + this.score_sj + "','" + this.school+ "','" + this.grade+ "','" + this.class_name+ "','" + this.term+ "')";				

		boolean isAdd = super.exeSql(this.genSql);
                return isAdd;
	}
	//删除宿舍信息
     public boolean delete(String idinspector_gen)
        {
            this.genSql = "delete from inspector_gen where idinspector_gen in (";
            this.genSql = this.genSql + idinspector_gen +")";

            boolean isDelete = super.exeSql(this.genSql);
            return isDelete;
        }

	//修改couid对应的用户的信息
	public boolean modify_Gcor_info()
	{
		this.genSql="update inspector_gen set";
		this.genSql=this.genSql + " stu_num=" + "'" + this.stu_num + "',";
		this.genSql=this.genSql + " stu_name=" + "'" + this.stu_name + "',";
		this.genSql=this.genSql + " score_gen=" + "'" + this.score_gen + "',";
		this.genSql=this.genSql + " score_sj=" + "'" + this.score_sj + "',";
		this.genSql=this.genSql + " school=" + "'" + this.school + "',";
		this.genSql=this.genSql + " grade=" + "'" + this.grade + "',";
		this.genSql=this.genSql + " class_name=" + "'" + this.class_name + "',";	
		this.genSql=this.genSql + " term=" + "'" + this.term + "'";
		this.genSql=this.genSql + " where idinspector_gen='" + this.idinspector_gen + "'";
		boolean isUpdate = super.exeSql(this.genSql);
		return isUpdate;
	}


 	//获得couid对应的用户的信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
		this.genSql="select * from `inspector_gen` where idinspector_gen=";
		this.genSql=this.genSql + "'" + this.idinspector_gen + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.genSql);
			if (rs.next())
			{
				this.idinspector_gen=rs.getLong("idinspector_gen");
				this.stu_num=rs.getString("stu_num");
				this.stu_name=rs.getString("stu_name");
				this.score_gen=rs.getString("score_gen");
				this.score_sj=rs.getString("score_sj");
				this.school=rs.getString("school");
				this.grade=rs.getString("grade");
				this.class_name=rs.getString("class_name");			
				this.term=rs.getString("term");
				//System.out.println(stu_name+stu_num+sex+train_date+class_name+grade+school+hui_flag);
				return true;
			}
			else
			{
				return false;
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
	}

   	//判断用户名是否存在
	public boolean exist()
	{
		this.genSql="select * from `inspector_gen` ";
		this.genSql=this.genSql + " where stu_num='" + this.stu_num + "'";
		this.genSql=this.genSql + " and term='" + this.term + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.genSql);
			if (rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			return false;
		}
	}
	public ResultSet show_general(String school,String grade,String class_name,String term,String stu_name,String stu_num)
	{
   		List<Object> lists=new ArrayList<Object>();
   		StringBuffer sb=new StringBuffer();
		sb.append("select * from inspector_gen where 1=1 ");
		if(school !=null && school.length()>0){
			sb.append("and school=? ");
			lists.add(school);
		}
		if(grade !=null && grade.length()>0){
			sb.append("and grade=? ");
			lists.add(grade);
		}
		if(class_name !=null && class_name.length()>0){
			sb.append("and class_name=? ");
			lists.add(class_name);
		}
		if(term !=null && term.length()>0){
			sb.append("and term=? ");
			lists.add(term);
		}
		if(stu_name !=null && stu_name.length()>0){
			sb.append("and stu_name=? ");
			lists.add(stu_name);
		}
		if(stu_num !=null && stu_num.length()>0){
			sb.append("and stu_num=? ");
			lists.add(stu_num);
		}
		Connection conn=null;
		PreparedStatement stat=null;
		ResultSet rst=null;
		try
		{
			 conn=DBUtil.getConnection();
			 stat=conn.prepareStatement(sb.toString());
			 for(int i=0;i<lists.size();i++){
					stat.setObject(i+1,lists.get(i));
				}
			rst=stat.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rst;
	}

   	
   	
   	
   	
	public long getIdinspector_gen() {
		return idinspector_gen;
	}

	public void setIdinspector_gen(long idinspector_gen) {
		this.idinspector_gen = idinspector_gen;
	}

	public void setStu_num(String stu_num) {
		this.stu_num = stu_num;
	}
	public String getStu_num() {
		return this.stu_num;
	}
	//设置类成员变量stu_name的值
 	public void setSUname(String stu_name)
	{
		this.stu_name = stu_name;
	}

	//获取类成员变量stu_name的值
	public String getSUname()
	{
		return this.stu_name;
	}
	


	public void setScore_gen(String score_gen) {
		this.score_gen = score_gen;
	}
	public String getScore_gen() {
		return score_gen;
	}
	

	public void setScore_sj(String score_sj) {
		this.score_sj = score_sj;
	}
	public String getScore_sj() {
		return score_sj;
	}

	public String getGenSql() {
		return genSql;
	}

	public void setGenSql(String genSql) {
		this.genSql = genSql;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}
	
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}


	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}     
}


