package com.myweb.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.board.BoardDTO;

@Mapper
public interface BoardMapper {
	int insert(BoardDTO dto);
}
