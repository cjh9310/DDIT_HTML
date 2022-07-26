package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardDao {

	//전체 글 갯수 조회
	public int countList() throws SQLException;
	
	//게시글 목록 조회
	public List<BoardVO> boardList(Map<String,Object> map) throws SQLException;
}
