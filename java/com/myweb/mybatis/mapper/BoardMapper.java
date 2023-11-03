package com.myweb.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.board.BoardDTO;
import com.myweb.board.CommentDTO;

@Mapper
public interface BoardMapper {
	List<BoardDTO> getBoardList(Map<String, Object> map);
	int getBoardCount(Map<String, Object> map);
	BoardDTO getBoard(BoardDTO dto);
	
	int insert(BoardDTO dto);
	int update(BoardDTO dto);
	int delete(BoardDTO dto);
	
	int visitCnt(BoardDTO dto);
	int deleteImg(BoardDTO dto);
	
	List<CommentDTO> getReply(Map<String, Object> map);
	int getReplyCount(CommentDTO dto);
	int reply(CommentDTO dto);
	int deleteReply(CommentDTO dto);
}
