/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class Score extends ExecuteDB
{
	//定义类成员变量
	private long stuid;
	private String stu_num;
	private String stu_name;
	private String train_date;
	private String score_fis;
	private String score_sec;
	private String score_thr;
	private String score_fou;
	private String score_fiv;
	private String score_six;
	private String score_sev;
	private String score_eig;
	private String school;
	private String grade;
	private String class_name;
	private String term;
	private String scoSql;
	

	
    //构造函数，对成员变量进行初始化赋值
	public Score()
	{
		super();
		this.stuid=0;
		this.stu_num="";
		this.stu_name="";
		this.train_date="";
		this.score_fis="";
		this.score_sec="";
		this.score_thr="";
		this.score_fou="";
		this.score_fiv="";
		this.score_six="";
		this.score_sev="";
		this.score_eig="";
		this.school="";
		this.grade="";
		this.class_name="";
		this.term="";
	}

	//添加新用户，往score_sj数据表中添加一条新记录
	public boolean addsco()
	{

		this.scoSql="insert into score_sj ";
		this.scoSql=this.scoSql + "(stu_num,stu_name,score_fis, score_sec, score_thr, score_fou, score_fiv, score_six, score_sev, score_eig, school, grade, class_name, term) ";
		this.scoSql=this.scoSql + "values('" + this.stu_num + "','" + this.stu_name + "','" + this.score_fis + "','" + this.score_sec + "','" + this.score_thr + "','" + this.score_fou + "','" + this.score_fiv + "','" + this.score_six + "','" + this.score_sev + "','" + this.score_eig + "','" + this.school + "','" + this.grade + "','" + this.class_name + "','" + this.term + "')";				

		boolean isAdd = super.exeSql(this.scoSql);
                return isAdd;
	}
	//删除学生信息
     public boolean delete(String sStuID)
        {
            this.scoSql = "delete from score_sj where stuid in (";
            this.scoSql = this.scoSql + sStuID +")";

            boolean isDelete = super.exeSql(this.scoSql);
            return isDelete;
        }

	//修改stuDentid对应的用户的信息
	public boolean modify_sco_info()
	{
		this.scoSql="update score_sj set";
		this.scoSql=this.scoSql + " stu_num=" + "'" + this.stu_num + "',";
		this.scoSql=this.scoSql + " stu_name=" + "'" + this.stu_name + "',";
		this.scoSql=this.scoSql + " score_fis=" + "'" + this.score_fis + "',";
		this.scoSql=this.scoSql + " score_sec=" + "'" + this.score_sec + "',";
		this.scoSql=this.scoSql + " score_thr=" + "'" + this.score_thr + "',";
		this.scoSql=this.scoSql + " score_fou=" + "'" + this.score_fou + "',";
		this.scoSql=this.scoSql + " score_fiv=" + "'" + this.score_fiv + "',";
		this.scoSql=this.scoSql + " score_six=" + "'" + this.score_six + "',";
		this.scoSql=this.scoSql + " score_sev=" + "'" + this.score_sev + "',";
		this.scoSql=this.scoSql + " score_eig=" + "'" + this.score_eig + "',";
		this.scoSql=this.scoSql + " school=" + "'" + this.school + "',";
		this.scoSql=this.scoSql + " grade=" + "'" + this.grade + "',";
		this.scoSql=this.scoSql + " class_name=" + "'" + this.class_name + "',";
		this.scoSql=this.scoSql + " term=" + "'" + this.term + "'";
		this.scoSql=this.scoSql + " where stuid=" + this.stuid;
		//System.out.println(scoSql);
		boolean isUpdate = super.exeSql(this.scoSql);
		return isUpdate;
	}


 	//获得stuid对应的用户的信息，将这些信息赋值给相应的类变量
	public boolean init()
	{
		this.scoSql="select stuid,stu_num,stu_name,score_fis,score_sec,score_thr,score_fou,score_fiv,score_six,score_sev,score_eig,school,grade,class_name,term from `score_sj` where stuid=";

		this.scoSql=this.scoSql + "'" + this.stuid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.scoSql);
			if (rs.next())
			{
				this.stuid=rs.getLong("stuid");
				this.stu_num=rs.getString("stu_num");
				this.stu_name=rs.getString("stu_name");			
				this.score_fis=rs.getString("score_fis");
				this.score_sec=rs.getString("score_sec");
				this.score_thr=rs.getString("score_thr");
				this.score_fou=rs.getString("score_fou");
				this.score_fiv=rs.getString("score_fiv");
				this.score_six=rs.getString("score_six");
				this.score_sev=rs.getString("score_sev");
				this.score_eig=rs.getString("score_eig");
				this.school=rs.getString("school");
				this.grade=rs.getString("grade");
				this.class_name=rs.getString("class_name");
				this.term=rs.getString("term");
				//System.out.println(stu_name+stu_num+class_name+grade+school);
		
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
		this.scoSql="select * from `score_sj` ";
		this.scoSql=this.scoSql + " where stu_num='" + this.stu_num + "'";
		this.scoSql=this.scoSql + " and term='" + this.term + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.scoSql);
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
 /*  	public ResultSet show_score()
	{
		this.scoSql="select stuid,stu_num,stu_name,score_fis,score_sec,score_thr,score_fou,score_fiv,score_six,score_sev,score_eig,school,grade,class_name,term from `score_sj` order by stuid asc";
		
		ResultSet rs = null;
		try
		{
			rs = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rs;
	}*/
	public ResultSet show_score(String school,String grade,String class_name,String term,String stu_name,String stu_num)
	{
   		List<Object> lists=new ArrayList<Object>();
   		StringBuffer sb=new StringBuffer();
		sb.append("select * from score_sj where 1=1 ");
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
	//设置类成员变量StuDentid的值
	public void setStuid(long stuid)
	{
		this.stuid = stuid;
	}

	//获取类成员变量StuDentid的值
	public long getStuid()
	{
		return this.stuid;
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
	//设置类成员变量train_date的值
	public void setT_date(String train_date)
	{
		this.train_date = train_date;
	}

	//获取类成员变量train_date的值
	public String getT_date()
	{
		return this.train_date;
	}
	
	//设置类成员变量score_fis的值
 	public void setScore_fis(String score_fis)
	{
		this.score_fis = score_fis;
	}

	//获取类成员变量sex的值
	public String getScore_fis()
	{
		return this.score_fis;
	}
	
	public void setScore_sec(String score_sec)
	{
		this.score_sec = score_sec;
	}

	//获取类成员变量sex的值
	public String getScore_sec()
	{
		return this.score_sec;
	}

	public void setScore_thr(String score_thr)
	{
		this.score_thr = score_thr;
	}

	//获取类成员变量sex的值
	public String getScore_thr()
	{
		return this.score_thr;
	}
	
	public void setScore_fou(String score_fou)
	{
		this.score_fou = score_fou;
	}

	//获取类成员变量sex的值
	public String getScore_fou()
	{
		return this.score_fou;
	}
	
	public void setScore_fiv(String score_fiv)
	{
		this.score_fiv = score_fiv;
	}

	//获取类成员变量sex的值
	public String getScore_fiv()
	{
		return this.score_fiv;
	}
	
	
	public void setScore_six(String score_six)
	{
		this.score_six = score_six;
	}

	//获取类成员变量sex的值
	public String getScore_six()
	{
		return this.score_six;
	}
	
	public void setScore_sev(String score_sev)
	{
		this.score_sev = score_sev;
	}
	
	public String getScore_sev()
	{
		return this.score_sev;
	}
	
	public void setScore_eig(String score_eig)
	{
		this.score_eig = score_eig;
	}
	
	public String getScore_eig()
	{
		return this.score_eig;
	}	
	
	public String getTerm()
	{
		return this.term;
	}
	public void setTerm(String term)
	{
		this.term = term;
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
}


