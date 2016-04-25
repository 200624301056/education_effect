package entity;

public class Inspector {
	private long idInspector_gen;
	private String stu_num;
	private String score_gen;
	private String school;
	private String class_name;
	private String grade;
	private String term;
	
	
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String className) {
		class_name = className;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public long getIdInspector_gen() {
		return idInspector_gen;
	}
	public void setIdInspector_gen(long idInspectorGen) {
		idInspector_gen = idInspectorGen;
	}
	public String getStu_num() {
		return stu_num;
	}
	public void setStu_num(String stuNum) {
		stu_num = stuNum;
	}
	public String getScore_gen() {
		return score_gen;
	}
	public void setScore_gen(String scoreGen) {
		score_gen = scoreGen;
	}
	
}
