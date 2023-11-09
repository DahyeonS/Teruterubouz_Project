package com.myweb.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.board.BoardDTO;
import com.myweb.mybatis.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeMapper dao;

	@Override
	public int insert(BoardDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Object> map) {
		return dao.getBoardList(map);
	}

	@Override
	public int getBoardCount(BoardDTO dto) {
		return dao.getBoardCount(dto);
	}

	@Override
	public int delete(BoardDTO dto) {
		return dao.delete(dto);
	}

	@Override
	public BoardDTO getBoard(BoardDTO dto) {
		return dao.getBoard(dto);
	}

	@Override
	public int visitCnt(BoardDTO dto) {
		return dao.visitCnt(dto);
	}

	@Override
	public int update(BoardDTO dto) {
		return dao.update(dto);
	}
}
