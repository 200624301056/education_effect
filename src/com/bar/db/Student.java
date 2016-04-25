/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class Student extends ExecuteDB
{
	//�������Ա����
	private long stuid;
	private String stu_name;
	private String stu_num;
	private String sex;
	private String train_date;
	private String school;
	private String grade;
	private String class_name;
	private String hui_flag;
	private String stuSql;
	
    //���캯�����Գ�Ա�������г�ʼ����ֵ
	public Student()
	{
		super();
		this.stuid=0;
		this.stu_name="";
		this.sex="";
		this.train_date="";
		this.school="";
		this.grade="";
		this.class_name="";
		this.hui_flag="";
	}

	//������û�����admin_stu���ݱ������һ���¼�¼
	public boolean addstu()
	{

		this.stuSql="insert into admin_stu ";
		this.stuSql=this.stuSql + "(stu_num,stu_name,sex,train_date,school,grade,class_name,hui_flag) ";
		this.stuSql=this.stuSql + "values('" + this.stu_num + "','" + this.stu_name + "','" + this.sex + "','" + this.train_date + "','" + this.school + "','" + this.grade + "','" + this.class_name + "','" + this.hui_flag + "')";				

		boolean isAdd = super.exeSql(this.stuSql);
                return isAdd;
	}
	//ɾ��ѧ����Ϣ
     public boolean delete(String sStuID)
        {
            this.stuSql = "delete from admin_stu where stuid in (";
            this.stuSql = this.stuSql + sStuID +")";

            boolean isDelete = super.exeSql(this.stuSql);
            return isDelete;
        }

	//�޸�stuDentid��Ӧ���û�����Ϣ
	public boolean modify_stu_info()
	{
		this.stuSql="update admin_stu set";
		this.stuSql=this.stuSql + " stu_name=" + "'" + this.stu_name + "',";
		this.stuSql=this.stuSql + " stu_num=" + "'" + this.stu_num + "',";
		//this.stuSql=this.stuSql + " stuid=" + "'" + this.stuid + "',";
		this.stuSql=this.stuSql + " sex=" + "'" + this.sex + "',";
		this.stuSql=this.stuSql + " train_date=" + "'" + this.train_date + "',";
		this.stuSql=this.stuSql + " school=" + "'" + this.school + "',";
		this.stuSql=this.stuSql + " grade=" + "'" + this.grade + "',";
		this.stuSql=this.stuSql + " class_name=" + "'" + this.class_name + "',";
		this.stuSql=this.stuSql + " hui_flag=" + "'" + this.hui_flag + "'";
		this.stuSql=this.stuSql + " where stuid=" + this.stuid;
		//System.out.println(stuSql);
		boolean isUpdate = super.exeSql(this.stuSql);
		return isUpdate;
	}


 	//���stuid��Ӧ���û�����Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean init()
	{
		this.stuSql="select * from `admin_stu` where stuid=";
		this.stuSql=this.stuSql + "'" + this.stuid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.stuSql);
			if (rs.next())
			{
				this.stuid=rs.getLong("stuid");
				this.stu_num=rs.getString("stu_num");
				this.stu_name=rs.getString("stu_name");
				this.sex=rs.getString("sex");
				this.train_date=rs.getString("train_date");
				this.school=rs.getString("school");
				this.grade=rs.getString("grade");
				this.class_name=rs.getString("class_name");
				this.hui_flag=rs.getString("hui_flag");
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

   	//�ж��û����Ƿ����
	public boolean exist()
	{
		this.stuSql="select * from `admin_stu` ";
		this.stuSql=this.stuSql + " where stuid='" + this.stuid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.stuSql);
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
   /*	public ResultSet show_students()
	{
		this.stuSql="select stuid,stu_num,stu_name,sex,train_date,school,grade,class_name,hui_flag from `admin_stu` order by stuid asc";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.stuSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}*/
   	public ResultSet show_students(String school,String grade,String class_name)
	{
   		List<Object> lists=new ArrayList<Object>();
   		StringBuffer sb=new StringBuffer();
		sb.append("select * from admin_stu where 1=1 ");
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

		Connection conn=null;
		PreparedStatement stat=null;
		ResultSet rs=null;
		try
		{
			 conn=DBUtil.getConnection();
			 stat=conn.prepareStatement(sb.toString());
			 for(int i=0;i<lists.size();i++){
					stat.setObject(i+1,lists.get(i));
				}
			rs=stat.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}

  

	//�������Ա����StuDentid��ֵ
	public void setStuid(long stuid)
	{
		this.stuid = stuid;
	}

	//��ȡ���Ա����StuDentid��ֵ
	public long getStuid()
	{
		return this.stuid;
	}
	//�������Ա����Stu_num��ֵ
	public void setStu_num( String stu_num)
	{
		this.stu_num = stu_num;
	}

	//��ȡ���Ա����Stu_num��ֵ
	public String getStu_num()
	{
		return this.stu_num;
	}
	

	//�������Ա����stu_name��ֵ
 	public void setSUname(String stu_name)
	{
		this.stu_name = stu_name;
	}

	//��ȡ���Ա����stu_name��ֵ
	public String getSUname()
	{
		return this.stu_name;
	}

	//�������Ա����sex��ֵ
 	public void setSex(String sex)
	{
		this.sex = sex;
	}

	//��ȡ���Ա����sex��ֵ
	public String getSex()
	{
		return this.sex;
	}

	//�������Ա����train_date��ֵ
	public void setT_date(String train_date)
	{
		this.train_date = train_date;
	}

	//��ȡ���Ա����train_date��ֵ
	public String getT_date()
	{
		return this.train_date;
	}

	//�������Ա����school��ֵ
 	public void setSchool(String school)
	{
		this.school = school;
	}

	//��ȡ���Ա����school��ֵ
	public String getSchool()
	{
		return this.school;
	}


	//�������Ա����grade��ֵ
 	public void setGrade(String grade)
	{
		this.grade = grade;
	}

	//��ȡ���Ա����grade��ֵ
	public String getGrade()
	{
		return this.grade;
	}

	//�������Ա����class_name��ֵ
 	public void setClass_name(String class_name)
	{
		this.class_name = class_name;
	}

	//��ȡ���Ա����class_name��ֵ
	public String getClass_name()
	{
		return this.class_name;
	}

	//�������Ա����hui_flag��ֵ
 	public void setHui(String hui_flag)
	{
		this.hui_flag = hui_flag;
	}

	//��ȡ���Ա����hui_flag��ֵ
	public String getHui()
	{
		return this.hui_flag;
	}

}


