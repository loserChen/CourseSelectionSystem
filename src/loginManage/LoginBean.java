package loginManage;

public class LoginBean {
        private String username;
        private String password;
        private String studentName;
        public String getUserName(){
        	return username;
        }
        public void setUserName(String username){
        	this.username=username;
        }
        public String getPassword(){
        	return password;
        }
        public void setPassword(String password){
        	this.password=password;
        }
        public String getName(){
        	return studentName;
        }
        public void setName(String studentName){
        	this.studentName=studentName;
        }
}

