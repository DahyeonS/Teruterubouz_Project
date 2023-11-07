package com.myweb.notice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("noticeApi")
public class NoticeControllerAjax {
	@Autowired
	@Qualifier("noticeServiceImpl")
	NoticeService service;
	
	@PostMapping("write")
	public Map<String, Object> write() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}
}
