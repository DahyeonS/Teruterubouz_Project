package com.myweb.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	List<BoardDTO> getBoardList(Map<String, Object> map);
	int getBoardCount(Map<String, Object> map);
	BoardDTO getBoard(BoardDTO dto);
	
	int visitCnt(BoardDTO dto);
	int insert(BoardDTO dto);
}
