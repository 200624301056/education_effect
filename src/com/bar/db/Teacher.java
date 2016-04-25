/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

import java.sql.*;

public class Teacher extends ExecuteDB
{
	//定义类成员变量
//	private long stuid;
	private String tea_num;
	private String tea_name;
	private String tea_sex;
	private String tea_age;
	private String tea_zhicheng;
	private String tea_xueke;
	private String tel;
	private String teaSql;
	
    //构造函数，对成员变量进行初始化赋值
	public Teacher()
	{
		super();
		//this.tea_num=0;
		this.tea_num="";
		this.tea_name="";
		this.tea_sex="";
		this.tel="";
	}

	//添加新用户，往admin_stu数据表中添加一条新记录
	public boolean addtea()
	{

		this.teaSql="insert into admin_teacher ";
		this.teaSql=this.teaSql + "(tea_num,tea_name,tea_sex,tel,tea_age,tea_zhicheng,tea_xueke) ";
		this.teaSql=this.teaSql + "values('" + this.tea_num + "','" + this.tea_name + "','" + this.tea_sex + "','" + this.tel + "','" + this.tea_age + "','" + this.tea_zhicheng + "','" + this.tea_xueke + "')";				

		boolean isAdd = super.exeSql(this.teaSql);
                return isAdd;
	}
	//删除学生信息
     public boolean delete(String sTeaID)
        {
            this.teaSql = "delete from admin_teacher where tea_num in (";
            this.teaSql = this.teaSql + sTeaID +")";

            boolean isDelete = super.exeSql(this.teaSql);
            return isDelete;
        }

	//修改stuDentid对应的用户的信息
	public boolean modify_tea_info()
	{
		this.teaSql="update admin_teacher set";
		//this.teaSql=this.teaSql + " tea_num=" + "'" + this.tea_num + "',";
		this.teaSql=this.teaSql + " tea_name=" + "'" + this.tea_name + "',";
		this.teaSql=this.teaSql + " tea_sex=" + "'" + this.tea_sex + "',";
		this.teaSql=this.teaSql + " tel=" + "'" + this.tel + "',";
		this.teaSql=this.teaSql + " tea_age=" + "'" + this.tea_age + "',";
		this.teaSql=this.teaSql + " tea_zhicheng=" + "'" + this.tea_zhicheng + "',";
		this.teaSql=this.teaSql + " tea_xueke=" + "'" + this.tea_xueke + "'";
		this.teaSql=this.teaSql + " where tea_num='" + this.tea_num + "'";
		boolean isUpdate = super.exeSql(this.teaSql);
		return isUpdate;
	}


 	//获得stuid对应的用户的信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
		this.teaSql="select * from `admin_teacher` where tea_num=";
		this.teaSql=this.teaSql + "'" + this.tea_num + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.teaSql);
			if (rs.next())
			{
				//this.stuid=rs.getLong("stuid");
				this.tea_num=rs.getString("tea_num");
				this.tea_name=rs.getString("tea_name");
				this.tea_sex=rs.getString("tea_sex");
				this.tel=rs.getString("tel");
				this.tea_age=rs.getString("tea_age");
				this.tea_zhicheng=rs.getString("tea_zhicheng");
				this.tea_xueke=rs.getString("tea_xueke");
			//	System.out.println(stu_name+stu_num+sex+train_date+class_name+grade+school+hui_flag);
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
		this.teaSql="select * from `admin_teacher` ";
		this.teaSql=this.teaSql + " where tea_num='" + this.tea_num + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.teaSql);
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
   	public ResultSet show_teachers()
	{
		this.teaSql="select tea_num,tea_name,tea_sex,tel,tea_age,tea_zhicheng,tea_xueke from `admin_teacher` order by tea_num asc";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.teaSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}

   	public ResultSet show_xueke(String xueke)
	{
		this.teaSql="select course_name from `course` where course_num='"+xueke+"'";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.teaSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}
   	public ResultSet show_xueke()
	{
		this.teaSql="select course_num,course_name from `course` order by course_num asc";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.teaSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}
             


	//设置类成员变量StuDentid的值
	//public void setStuid(long stuid)
	//{
	//	this.stuid = stuid;
	//}

	//获取类成员变量StuDentid的值
	//public long getStuid()
	//{
	//	return this.stuid;
	//}
	//设置类成员变量Stu_num的值
	public void setTea_num(String tea_num)
	{
		this.tea_num = tea_num;
	}

	//获取类成员变量Stu_num的值
	public String getTea_num()
	{
		return this.tea_num;
	}
	

	//设置类成员变量stu_name的值
 	public void setT_name(String tea_name)
	{
		this.tea_name = tea_name;
	}

	//获取类成员变量stu_name的值
	public String getT_name()
	{
		return this.tea_name;
	}

	//设置类成员变量sex的值
 	public void setT_sex(String tea_sex)
	{
		this.tea_sex = tea_sex;
	}

	//获取类成员变量sex的值
	public String getT_sex()
	{
		return this.tea_sex;
	}

	//设置类成员变量train_date的值
	public void setT_tel(String tel)
	{
		this.tel = tel;
	}

	//获取类成员变量train_date的值
	public String getT_tel()
	{
		return this.tel;
	}
	
	
		public void setTea_age(String tea_age)
	{
		this.tea_age = tea_age;
	}

	//获取类成员变量train_date的值
	public String getTea_age()
	{
		return this.tea_age;
	}
	

		public void setTea_zhicheng(String tea_zhicheng)
	{
		this.tea_zhicheng = tea_zhicheng;
	}

	//获取类成员变量train_date的值
	public String getTea_zhicheng()
	{
		return this.tea_zhicheng;
	}
	

		public void setTea_xueke(String tea_xueke)
	{
		this.tea_xueke = tea_xueke;
	}

	//获取类成员变量train_date的值
	public String getTea_xueke()
	{
		return this.tea_xueke;
	}
}


