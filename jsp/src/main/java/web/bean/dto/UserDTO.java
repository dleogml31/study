package web.bean.dto;

public class UserDTO {

	
	// 필드 - 항상 private
	   private String id;
	   private String pw;
	   private String name;
	   private int age;
	   // 밑에 보이는게 공식이므로 외워두도록 하자 set 이후 변수 첫문자는 무조건 대문자
	   public String getId() {
	      return id;
	   }
	   public void setId(String id) {
	      System.out.println("setId()==="+id);
	      this.id = id;
	   }
	   public String getPw() {
	      return pw;
	   }
	   public void setPw(String pw) {
	      this.pw = pw;
	   }
	   public String getName() {
	      return name;
	   }
	   public void setName(String name) {
	      System.out.println("setName()==="+name);
	      this.name = name;
	   }
	   public int getAge() {
	      return age;
	   }
	   public void setAge(int age) {
	      //1~150사이
	      if(age > 0 && age <= 150) {
	         this.age = age;
	      }
	   }

	}
