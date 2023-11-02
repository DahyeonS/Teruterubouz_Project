package com.myweb.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mybatis.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardMapper dao;
	
	@Override
	public int insert(BoardDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Object> map) {
		return dao.getBoardList(map);
	}

	@Override
	public int getBoardCount(Map<String, Object> map) {
		return dao.getBoardCount(map);
	}

	@Override
	public BoardDTO getBoard(BoardDTO dto) {
		return dao.getBoard(dto);
	}

	@Override
	public int visitCnt(BoardDTO dto) {
		return dao.visitCnt(dto);
	}

}