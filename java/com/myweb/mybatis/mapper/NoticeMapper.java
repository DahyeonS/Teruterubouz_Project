package com.myweb.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.board.BoardDTO;

@Mapper
public interface NoticeMapper {
	List<BoardDTO> getBoardList(Map<String, Object> map);
	int getBoardCount(BoardDTO dto);
	BoardDTO getBoard(BoardDTO dto);
	
	int insert(BoardDTO dto);
	int update(BoardDTO dto);
	int delete(BoardDTO dto);
	
	int visitCnt(BoardDTO dto);
}
