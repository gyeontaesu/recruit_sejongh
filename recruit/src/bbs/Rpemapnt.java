package bbs;

public class Rpemapnt {
	
	private int apntinfono;
	private String apntyy;
	private String deptcd;
	private String titl;
	private String  recufild;
	
//세종병원은 바로 delete시켜 bbsAvailable를 사용하지 않음	
	public int getApntinfono() {
		return apntinfono;
	}
	public void setApntinfono(int apntinfono) {
		this.apntinfono = apntinfono;
	}
		public String getApntyy() {
		return apntyy;
	}
	public void setApntyy(String apntyy) {
		this.apntyy = apntyy;
	}
		
	public String getDeptcd() {
	return deptcd;
	}
	public void setDeptcd(String deptcd) {
		this.deptcd = deptcd;
	}
	
	public String getTitl() {
	return titl;
	}
	public void setTitl(String titl) {
		this.titl = titl;
	}
	
	public String getRecufild() {
	return recufild;
	}
	public void setRecufild(String recufild) {
		this.recufild = recufild;
	}
}
