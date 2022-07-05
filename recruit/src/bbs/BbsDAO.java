package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "webu01";
		String password = "tpwhd_$webu01";
		conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 현재 시간을 가져오는 함수, 게시판의 글을 작성할 때 현재 서버의 시간을 넣어주는 역할
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	// 게시글 번호는 하나씩 늘어나므로 마지막에 쓰인 글을 가져와서 +1을 하면 다음 번호가 된다 
	//채용_기본정보, 테이블명 RPEMAPNT
	public int getNext() {
		String SQL = "SELECT APNTINFONO FROM RPEMENSU ORDER BY APNTINFONO DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	// 실제로 글을 작성하는 함수
	public int write(String KORNAME, String BRTHMD, String SUPPPSNMPPHONNO) {
		String SQL = "INSERT INTO RPEMENSU VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, KORNAME);
			pstmt.setString(3, BRTHMD);
			pstmt.setString(4, getDate());
			pstmt.setString(5, SUPPPSNMPPHONNO);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Bbs> getlist(int pageNumber) {
     //   String SQL = "SELECT * FROM RPEMENSU WHERE APNTINFONO < ? AND bbsAvailable = 1 ORDER BY APNTINFONO DESC LIMIT 10";  
		//삭제유무 값인  bbsAvailable를 사용함
		
        String SQL = "SELECT * FROM (SELECT * FROM RPEMENSU WHERE APNTINFONO < ? ORDER BY APNTINFONO DESC) WHERE ROWNUM <=10";  
        //세종병원은 바로 delete시켜 bbsAvailable를 사용하지 않음
        //ORACLE은 LIMIT쿼리가 없고 ROWNUM으로 SELECT를 감싸서 사용
        ArrayList<Bbs> list = new ArrayList<Bbs>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Bbs bbs = new Bbs();
                bbs.setApntinfono(rs.getInt(1));
                bbs.setExamno(rs.getString(2));              
                bbs.setKorname(rs.getString(3));
                bbs.setRegdate(rs.getString(4));                
                bbs.setSupppsnmpphonno(rs.getString(5));                         
                //bbs.setBbsAvailable(rs.getInt(6));
                //세종병원은 바로 delete시켜 bbsAvailable를 사용하지 않음
                list.add(bbs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
}
 
public boolean nextPage(int pageNumber) {
        //String SQL = "SELECT * FROM RPEMENSU WHERE APNTINFONO < ? AND bbsAvailable = 1 ORDER BY APNTINFONO DESC LIMIT 10";
        //삭제유무 값인  bbsAvailable를 사용함
        String SQL = "SELECT * FROM (SELECT * FROM RPEMENSU WHERE APNTINFONO < ? ORDER BY APNTINFONO DESC) WHERE ROWNUM <=10";
        //세종병원은 바로 delete시켜 bbsAvailable를 사용하지 않음
        //ORACLE은 LIMIT쿼리가 없고 ROWNUM으로 SELECT를 감싸서 사용
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
}
}