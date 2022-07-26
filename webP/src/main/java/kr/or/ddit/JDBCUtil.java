package kr.or.ddit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	
	public static Connection conn;

	//생성자를 만들지 않고
	//public JDBCUtil() {}
	//static영역에 최초 한번만 드라이버를 생성하고 공유하여 사용
	//static {} : 클래스 초기화 블록 - 클래스 로딩시 처음 한번만 실행된다
	static {
		//드라이버 생성
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//DB Connection 메소드 생성
	public static Connection getConn() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		//연결 객체 생성에 필요한 정보 셋팅
		try {
			conn = DriverManager.getConnection(url, "cjh99", "java");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	//생성된 Connection객체 닫기
	/* 
	 * 객체 생성 후 반환(close)하지 않으면 자원의 낭비가 발생하며
	 * 일정한 수 이상의 객체 생성이 불가하다
	 * 
	 * Connection객체만 close하더라도 나머지 객체들이 자동 반환되지만
	 * 각 드라이버마다 동작이 다를수 있으므로 반드시 모든 객체를 역순 반환 처리한다 
	 * */
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
