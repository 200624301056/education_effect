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
public class Integrate extends ExecuteDB
{
	//定义类成员变量
	private long stuid;
	private String stu_num;
	private String stu_name;
	private String score_fi;
	private String score_se;
	private String score_th;
	private String score_fo;
	private String scoSql;
	private String school;
	private String grade;
	private String class_name;
	private String term;

	
    //构造函数，对成员变量进行初始化赋值
	public Integrate()
	{
		super();
		this.stuid=0;
		this.stu_num="";
		this.stu_name="";
		this.score_fi="";
		this.score_se="";
		this.score_th="";
		this.score_fo="";
		this.school="";
		this.grade="";
		this.class_name="";
		this.term="";
	}

	//添加新用户，往score_sj数据表中添加一条新记录
	public boolean addIntsco()
	{

		this.scoSql="insert into score_zhsz ";
		this.scoSql=this.scoSql + "(stu_num,stu_name,score_fi, score_se, score_th, score_fo,school,grade,class_name,term) ";
		this.scoSql=this.scoSql + "values('" + this.stu_num + "','" + this.stu_name + "','" + this.score_fi + "','" + this.score_se + "','" + this.score_th + "','" + this.score_fo + "','" + this.school + "','" + this.grade + "','" + this.class_name + "','" + this.term + "')";				

		boolean isAdd = super.exeSql(this.scoSql);
                return isAdd;
	}
	//删除学生信息
     public boolean delete(String sStuID)
        {
            this.scoSql = "delete from score_zhsz where stuid in (";
            this.scoSql = this.scoSql + sStuID +")";

            boolean isDelete = super.exeSql(this.scoSql);
            return isDelete;
        }

	//修改stuDentid对应的用户的信息
	public boolean modify_Intsco_info()
	{
		this.scoSql="update score_zhsz set";
		this.scoSql=this.scoSql + " stu_num=" + "'" + this.stu_num + "',";
		this.scoSql=this.scoSql + " stu_name=" + "'" + this.stu_name + "',";
		this.scoSql=this.scoSql + " score_fi=" + "'" + this.score_fi + "',";
		this.scoSql=this.scoSql + " score_se=" + "'" + this.score_se + "',";
		this.scoSql=this.scoSql + " score_th=" + "'" + this.score_th + "',";
		this.scoSql=this.scoSql + " score_fo=" + "'" + this.score_fo + "',";
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
		this.scoSql="select * from `score_zhsz` where stuid=";
		this.scoSql=this.scoSql + "'" + this.stuid + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.scoSql);
			if (rs.next())
			{
				this.stuid=rs.getLong("stuid");
				this.stu_num=rs.getString("stu_num");
				this.stu_name=rs.getString("stu_name");
				this.score_fi=rs.getString("score_fi");
				this.score_se=rs.getString("score_se");
				this.score_th=rs.getString("score_th");
				this.score_fo=rs.getString("score_fo");
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
		this.scoSql="select * from `score_zhsz` ";
		this.scoSql=this.scoSql + " where stuid='" + this.stuid + "'";

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
   /*	public ResultSet show_Intscore()
	{
		this.scoSql="select stuid,stu_num,stu_name,score_fi,score_se,score_th,score_fo,school,grade,class_name,term from `score_zhsz` order by stuid asc";
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
	public ResultSet show_Intscore(String school,String grade,String class_name,String term,String stu_name,String stu_num)
	{
   		List<Object> lists=new ArrayList<Object>();
   		StringBuffer sb=new StringBuffer();
		sb.append("select * from score_zhsz where 1=1 ");
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
	//设置类成员变量score_fi的值
 	public void setScore_fir(String score_fi)
	{
		this.score_fi = score_fi;
	}

	//获取类成员变量sex的值
	public String getscore_fi()
	{
		return this.score_fi;
	}
	
	public void setScore_sec(String score_se)
	{
		this.score_se = score_se;
	}

	//获取类成员变量sex的值
	public String getscore_se()
	{
		return this.score_se;
	}

	public void setScore_thr(String score_th)
	{
		this.score_th = score_th;
	}

	//获取类成员变量sex的值
	public String getscore_th()
	{
		return this.score_th;
	}
	
	public void setScore_fou(String score_fo)
	{
		this.score_fo = score_fo;
	}

	//获取类成员变量sex的值
	public String getscore_fo()
	{
		return this.score_fo;
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


