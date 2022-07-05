package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MainRecruitDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public MainRecruitDAO() {
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
		String SQL = "SELECT APNTINFONO FROM RPEMAPNT ORDER BY APNTINFONO DESC";
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
	public int write(String APNTINFONO, String APNTYY) {
		String SQL = "INSERT INTO RPEMAPNT VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, APNTINFONO);
			pstmt.setString(3, APNTYY);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<MainRecruit> getlist(int pageNumber) {
     //   String SQL = "SELECT * FROM RPEMENSU WHERE APNTINFONO < ? AND bbsAvailable = 1 ORDER BY APNTINFONO DESC LIMIT 10";  

		
        String SQL = "SELECT * FROM (SELECT APNTINFONO, DEPTCD, TITL, APNTFROMDD, APNTTODD, INSTCD FROM RPEMAPNT WHERE APNTINFONO < ? ORDER BY APNTINFONO DESC) WHERE ROWNUM <=20";  
        //ORACLE은 LIMIT쿼리가 없고 ROWNUM으로 SELECT를 감싸서 사용
        ArrayList<MainRecruit> list = new ArrayList<MainRecruit>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 20);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	MainRecruit rpemapnt = new MainRecruit();
            	rpemapnt.setApntinfono(rs.getInt(1));  
            	rpemapnt.setDeptcd(rs.getString(2));  
            	rpemapnt.setTitl(rs.getString(3)); 
            	rpemapnt.setApntfromdd(rs.getString(4)); 
            	rpemapnt.setApnttodd(rs.getString(5)); 
            	rpemapnt.setInstcd(rs.getString(6));  
                //세종병원은 바로 delete시켜 bbsAvailable를 사용하지 않음
                list.add(rpemapnt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
}
 
public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM (SELECT * FROM RPEMAPNT WHERE APNTINFONO < ? ORDER BY APNTINFONO DESC) WHERE ROWNUM <=20";
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