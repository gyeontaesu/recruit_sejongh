package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class DBConn {
	public Connection getConnection(){
		Connection conn = null;
		try {Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "webu01";
		String password = "tpwhd_$webu01";
		conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public void close(Connection conn, PreparedStatement pstmt ){
		if (conn != null){
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}


}
