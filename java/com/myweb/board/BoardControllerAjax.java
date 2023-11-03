package com.myweb.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.web.FileIO;

@RestController
@RequestMapping("boardApi")
public class BoardControllerAjax {
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService service;

	@PostMapping("uploadFile")
	public Map<String, Object> uploadFile(MultipartFile[] uploadFile) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = FileIO.uploadFile(uploadFile);
		
		map.put("fileId", list.toString());
		return map;
	}
	
	@PostMapping("write")
	public Map<String, Object> write(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.insert(dto);
		if (rs == 0) FileIO.deleteFile(dto.getFileId());
		map.put("rs", rs);
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
		
		dto = service.getBoard(dto);
		
		int rs = service.delete(dto);
		if (rs != 0) FileIO.deleteFile(dto.getFileId());
		
		map.put("rs", rs);
		return map;
	}
	
	@PostMapping("deleteImg")
	public Map<String, Object> deleteImg(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		String fileId = dto.getFileId();
		String fileName = dto.getFileName();
		
		dto = service.getBoard(dto);
		
		String [] splitFileId = dto.getFileId().split(fileId);
		String newFileId = "";
		for (int i=0; i<splitFileId.length; i++) {
			if (i == splitFileId.length-1 && splitFileId[i].substring(splitFileId[i].length()-2).equals(", ")) {
				newFileId += splitFileId[i].substring(0, splitFileId[i].length()-2);
			} else {
				if (splitFileId[i].length() > 0 && splitFileId[i].substring(0, 2).equals(", ")) newFileId += splitFileId[i].substring(2);
				else newFileId += splitFileId[i];
			}
		}
		
		String [] splitFileName = dto.getFileName().split(fileName);
		String newFileName = "";
		for (int i=0; i<splitFileName.length; i++) {
			if (i == splitFileName.length-1 && splitFileName[i].substring(splitFileName[i].length()-1).equals(",")) {
				newFileName += splitFileName[i].substring(0, splitFileName[i].length()-1);
			} else {
				if (splitFileName[i].length() > 0 && splitFileName[i].substring(0, 1).equals(",")) newFileName += splitFileName[i].substring(1);
				else newFileName += splitFileName[i];
			}
		}
		
		dto.setFileId(newFileId);
		dto.setFileName(newFileName);
		
		int rs = service.deleteImg(dto);
		if (rs != 0) FileIO.deleteFile(fileId);
		
		map.put("rs", rs);
		return map;
	}
	
	@PostMapping("boardList")
	public Map<String, Object> boardList(int page, BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", (page-1)*10);
		if (dto.getId() != null) map.put("id", dto.getId());
		else map.put("id", "");
		if (dto.getNickname() != null) map.put("nickname", dto.getNickname());
		else map.put("nickname", "");
		if (dto.getTitle() != null) map.put("title", dto.getTitle());
		else map.put("title", "");
		if (dto.getContent() != null) map.put("content", dto.getContent());
		else map.put("content", "");
		map.put("province", dto.getProvince());
		map.put("city", dto.getCity());
		map.put("district", dto.getDistrict());
		
		List<BoardDTO> list = service.getBoardList(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		if (list.size() != 0) result.put("rs", list);
		else result.put("rs", 0);
		
		return result;
	}
	
	@PostMapping("pagingBoard")
	public Map<String, Object> pagingBoard(int page, BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		int pageNum = page;
		int listNum = 10;
		int blockNum = 10;
		
		map.put("page", page);
		if (dto.getId() != null) map.put("id", dto.getId());
		else map.put("id", "");
		if (dto.getNickname() != null) map.put("nickname", dto.getNickname());
		else map.put("nickname", "");
		if (dto.getTitle() != null) map.put("title", dto.getTitle());
		else map.put("title", "");
		if (dto.getContent() != null) map.put("content", dto.getContent());
		else map.put("content", "");
		map.put("province", dto.getProvince());
		map.put("city", dto.getCity());
		map.put("district", dto.getDistrict());
		
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
	
	@PostMapping("getBoard")
	public Map<String, Object> getBoard(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.visitCnt(dto);
		if (rs == 1) dto = service.getBoard(dto);
		
		map.put("num", dto.getNum());
		map.put("id", dto.getId());
		map.put("nickname", dto.getNickname());
		map.put("title", dto.getTitle());
		map.put("content", dto.getContent());
		map.put("province", dto.getProvince());
		map.put("city", dto.getCity());
		map.put("district", dto.getDistrict());
		map.put("fileId", dto.getFileId());
		map.put("fileName", dto.getFileName());
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
		map.put("id", dto.getId());
		map.put("nickname", dto.getNickname());
		map.put("title", dto.getTitle());
		map.put("content", dto.getContent());
		map.put("province", dto.getProvince());
		map.put("city", dto.getCity());
		map.put("district", dto.getDistrict());
		map.put("fileId", dto.getFileId());
		map.put("fileName", dto.getFileName());
		map.put("postdate", dto.getPostdate());
		map.put("updateDate", dto.getUpdateDate());
		map.put("visitCount", dto.getVisitCount());
		return map;
	}
	
	@PostMapping("reply")
	public Map<String, Object> reply(CommentDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		int rs = service.reply(dto);
		
		map.put("rs", rs);
		return map;
	}
	
	@PostMapping("getReply")
	public Map<String, Object> getReply(CommentDTO dto, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", (page-1)*10);
		map.put("postNum", dto.getPostNum());
		
		List<CommentDTO> list = service.getReply(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		if (list.size() != 0) result.put("rs", list);
		else result.put("rs", 0);
		return result;
	}
	
	@PostMapping("pagingReply")
	public Map<String, Object> pagingReply(CommentDTO dto, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		int pageNum = page;
		int listNum = 10;
		int blockNum = 10;
		
		int totalCount = service.getReplyCount(dto);
		
		PagingDTO paging = new PagingDTO(totalCount, pageNum, listNum, blockNum);
		paging.setPaging();
		
		map.put("totalCount", paging.getTotalCount());
		map.put("listNum", paging.getListNum());
		map.put("blockNum", paging.getBlockNum());
		map.put("pageNum", paging.getPageNum());
		map.put("totalPage", paging.getTotalPage());
		map.put("startPage", paging.getStartPage());
		map.put("endPage", paging.getEndPage());
		map.put("isPrev", paging.isPrev());
		map.put("isNext", paging.isNext());
		map.put("isBPrev", paging.isBPrev());
		map.put("isBNext", paging.isBNext());
		
		return map;
	}
	
	@PostMapping("deleteReply")
	public Map<String, Object> deleteReply(CommentDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.deleteReply(dto);
		
		map.put("rs", rs);
		return map;
	}
}
