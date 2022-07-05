package bbs;

public class Bbs {
	
	private int apntinfono;
	private String examno;
	private String korname;
	private String regdate;
	private String supppsnmpphonno;
//	private int bbsAvailable;
//세종병원은 바로 delete시켜 bbsAvailable를 사용하지 않음	
	public int getApntinfono() {
		return apntinfono;
	}
	public void setApntinfono(int apntinfono) {
		this.apntinfono = apntinfono;
	}
		public String getExamno() {
		return examno;
	}
	public void setExamno(String examno) {
		this.examno = examno;
	}
		public String getKorname() {
		return korname;
	}
	public void setKorname(String korname) {
		this.korname = korname;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getSupppsnmpphonno() {
		return supppsnmpphonno;
	}
	public void setSupppsnmpphonno(String supppsnmpphonno) {
		this.supppsnmpphonno = supppsnmpphonno;
	}
	
	
	
	
//	public int getBbsAvailable() {
//		return bbsAvailable;
//	}
//	public void setBbsAvailable(int bbsAvailable) {
//		this.bbsAvailable = bbsAvailable;
//	}
//세종병원은 바로 delete시켜 bbsAvailable를 사용하지 않음
}