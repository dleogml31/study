package web.bean.dto;

public class MemberDTO {
	private String name;
	private int age;
	
	public void setName(String name) {
		System.out.println("Member--setName()===" + name);
		this.name = name;}
		
	public void setAge(int age) {this.age = age;}
	
	public String getName() {return name;}
	public int getAge() {return age;}
	

}
