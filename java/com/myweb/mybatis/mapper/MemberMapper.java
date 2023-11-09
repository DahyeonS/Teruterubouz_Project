package com.myweb.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.board.BoardDTO;
import com.myweb.member.MemberDTO;

@Mapper
public interface MemberMapper {
	MemberDTO getMember(MemberDTO dto);
	List<BoardDTO> getBoard(Map<String, Object> map);
	BoardDTO getBoardNum(int num);
	int getBoardCount(BoardDTO dto);
	int deleteBoard(int num);
	
	int insert(MemberDTO dto);
	int update(MemberDTO dto);
	int pwUpdate(MemberDTO dto);
	int delete(MemberDTO dto);
}
