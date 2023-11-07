package com.myweb.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeController {
	String view;
	
	@GetMapping("page")
	public String page() {
		view = "notice/page";
		return view;
	}
	
	@GetMapping("write")
	public String write() {
		view = "notice/write";
		return view;
	}
}
