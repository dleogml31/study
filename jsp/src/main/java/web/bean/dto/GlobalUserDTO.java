package web.bean.dto;

import java.sql.Timestamp;

public class GlobalUserDTO {
   private String id;
   private String pw;
   private String name;
   private String birth;
   private String phone;
   private String img;
   private Timestamp reg;
   private String auto;
 
public String getAuto(){
	return auto;
}
public void setAuto(String auto) {
	this.auto = auto;
}
public String getId() {
	return id;
}
public void setId(String id) {
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
	this.name = name;
}
public String getBirth() {
	return birth;
}
public void setBirth(String birth) {
	this.birth = birth;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public Timestamp getReg() {
	return reg;
}
public void setReg(Timestamp reg) {
	this.reg = reg;
}
   
}
