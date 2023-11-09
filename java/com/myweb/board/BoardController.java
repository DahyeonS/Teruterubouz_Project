package com.myweb.board;

import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.web.FileIO;

@Controller
@RequestMapping("board")
public class BoardController {
	String view;
	
	@GetMapping("list")
	public String list() {
		view = "board/list";
		return view;
	}
	
	@GetMapping("write")
	public String write() {
		view = "board/write";
		return view;
	}
	
	@GetMapping("view")
	public String view() {
		view = "board/view";
		return view;
	}
	
	@GetMapping(value = "download", produces = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<Resource> downloadFile(BoardDTO dto, @RequestHeader("User-Agent") String userAgent) throws Exception {
		return FileIO.download(dto, userAgent);
	}
}
