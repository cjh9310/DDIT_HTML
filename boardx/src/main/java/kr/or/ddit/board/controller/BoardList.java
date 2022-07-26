package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.vo.BoardVO;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/BoardList")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	  //요청데이터 받기
	  //String page = request.getParameter("page");
	  int sPage = 0;	//현재 페이지
	  sPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
	  //한 화면에 출력할 페이지 수
	  int perPage = 2;
	  
	  //한 화면에 출력할 글 갯수
	  int perList = 5;
	  
	  //전체 글갯수 조회하기 - service객체 필요 > dao > service > cont
	  BoardServiceImpl service = BoardServiceImpl.getService();
	  int count = service.countList();
	  
	  //전체 페이지 수 = 전체 글갯수 / 페이지당 글 갯수(perList)
	  // *double로 소수점을 발생시키고 연산해야 정상적인 값을 얻을 수 있다
	  int totalPage = (int) Math.ceil(count / perList);
	  //System.out.println(">>>>>> " + (double)21 / (double)perList);
		
	  //페이지에 표시될 게시글의 시작(start)값 끝(end)값 - 1page 1,5 / 2page 6,10
	  //start = (현재페이지 - 1) * 페이지당 글갯수 + 1;
	  // 	현재페이지 (1 - 1) * 5 + 1 = 1; 
	  // 	현재페이지 (2 - 1) * 5 + 1 = 6; 
	  // 	현재페이지 (3 - 1) * 5 + 1 = 11; 
	  // 	현재페이지 (4 - 1) * 5 + 1 = 16; 
	  // 	현재페이지 (5 - 1) * 5 + 1 = 21; 
	  int start = (sPage - 1) * perList + 1;
	  //end = start + 페이지당 글갯수 - 1;
	  //	1 + 5 - 1 = 5;
	  //	6 + 5 - 1 = 10;
	  //	11 + 5 - 1 = 15;
	  //	16 + 5 - 1 = 20;
	  //	16 + 5 - 1 = 25;
	  int end = start + perList - 1;
	  
	  // *전체 글 갯수(count)보다 end값이 클 경우, count값을 end에 대입
	  if(end > count) end = count;
	  
	  
	  //페이지에 표시될 페이지번호 - startPage, endPage
	  // startPage = ((현재페이지 - 1) / 출력페이지수 * 출력페이지수) + 1;
	  //			현재페이지 ((1 - 1) / 2 * 2) + 1 = 1
	  //			현재페이지 ((2 - 1) / 2 * 2) + 1 = 1
	  //			현재페이지 ((3 - 1) / 2 * 2) + 1 = 3
	  //			현재페이지 ((4 - 1) / 2 * 2) + 1 = 3
	  int startPage = ((sPage - 1) / perPage * perPage) + 1;
	  
	  // endPage = startPage + 출력페이지수 - 1;
	  //			1 + 2 - 1 = 2;
	  //			3 + 2 - 1 = 4;
	  //			5 + 2 - 1 = 6;
	  int endPage = startPage + perPage - 1; 
	  
	  // *전체 페이지 갯수(totalPage)보다 endPage값이 클 경우, totalPage값을 endPage에 대입
	  if(endPage > totalPage) endPage = totalPage;
	  
	  // 게시글 목록 조회
	  Map<String, Object> map = new HashMap<String, Object>();
	  map.put("start", start);
	  map.put("end", end);
	  
	  List<BoardVO> list = service.boardList(map);
	  
	  //결과 값을 request에 저장
	  request.setAttribute("list", list);
	  request.setAttribute("sPage", startPage);
	  request.setAttribute("ePage", endPage);
	  request.setAttribute("ttPage", totalPage);
	  
	  //결과값을 만들어 출력을 담당할 jsp로 request를 포워딩하기..
	  RequestDispatcher disp = request.getRequestDispatcher("board/list.jsp");
	  disp.forward(request, response);
	}
}