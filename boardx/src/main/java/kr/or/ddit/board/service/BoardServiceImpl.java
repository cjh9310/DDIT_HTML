package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements IBoardService {

	private BoardDaoImpl dao;
	private static BoardServiceImpl service;
	
	//1
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getDao();
	}
	//2
	public static BoardServiceImpl getService() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}
	
	@Override
	public int countList() {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			count = dao.countList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public List<BoardVO> boardList(Map<String, Object> map) {
		List<BoardVO> list = null;
		try {
			list = dao.boardList(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
