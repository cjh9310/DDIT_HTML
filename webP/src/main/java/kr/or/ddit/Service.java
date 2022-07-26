package kr.or.ddit;

import java.util.Map;

public class Service {

	private Dao dao;
	private static Service service;
	
	//싱글톤방식
	//1. private Constructor
	private Service() {
		dao = dao.getInstance();
	}
	//2. static method
	public static Service getInstance() {
		if(service == null) {
			service = new Service();
		}
		return service;
	}
	
	//메소드 생성
	public Map<String, Object> selectMemberOne(String name) {
		Map<String, Object> map = dao.selectMemberOne(name);
		return map;
	}
	
}
