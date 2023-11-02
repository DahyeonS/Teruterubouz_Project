package com.myweb.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		view = "board/boardview";
		return view;
	}
}