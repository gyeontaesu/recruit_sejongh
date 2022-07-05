package bbs;

public class Recruit {
	
	private int apntinfono;
	private String apntfromdd;
	private String apnttodd;
	private String regdate;
	private String supppsnmpphonno;
//	private int bbsAvailable;
//세종병원은 바로 delete시켜 bbsAvailable를 사용하지 않음	
	public int getApntinfono() {
		return apntinfono;
	}

	public void setApntinfono(int apntinfonRecruito) {
		this.apntinfono = apntinfono;
	}
	
		public String getApntfromdd() {
		return apntfromdd;
	}
		
	public void setApntfromdd(String apntfromdd) {
		this.apntfromdd = apntfromdd;
	}
		public String getApnttodd() {
		return apnttodd;
	}
	public void setApnttodd(String apnttodd) {
		this.apnttodd = apnttodd;
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