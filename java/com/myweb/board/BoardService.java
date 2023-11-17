package com.myweb.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	List<BoardDTO> getBoardList(Map<String, Object> map);
	int getBoardCount(BoardDTO dto);
	List<BoardDTO> getboardListReply(Map<String, Object> map);
	int getBoardCountReply(BoardDTO dto);
	
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
