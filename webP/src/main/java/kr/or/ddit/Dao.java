package kr.or.ddit;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class Dao {
	
	private static Dao dao;
	
	//싱글톤 패턴 - 메모리에 인스턴스를 하나만 올려놓고 공유해서 사용
	//싱글톤 패턴 특징 2가지
	//1. private Constructor - 현재 위치 외 다른곳에서 인스턴스 생성 방지
	private Dao() {}
	//2. static method
	public static Dao getInstance() {
		if(dao == null) {
			dao = new Dao();
		}
		return dao;
	}
	
	

	//요청데이터를 전달받아 상세정보를 조회하는 메소드
	//접근제한자 리턴타입 메소드명(매개변수)
	public Map<String, Object> selectMemberOne(String name) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String sql = "select * from member where mem_name = '" + name + "'";
		
		//1. Connection 객체 생성
		Connection conn = JDBCUtil.getConn();
		
		try {
			//2. Statement객체 생성 - sql실행하는 역할
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			//3. SQL실행 - 데이터 받아옴
			while(rs.next()) {
				map.put("id", rs.getString("mem_id"));
				map.put("hp", rs.getString("mem_hp"));
				map.put("mail", rs.getString("mem_mail"));
			}
			//4. 객체 닫기
			JDBCUtil.close(conn, stmt, rs);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
}
