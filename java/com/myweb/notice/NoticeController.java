package com.myweb.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeController {
	String view;
	
	@GetMapping("list")
	public String list() {
		view = "notice/list";
		return view;
	}
	
	@GetMapping("view")
	public String view() {
		view = "notice/view";
		return view;
	}
	
	@GetMapping("write")
	public String write() {
		view = "notice/write";
		return view;
	}
}
