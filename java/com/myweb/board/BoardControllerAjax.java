package com.myweb.board;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@RestController
@RequestMapping("boardApi")
public class BoardControllerAjax {
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService service;

	@PostMapping("uploadFile")
	public Map<String, Object> uploadFile(MultipartFile[] uploadFile) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		String uploadFolder = "D:/kdigital2307/spring/springws/midproject/src/main/webapp/resources/uploads";
//		String uploadFolder = "D:/spring/springws/midproject/src/main/webapp/resources/uploads";
		
		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			list.add(uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 200, 150);
				thumbnail.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		map.put("fileId", list.toString());
		return map;
	}
	
	@PostMapping("write")
	public Map<String, Object> write(BoardDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rs = service.insert(dto);
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
}
