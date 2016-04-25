/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

import java.sql.*;

public class Course extends ExecuteDB
{
	//定义类成员变量
	private long couid;
	private String xueke;
	private String course_num;
	private String course_name;
	private String course_score;
	private String course_type;
	private String couSql;
	
	
    //构造函数，对成员变量进行初始化赋值
	public Course()
	{
		super();
		this.couid=0;
		this.xueke="";
		this.course_num="";
		this.course_name="";
		this.course_score="";
		this.course_type="";
	}

	//添加新用户，往admin_stu数据表中添加一条新记录
	public boolean addCor()
	{
		this.couSql="insert into course ";
		this.couSql=this.couSql + "(course_num,course_name,course_score,course_type) ";
		this.couSql=this.couSql + "values('" + this.course_num + "','" + this.course_name + "','" + this.course_score + "','" + this.course_type + "')";				

		boolean isAdd = super.exeSql(this.couSql);
                return isAdd;
	}
	//删除宿舍信息
     public boolean delete(String scouid)
        {
            this.couSql = "delete from course where couid in (";
            this.couSql = this.couSql + scouid +")";

            boolean isDelete = super.exeSql(this.couSql);
            return isDelete;
        }

	//修改couid对应的用户的信息
	public boolean modify_cor_info()
	{
		this.couSql="update course set";
		this.couSql=this.couSql + " course_num=" + "'" + this.course_num + "',";
		this.couSql=this.couSql + " course_name=" + "'" + this.course_name + "',";
		this.couSql=this.couSql + " course_score=" + "'" + this.course_score + "',";
		this.couSql=this.couSql + " course_type=" + "'" + this.course_type + "'";
		this.couSql=this.couSql + " where couid='" + this.couid + "'";
		boolean isUpdate = super.exeSql(this.couSql);
		return isUpdate;
	}


 	//获得couid对应的用户的信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
		this.couSql="select * from `course` where couid=";
		this.couSql=this.couSql + "'" + this.couid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.couSql);
			if (rs.next())
			{
				this.couid=rs.getLong("couid");
				this.course_num=rs.getString("course_num");
				this.course_name=rs.getString("course_name");
				this.course_score=rs.getString("course_score");
				this.course_type=rs.getString("course_type");
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
		this.couSql="select * from `course` ";
		this.couSql=this.couSql + " where course_num='" + this.course_num + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.couSql);
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
   	public ResultSet show_cor()
	{
		this.couSql="select couid,course_num,course_name,course_score,course_type from `course` order by couid asc";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.couSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}
            



	//设置类成员变量couid的值
	public void setCouid(long couid)
	{
		this.couid = couid;
	}

	//获取类成员变量couid的值
	public long getCouid()
	{
		return this.couid;
	}
	//设置类成员变量course_num的值
	public void setCourse_num( String course_num)
	{
		this.course_num = course_num;
	}

	//获取类成员变量course_num的值
	public String getCourse_num()
	{
		return this.course_num;
	}
	

	//设置类成员变量stu_name的值
 	public void setCourse_name(String course_name)
	{
		this.course_name = course_name;
	}

	//获取类成员变量stu_name的值
	public String getCourse_name()
	{
		return this.course_name;
	}
	//设置类成员变量course_score的值
 	public void setCourse_score(String course_score)
	{
		this.course_score = course_score;
	}

	//获取类成员变量course_score的值
	public String getCourse_score()
	{
		return this.course_score;
	}
	//设置类成员变量course_score的值
 	public void setCourse_type(String course_type)
	{
		this.course_type = course_type;
	}

	//获取类成员变量course_score的值
	public String getCourse_type()
	{
		return this.course_type;
	}

}


