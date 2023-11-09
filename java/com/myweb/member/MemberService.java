package com.myweb.member;

import java.util.List;
import java.util.Map;

import com.myweb.board.BoardDTO;

public interface MemberService {
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
