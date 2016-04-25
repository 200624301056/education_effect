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
	//�������Ա����
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
	
    //���캯�����Գ�Ա�������г�ʼ����ֵ
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

	//������û�����admin_stu���ݱ������һ���¼�¼
	public boolean addDor()
	{
		this.dorSql="insert into admin_dormitory ";
		this.dorSql=this.dorSql + "(dorid,dor_num,dor_floor,dor_bulid,admin) ";
		this.dorSql=this.dorSql + "values('" + this.dorid + "','" + this.dor_num + "','" + this.dor_floor + "','" + this.dor_bulid + "','" + this.admin + "')";				

		boolean isAdd = super.exeSql(this.dorSql);
                return isAdd;
	}
	
	//��ӷ���������Ϣ
	public boolean addDordis()
	{
		this.dorSql="insert into admin_dor_dis ";
		this.dorSql=this.dorSql + "(stu_num, stu_name, sex, school, grade, class_name, term, dor_name, dor_leader, class_teacher) ";
		this.dorSql=this.dorSql + "values('" + this.stu_num + "','" + this.stu_name + "','" + this.sex + "','" + this.school + "','" + this.grade + "','" + this.class_name + "','" + this.term + "','" + this.dor_name + "','" + this.dor_leader + "','" + this.class_teacher + "')";				

		boolean isAdd = super.exeSql(this.dorSql);
                return isAdd;
	}
	
	//ɾ��������Ϣ
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

	//�޸�dorid��Ӧ���û�����Ϣ
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
 	//���dorid��Ӧ���û�����Ϣ������Щ��Ϣ��ֵ����Ӧ�������
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

   	//�ж��û����Ƿ����
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
   	//��ȡ������Ϣ
	public ResultSet show_dor_pbf(String term)
	{
		this.dorSql="select a.dor,b.score_fi,b.stu_num,a.term,a.class_teacher from ((select distinct(dor_name) dor,sex,dor_leader,class_teacher,term from admin_dor_dis where stu_num in ( SELECT stu_num FROM score_zhsz where score_fi=(select max(score_fi) from score_zhsz )) and sex='Ů') a),score_zhsz b where a.dor_leader=b.stu_num and b.term='" + term + "'";
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
		this.dorSql="select a.dor,b.score_fi,b.stu_num,a.term,a.class_teacher from ((select distinct(dor_name) dor,sex,dor_leader,class_teacher,term from admin_dor_dis where stu_num in ( SELECT stu_num FROM score_zhsz where score_fi=(select max(score_fi) from score_zhsz )) and sex='��') a),score_zhsz b where a.dor_leader=b.stu_num and b.term='" + term + "'";
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
   	
   	
	//�������Ա����dorid��ֵ
	public void setDorid(long dorid)
	{
		this.dorid = dorid;
	}

	//��ȡ���Ա����dorid��ֵ
	public long getDorid()
	{
		return this.dorid;
	}

	public void setStu_id(String stuid)
	{
		this.stuid = stuid;
	}

	//��ȡ���Ա����dor_num��ֵ
	public String getStu_id()
	{
		return this.stuid;
	}
	
	//�������Ա����dor_num��ֵ
	public void setDor_num( String dor_num)
	{
		this.dor_num = dor_num;
	}

	//��ȡ���Ա����dor_num��ֵ
	public String getDor_num()
	{
		return this.dor_num;
	}
	

	//�������Ա����stu_name��ֵ
 	public void setDor_floor(String dor_floor)
	{
		this.dor_floor = dor_floor;
	}

	//��ȡ���Ա����stu_name��ֵ
	public String getDor_floor()
	{
		return this.dor_floor;
	}
	//�������Ա����stu_name��ֵ
 	public void setDor_bulid(String dor_bulid)
	{
		this.dor_bulid = dor_bulid;
	}

	//��ȡ���Ա����stu_name��ֵ
	public String getDor_bulid()
	{
		return this.dor_bulid;
	}
	//�������Ա����sex��ֵ
 	public void setAdmin(String admin)
	{
		this.admin = admin;
	}

	//��ȡ���Ա����sex��ֵ
	public String getAdmin()
	{
		return this.admin;
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
	
	public String getTerm()
	{
		return this.term;
	}
	public void setTerm(String term)
	{
		this.term = term;
	}
	//�������Ա����dor_num��ֵ
	public void setDor_name( String dor_name)
	{
		this.dor_name = dor_name;
	}

	//��ȡ���Ա����dor_num��ֵ
	public String getDor_name()
	{
		return this.dor_name;
	}
	//�������Ա����dor_num��ֵ
	public void setDor( String dor)
	{
		this.dor = dor;
	}

	//��ȡ���Ա����dor_num��ֵ
	public String getDor()
	{
		return this.dor;
	}
	//�������Ա����dor_num��ֵ
	public void setDor_leader( String dor_leader)
	{
		this.dor_leader = dor_leader;
	}

	//��ȡ���Ա����dor_num��ֵ
	public String getDor_leader()
	{
		return this.dor_leader;
	}
	
	//�������Ա����dor_num��ֵ
	public void setClass_teacher( String class_teacher)
	{
		this.class_teacher = class_teacher;
	}

	//��ȡ���Ա����dor_num��ֵ
	public String getClass_teacher()
	{
		return this.class_teacher;
	}
	public void setStcount( int stcount)
	{
		this.stcount = stcount;
	}

	//��ȡ���Ա����dor_num��ֵ
	public int getStcount()
	{
		return this.stcount;
	}
}


