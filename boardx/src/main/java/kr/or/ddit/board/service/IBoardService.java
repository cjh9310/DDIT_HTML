package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardService {

	//접근제한자 반환타입 메소드명 (요청데이터)
	
	//전체 글 갯수 조회
	public int countList();
	
	//게시글 목록 조회
	public List<BoardVO> boardList(Map<String,Object> map);
	
}
