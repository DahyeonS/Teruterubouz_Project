package com.myweb.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myweb.board.BoardDTO;
import com.myweb.board.PagingDTO;

@RestController
@RequestMapping("memberApi")
public class MemberControllerAjax {
	@Autowired
	@Qualifier("memberServiceImpl")
	MemberService service;
	
	@PostMapping("login")
	public Map<String, Object> login(MemberDTO dto, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String pw = dto.getPw();
		
		dto = service.getMember(dto);
		
		if (dto.getPw().equals(pw)) map.put("rs", 1);
		else map.put("rs", 0);
		
		session.setAttribute("id", dto.getId());
		session.setAttribute("nickname", dto.getNickname());
		session.setAttribute("grade", dto.getGrade());

		return map;
	}
	
	@PostMapping("idCheck")
	public Map<String, Object> idCheck(MemberDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberDTO result = service.getMember(dto);
		if (result == null) map.put("rs", 0);
		else map.put("rs", 1);
		
		return map;
	}
	
	@PostMapping("nickCheck")
	public Map<String, Object> nickCheck(MemberDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberDTO result = service.getMember(dto);
		if (result == null) map.put("rs", 0);
		else map.put("rs", 1);
		
		return map;
	}
	
	@PostMapping("join")
	public Map<String, Object> join(MemberDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.insert(dto);
		map.put("rs", rs);
		return map;
	}
	
	@PostMapping("pwCheck")
	public Map<String, Object> pwCheck(MemberDTO dto, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("id");
		String pw = dto.getPw();
		
		dto.setId(id);
		dto = service.getMember(dto);
		
		if (dto.getPw().equals(pw)) map.put("rs", 1);
		else map.put("rs", 0);
		
		return map;
	}
	
	@PostMapping("update")
	public Map<String, Object> update(MemberDTO dto, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.update(dto);
		if (rs == 1) session.setAttribute("nickname", dto.getNickname());
		map.put("rs", rs);
		
		return map;
	}
	
	@PostMapping("pwUpdate")
	public Map<String, Object> pwUpdate(MemberDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.pwUpdate(dto);
		map.put("rs", rs);
		
		return map;
	}

	@PostMapping("delete")
	public Map<String, Object> delete(MemberDTO dto, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("id");
		String pw = dto.getPw();
		
		dto.setId(id);
		dto = service.getMember(dto);
		
		if (dto.getPw().equals(pw)) {
			service.delete(dto);
			session.invalidate();
			map.put("rs", 1);
		} else map.put("rs", 0);
		
		return map;
	}
	
	@PostMapping("boardList")
	public Map<String, Object> boardList(HttpSession session, int page, int limit, String title, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("id");
		map.put("id", id);
		map.put("page", (page-1)*10);
		map.put("limit", limit);
		if (title != null) map.put("title", title);
		else map.put("title", "");
		if (content != null) map.put("content", content);
		else map.put("content", "");
		
		List<BoardDTO> list = service.getBoard(map);
		Map<String, Object> result = new HashMap<String, Object>();
		if (list.size() != 0) result.put("rs", list);
		else result.put("rs", 0);
		
		return result;
	}
	
	@PostMapping("pagingBoard")
	public Map<String, Object> pagingBoard(HttpSession session, int page, int limit, String title, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("id");
		int pageNum = page;
		int listNum = limit;
		int blockNum = 10;
		map.put("id", id);
		map.put("page", page);
		map.put("limit", limit);
		if (title != null) map.put("title", title);
		else map.put("title", "");
		if (content != null) map.put("content", content);
		else map.put("content", "");
		
		int totalCount = service.getBoardCount(map);
		
		PagingDTO paging = new PagingDTO(totalCount, pageNum, listNum, blockNum);
		paging.setPaging();
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("totalCount", paging.getTotalCount());
		result.put("listNum", paging.getListNum());
		result.put("blockNum", paging.getBlockNum());
		result.put("pageNum", paging.getPageNum());
		result.put("totalPage", paging.getTotalPage());
		result.put("startPage", paging.getStartPage());
		result.put("endPage", paging.getEndPage());
		result.put("isPrev", paging.isPrev());
		result.put("isNext", paging.isNext());
		result.put("isBPrev", paging.isBPrev());
		result.put("isBNext", paging.isBNext());
		
		return result;
	}
	
	@PostMapping("deleteBoard")
	public Map<String, Object> deleteBoard(int num) {
		Map<String, Object> map = new HashMap<String, Object>();
		int rs = service.deleteBoard(num);
		map.put("rs", rs);
		
		return map;
	}
}
