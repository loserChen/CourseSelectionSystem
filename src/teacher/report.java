package teacher;

public class report {
	private String studentNumber;
	private String courseNumber;
	private String teacherNumber;
	private int studentScore;
	
	public String getStudentNumber(){
		return studentNumber;
	}
	public String getCourseNumber(){
		return courseNumber;
	}
	public String getTeacherNumber(){
		return teacherNumber;
	}
	public int getStudentScore(){
		return studentScore;
	}
	
	public void setStudentNumber(String studentNumber){
		this.studentNumber = studentNumber;
	}
	public void setCourseNumber(String courseNumber){
		this.courseNumber = courseNumber;
	}
	public void setTeacherNumber(String teacherNumber){
		this.teacherNumber = teacherNumber;
	}
	public void setStudentScore(int studentScore){
		this.studentScore = studentScore;
	}
}
