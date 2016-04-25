/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class Dormitory extends ExecuteDB
{
	//定义类成员变量
	private long dorid;
	private String stuid;
	private String dor_num;
	private String dor_floor;
	private String dor_bulid;
	private String admin;
	private String dorSql;
	private String stu_name;
	private String stu_num;
	private String sex;
	private String school;
	private String grade;
	private String class_name;
	private String term;
	private String dor_name;
	private String dor_leader;
	private String class_teacher;
	private String dor;
	private int stcount;
	
    //构造函数，对成员变量进行初始化赋值
	public Dormitory()
	{
		super();
		this.dorid=0;
		this.stuid="";
		this.dor_num="";
		this.dor_floor="";
		this.dor_bulid="";
		this.admin="";
		this.stu_name="";
		this.stu_num="";
		this.sex="";
		this.school="";
		this.grade="";
		this.class_name="";
		this.term="";
		this.dor_name="";
		this.dor_leader="";
		this.class_teacher="";
		this.dor="";
		this.stcount=0;
	}

	//添加新用户，往admin_stu数据表中添加一条新记录
	public boolean addDor()
	{
		this.dorSql="insert into admin_dormitory ";
		this.dorSql=this.dorSql + "(dorid,dor_num,dor_floor,dor_bulid,admin) ";
		this.dorSql=this.dorSql + "values('" + this.dorid + "','" + this.dor_num + "','" + this.dor_floor + "','" + this.dor_bulid + "','" + this.admin + "')";				

		boolean isAdd = super.exeSql(this.dorSql);
                return isAdd;
	}
	
	//添加分配宿舍信息
	public boolean addDordis()
	{
		this.dorSql="insert into admin_dor_dis ";
		this.dorSql=this.dorSql + "(stu_num, stu_name, sex, school, grade, class_name, term, dor_name, dor_leader, class_teacher) ";
		this.dorSql=this.dorSql + "values('" + this.stu_num + "','" + this.stu_name + "','" + this.sex + "','" + this.school + "','" + this.grade + "','" + this.class_name + "','" + this.term + "','" + this.dor_name + "','" + this.dor_leader + "','" + this.class_teacher + "')";				

		boolean isAdd = super.exeSql(this.dorSql);
                return isAdd;
	}
	
	//删除宿舍信息
     public boolean delete(String sDorID)
        {
            this.dorSql = "delete from admin_dormitory where dorid in (";
            this.dorSql = this.dorSql + sDorID +")";

            boolean isDelete = super.exeSql(this.dorSql);
            return isDelete;
        }
     public boolean deletedis(String dorid)
     {
         this.dorSql = "delete from admin_dor_dis";
         this.dorSql = this.dorSql + "where stuid='"+ this.dorid +"'";

         boolean isDelete = super.exeSql(this.dorSql);
         return isDelete;
     }

	//修改dorid对应的用户的信息
	public boolean modify_dor_info()
	{
		this.dorSql="update admin_dormitory set";
		this.dorSql=this.dorSql + " dor_num=" + "'" + this.dor_num + "',";
		this.dorSql=this.dorSql + " dor_floor=" + "'" + this.dor_floor + "',";
		this.dorSql=this.dorSql + " dor_bulid=" + "'" + this.dor_bulid + "',";
		this.dorSql=this.dorSql + " admin=" + "'" + this.admin + "'";
		this.dorSql=this.dorSql + " where dorid='" + this.dorid + "'";
		boolean isUpdate = super.exeSql(this.dorSql);
		return isUpdate;
	}
	public boolean upDorflag(String dor_name)
	{
		this.dorSql="update admin_dormitory set";
		this.dorSql=this.dorSql + " stcount=stcount+1";
		this.dorSql=this.dorSql + " where dor_num='" + this.dor_name + "'";
		boolean isUpdate = super.exeSql(this.dorSql);
		return isUpdate;
	}
	public boolean upDorflagm(String dor_name)
	{
		this.dorSql="update admin_dormitory set";
		this.dorSql=this.dorSql + " stcount=stcount-1";
		this.dorSql=this.dorSql + " where dor_num='" + this.dor_name + "'";
		boolean isUpdate = super.exeSql(this.dorSql);
		return isUpdate;
	}
 	//获得dorid对应的用户的信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
		this.dorSql="select * from `admin_dormitory` where dorid=";
		this.dorSql=this.dorSql + "'" + this.dorid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.dorSql);
			if (rs.next())
			{
				this.dorid=rs.getLong("dorid");
				this.dor_num=rs.getString("dor_num");
				this.dor_floor=rs.getString("dor_floor");
				this.dor_bulid=rs.getString("dor_bulid");
				this.admin=rs.getString("admin");
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
		this.dorSql="select * from `admin_dormitory` ";
		this.dorSql=this.dorSql + " where dor_num='" + this.dor_num + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.dorSql);
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
	public ResultSet show_dor_leader(String dor_leader)
	{
		this.dorSql="select stu_name from `admin_stu`";
		this.dorSql=this.dorSql + " where stu_num='" + this.dor_leader + "'";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.dorSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}
	
   	public ResultSet show_dor()
	{
		this.dorSql="select dorid,dor_num,dor_floor,dor_bulid,admin,stcount from `admin_dormitory` order by dorid asc";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.dorSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}
   	//获取排名信息
	public ResultSet show_dor_pbf(String term)
	{
		this.dorSql="select a.dor,b.score_fi,b.stu_num,a.term,a.class_teacher from ((select distinct(dor_name) dor,sex,dor_leader,class_teacher,term from admin_dor_dis where stu_num in ( SELECT stu_num FROM score_zhsz where score_fi=(select max(score_fi) from score_zhsz )) and sex='女') a),score_zhsz b where a.dor_leader=b.stu_num and b.term='" + term + "'";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.dorSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}
   	
	public ResultSet show_dor_pbm(String term)
	{
		this.dorSql="select a.dor,b.score_fi,b.stu_num,a.term,a.class_teacher from ((select distinct(dor_name) dor,sex,dor_leader,class_teacher,term from admin_dor_dis where stu_num in ( SELECT stu_num FROM score_zhsz where score_fi=(select max(score_fi) from score_zhsz )) and sex='男') a),score_zhsz b where a.dor_leader=b.stu_num and b.term='" + term + "'";
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.dorSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}
	
   	public ResultSet show_dor_dis(String school,String grade,String sex)
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
	//	if(class_name !=null && class_name.length()>0){
	//		sb.append("and class_name=? ");
	//		lists.add(class_name);
	//	}
		if(sex !=null && sex.length()>0){
			sb.append("and sex=? ");
			lists.add(sex);
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

   	public ResultSet show_stu_dis(String school,String grade,String class_name,String term,String sex,String stu_name,String dor_name)
	{
   		List<Object> lists=new ArrayList<Object>();
   		StringBuffer sb=new StringBuffer();
		sb.append("select * from admin_dor_dis where 1=1 ");
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
		if(sex !=null && sex.length()>0){
			sb.append("and sex=? ");
			lists.add(sex);
		}
		if(stu_name !=null && stu_name.length()>0){
			sb.append("and stu_name=? ");
			lists.add(stu_name);
		}
		if(dor_name !=null && dor_name.length()>0){
			sb.append("and dor_name=? ");
			lists.add(dor_name);
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
   	
   	
	//设置类成员变量dorid的值
	public void setDorid(long dorid)
	{
		this.dorid = dorid;
	}

	//获取类成员变量dorid的值
	public long getDorid()
	{
		return this.dorid;
	}

	public void setStu_id(String stuid)
	{
		this.stuid = stuid;
	}

	//获取类成员变量dor_num的值
	public String getStu_id()
	{
		return this.stuid;
	}
	
	//设置类成员变量dor_num的值
	public void setDor_num( String dor_num)
	{
		this.dor_num = dor_num;
	}

	//获取类成员变量dor_num的值
	public String getDor_num()
	{
		return this.dor_num;
	}
	

	//设置类成员变量stu_name的值
 	public void setDor_floor(String dor_floor)
	{
		this.dor_floor = dor_floor;
	}

	//获取类成员变量stu_name的值
	public String getDor_floor()
	{
		return this.dor_floor;
	}
	//设置类成员变量stu_name的值
 	public void setDor_bulid(String dor_bulid)
	{
		this.dor_bulid = dor_bulid;
	}

	//获取类成员变量stu_name的值
	public String getDor_bulid()
	{
		return this.dor_bulid;
	}
	//设置类成员变量sex的值
 	public void setAdmin(String admin)
	{
		this.admin = admin;
	}

	//获取类成员变量sex的值
	public String getAdmin()
	{
		return this.admin;
	}

	

	//设置类成员变量Stu_num的值
	public void setStu_num( String stu_num)
	{
		this.stu_num = stu_num;
	}

	//获取类成员变量Stu_num的值
	public String getStu_num()
	{
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

	//设置类成员变量sex的值
 	public void setSex(String sex)
	{
		this.sex = sex;
	}

	//获取类成员变量sex的值
	public String getSex()
	{
		return this.sex;
	}
	//设置类成员变量school的值
 	public void setSchool(String school)
	{
		this.school = school;
	}

	//获取类成员变量school的值
	public String getSchool()
	{
		return this.school;
	}


	//设置类成员变量grade的值
 	public void setGrade(String grade)
	{
		this.grade = grade;
	}

	//获取类成员变量grade的值
	public String getGrade()
	{
		return this.grade;
	}

	//设置类成员变量class_name的值
 	public void setClass_name(String class_name)
	{
		this.class_name = class_name;
	}

	//获取类成员变量class_name的值
	public String getClass_name()
	{
		return this.class_name;
	}
	
	public String getTerm()
	{
		return this.term;
	}
	public void setTerm(String term)
	{
		this.term = term;
	}
	//设置类成员变量dor_num的值
	public void setDor_name( String dor_name)
	{
		this.dor_name = dor_name;
	}

	//获取类成员变量dor_num的值
	public String getDor_name()
	{
		return this.dor_name;
	}
	//设置类成员变量dor_num的值
	public void setDor( String dor)
	{
		this.dor = dor;
	}

	//获取类成员变量dor_num的值
	public String getDor()
	{
		return this.dor;
	}
	//设置类成员变量dor_num的值
	public void setDor_leader( String dor_leader)
	{
		this.dor_leader = dor_leader;
	}

	//获取类成员变量dor_num的值
	public String getDor_leader()
	{
		return this.dor_leader;
	}
	
	//设置类成员变量dor_num的值
	public void setClass_teacher( String class_teacher)
	{
		this.class_teacher = class_teacher;
	}

	//获取类成员变量dor_num的值
	public String getClass_teacher()
	{
		return this.class_teacher;
	}
	public void setStcount( int stcount)
	{
		this.stcount = stcount;
	}

	//获取类成员变量dor_num的值
	public int getStcount()
	{
		return this.stcount;
	}
}


