package com.bar.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class asdwq {
	public static void main(String[] args) {
		Student ins=new Student();
		ResultSet tt=ins.show_students("", "¸ßÒ»","Ò»°à");
		

		try {
			while(tt.next()){
				System.out.print(tt.getString("stu_num"));
				System.out.print(tt.getString("school"));
				System.out.print(tt.getString("grade"));
				System.out.print(tt.getString("class_name"));
				//System.out.println(tt.getString("grade"));
				System.out.println(tt.getString("term"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
