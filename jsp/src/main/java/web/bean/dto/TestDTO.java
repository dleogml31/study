package web.bean.dto;

public class TestDTO {
	//파라미터 이름과 동일하게 String으로 첫글자는 대문자(타입은 String이 기본)
	private String a;
	private String b;
	private String c;
	private String d;
	
	
	public void setA(String a) {this.a = a;}
	public void setB(String b) {this.b = b;}
	public void setC(String c) {this.c = c;}
	public void setD(String d) {this.d = d;}
	
	public String getA() { return a; }
	public String getB() { return b; }
	public String getC() { return c; }
	public String getD() { return d; }
	
}