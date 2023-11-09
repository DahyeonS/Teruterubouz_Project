package com.myweb.notice;

import java.util.List;
import java.util.Map;

import com.myweb.board.BoardDTO;

public interface NoticeService {
	List<BoardDTO> getBoardList(Map<String, Object> map);
	int getBoardCount(BoardDTO dto);
	BoardDTO getBoard(BoardDTO dto);
	
	int insert(BoardDTO dto);
	int update(BoardDTO dto);
	int delete(BoardDTO dto);
	
	int visitCnt(BoardDTO dto);
}
