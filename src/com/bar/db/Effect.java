/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bar.db;

import java.sql.*;

public class Effect extends ExecuteDB
{
	//�������Ա����
	private long termid;
	private String stu_num;
	private String stu_numy;
	private String stu_name;
	private String score_fis;
	private String score_sec;
	private String score_thr;
	private String score_fou;
	private String scoSql;
	
    //���캯�����Գ�Ա�������г�ʼ����ֵ
	public Effect()
	{
		super();
		this.termid=0;
		this.stu_num="";
		this.stu_numy="";
		this.stu_name="";
		this.score_fis="";
		this.score_sec="";
		this.score_thr="";
		this.score_fou="";
	}

 	//���stuid��Ӧ���û�����Ϣ������Щ��Ϣ��ֵ����Ӧ�������
   	public ResultSet show_stunum()
	{
		this.scoSql="select stu_num,stu_name from `admin_stu` order by stuid asc";
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
	}
   	public ResultSet show_sj_score(String stu_numy)
	{
		this.scoSql = "select score_fis, score_sec, score_thr, score_fou, score_fiv, score_six, score_sev "+
						"from score_sj "+
						"where term='1' "+
						"and stu_num='"+stu_numy+"'";		
		ResultSet rss = null;
		try
		{
			rss = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rss;
	}
   	public ResultSet show_sj_score2(String stu_numy)
	{
		this.scoSql = "select score_fis, score_sec, score_thr, score_fou, score_fiv, score_six, score_sev "+
						"from score_sj "+
						"where term='2' "+
						"and stu_num='"+stu_numy+"'";		
		ResultSet rss2 = null;
		try
		{
			rss2 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rss2;
	}
   	
   	public ResultSet show_sj_score3(String stu_numy)
	{
		this.scoSql = "select score_fis, score_sec, score_thr, score_fou, score_fiv, score_six, score_sev "+
						"from score_sj "+
						"where term='3' "+
						"and stu_num='"+stu_numy+"'";		
		ResultSet rss3 = null;
		try
		{
			rss3 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rss3;
	}
   	public ResultSet show_sj_score4(String stu_numy)
	{
		this.scoSql = "select score_fis, score_sec, score_thr, score_fou, score_fiv, score_six, score_sev "+
						"from score_sj "+
						"where term='4' "+
						"and stu_num='"+stu_numy+"'";		
		ResultSet rss4 = null;
		try
		{
			rss4 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rss4;
	}
   	
   	public ResultSet show_ge_score(String stu_numy)
	{
		this.scoSql = "select score_gen "+
		"from inspector_gen "+
		"where term='1' "+
		"and stu_num='"+stu_numy+"'";
		ResultSet rsg = null;
		try
		{
			rsg = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rsg;
	}
   	public ResultSet show_ge_score2(String stu_numy)
	{
		this.scoSql = "select score_gen "+
		"from inspector_gen "+
		"where term='2' "+
		"and stu_num='"+stu_numy+"'";
		ResultSet rsg2 = null;
		try
		{
			rsg2 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rsg2;
	}
   	public ResultSet show_ge_score3(String stu_numy)
	{
		this.scoSql = "select score_gen "+
		"from inspector_gen "+
		"where term='3' "+
		"and stu_num='"+stu_numy+"'";
		ResultSet rsg3 = null;
		try
		{
			rsg3 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rsg3;
	}
   	public ResultSet show_ge_score4(String stu_numy)
	{
		this.scoSql = "select score_gen "+
		"from inspector_gen "+
		"where term='4' "+
		"and stu_num='"+stu_numy+"'";
		ResultSet rsg4 = null;
		try
		{
			rsg4 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rsg4;
	}
   	public ResultSet show_zh_score(String stu_numy)
	{
		this.scoSql = "select score_fi,score_se,score_th,score_fo "+
		"from score_zhsz "+
		"where term='1' "+
		"and stu_num='"+stu_numy+"'";
		ResultSet rsz = null;
		try
		{
			rsz = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rsz;
	}          
   	public ResultSet show_zh_score2(String stu_numy)
	{
		this.scoSql = "select score_fi,score_se,score_th,score_fo "+
		"from score_zhsz "+
		"where term='2' "+
		"and stu_num='"+stu_numy+"'";
		ResultSet rsz2 = null;
		try
		{
			rsz2 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rsz2;
	}
   	public ResultSet show_zh_score3(String stu_numy)
	{
		this.scoSql = "select score_fi,score_se,score_th,score_fo "+
		"from score_zhsz "+
		"where term='3' "+
		"and stu_num='"+stu_numy+"'";
		ResultSet rsz3 = null;
		try
		{
			rsz3 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rsz3;
	}
   	public ResultSet show_zh_score4(String stu_numy)
	{
		this.scoSql = "select score_fi,score_se,score_th,score_fo "+
		"from score_zhsz "+
		"where term='4' "+
		"and stu_num='"+stu_numy+"'";
		ResultSet rsz4 = null;
		try
		{
			rsz4 = super.exeQuery(this.scoSql);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return rsz4;
	}
	//�������Ա����StuDentid��ֵ
	public void setTermid(long termid)
	{
		this.termid = termid;
	}

	//��ȡ���Ա����StuDentid��ֵ
	public long getTermid()
	{
		return this.termid;
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
	//�������Ա����score_fis��ֵ
 	public void setScore_fis(String score_fis)
	{
		this.score_fis = score_fis;
	}

	//��ȡ���Ա����sex��ֵ
	public String getScore_fis()
	{
		return this.score_fis;
	}
	
	public void setScore_sec(String score_sec)
	{
		this.score_sec = score_sec;
	}

	//��ȡ���Ա����sex��ֵ
	public String getScore_sec()
	{
		return this.score_sec;
	}

	public void setScore_thr(String score_thr)
	{
		this.score_thr = score_thr;
	}

	//��ȡ���Ա����sex��ֵ
	public String getScore_thr()
	{
		return this.score_thr;
	}
	
	public void setScore_fou(String score_fou)
	{
		this.score_fou = score_fou;
	}

	//��ȡ���Ա����sex��ֵ
	public String getScore_fou()
	{
		return this.score_fou;
	}
}


