package com.myweb.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myweb.board.BoardDTO;
import com.myweb.board.PagingDTO;

@RestController
@RequestMapping("noticeApi")
public class NoticeControllerAjax {
	@Autowired
	@Qualifier("noticeServiceImpl")
	NoticeService service;
	
	@PostMapping("write")
	public Map<String, Object> write(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.insert(dto);
		map.put("rs", rs);
		return map;
	}
	
	@PostMapping("boardList")
	public Map<String, Object> boardList(int page, int limit, BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		if (dto.getTitle() != null) map.put("title", dto.getTitle());
		else map.put("title", "");
		if (dto.getContent() != null) map.put("content", dto.getContent());
		else map.put("content", "");
		
		List<BoardDTO> list = service.getBoardList(map);
		Map<String, Object> result = new HashMap<String, Object>();
		if (list.size() != 0) result.put("rs", list);
		else result.put("rs", 0);
		
		return result;
	}
	
	@PostMapping("pagingBoard")
	public Map<String, Object> pagingBoard(int page, int limit, BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		int pageNum = page;
		int listNum = limit;
		int blockNum = 10;
		
		if (dto.getId() == null) dto.setId("");
		if (dto.getNickname() == null) dto.setNickname("");
		if (dto.getTitle() == null) dto.setTitle("");
		if (dto.getContent() == null) dto.setContent("");
		
		int totalCount = service.getBoardCount(dto);
		
		PagingDTO paging = new PagingDTO(totalCount, pageNum, listNum, blockNum);
		paging.setPaging();
		
		map.put("pageNum", paging.getPageNum());
		map.put("startPage", paging.getStartPage());
		map.put("endPage", paging.getEndPage());
		map.put("isPrev", paging.isPrev());
		map.put("isNext", paging.isNext());
		map.put("isBPrev", paging.isBPrev());
		map.put("isBNext", paging.isBNext());
		
		return map;
	}
	
	@PostMapping("getBoard")
	public Map<String, Object> getBoard(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.visitCnt(dto);
		if (rs == 1) dto = service.getBoard(dto);
		
		map.put("num", dto.getNum());
		map.put("title", dto.getTitle());
		map.put("content", dto.getContent());
		map.put("postdate", dto.getPostdate());
		map.put("updateDate", dto.getUpdateDate());
		map.put("visitCount", dto.getVisitCount());
		return map;
	}
	
	@PostMapping("load")
	public Map<String, Object> load(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		dto = service.getBoard(dto);
		
		map.put("num", dto.getNum());
		map.put("title", dto.getTitle());
		map.put("content", dto.getContent());
		map.put("postdate", dto.getPostdate());
		map.put("updateDate", dto.getUpdateDate());
		map.put("visitCount", dto.getVisitCount());
		return map;
	}
	
	@PostMapping("update")
	public Map<String, Object> update(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.update(dto);
		map.put("rs", rs);
		return map;
	}
	
	@PostMapping("delete")
	public Map<String, Object> delete(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.delete(dto);
		map.put("rs", rs);
		
		return map;
	}
}
