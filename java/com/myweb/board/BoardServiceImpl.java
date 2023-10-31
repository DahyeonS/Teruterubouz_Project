package com.myweb.board;

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

}
