package com.myweb.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.board.BoardDTO;

@Mapper
public interface BoardMapper {
	List<BoardDTO> getBoardList(Map<String, Object> map);
	int getBoardCount(Map<String, Object> map);
	BoardDTO getBoard(BoardDTO dto);
	
	int visitCnt(BoardDTO dto);
	int insert(BoardDTO dto);
}
