package com.myweb.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.board.BoardDTO;
import com.myweb.board.CommentDTO;
import com.myweb.member.MemberDTO;

@Mapper
public interface MemberMapper {
	MemberDTO getMember(MemberDTO dto);
	
	int insert(MemberDTO dto);
	int update(MemberDTO dto);
	int pwUpdate(MemberDTO dto);
	int delete(MemberDTO dto);
	
	List<BoardDTO> getBoard(Map<String, Object> map);
	BoardDTO getBoardNum(int num);
	int getBoardCount(BoardDTO dto);
	int deleteBoard(int num);
	
	List<BoardDTO> getReply(Map<String, Object> map);
	int getReplyCount(CommentDTO dto);
	int deleteReply(int num);
}
