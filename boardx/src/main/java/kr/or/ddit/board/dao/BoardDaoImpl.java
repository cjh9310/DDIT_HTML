package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.ibatis.config.BuildedSqlMapClient;

public class BoardDaoImpl implements IBoardDao {

	private SqlMapClient smc;
	private static BoardDaoImpl dao;
	
	//싱글톤 방식으로 객체 생성
	//특징1 - private constructor
	private BoardDaoImpl () {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	//특징2 - static method
	public static BoardDaoImpl getDao() {
		if(dao == null) dao = new BoardDaoImpl();
		return dao;
	}
	
	@Override
	public int countList() throws SQLException {
		//객체로 db에 접근해서 데이터 반환하기..
		int count = (int) smc.queryForObject("board.countList");
		return count;
	}
	@Override
	public List<BoardVO> boardList(Map<String, Object> map) throws SQLException {
		List<BoardVO> list = smc.queryForList("board.boardList",map);
		return list;
	}

}
