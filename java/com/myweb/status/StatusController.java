package com.myweb.status;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api")
public class StatusController {
	@Autowired
	@Qualifier("statusServiceImpl")
	StatusService service;
	
	@GetMapping("getTemp")
	public Map<String, Object> getYear() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<StatusDTO> list = service.getTemp();
		
		if(list.size() != 0) map.put("rs", list);
		else map.put("rs", 0);
		
		return map;
	}
	
	@GetMapping("getRain")
	public Map<String, Object> getRain() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<StatusDTO> list = service.getRain();
		
		if(list.size() != 0) map.put("rs", list);
		else map.put("rs", 0);
		
		return map;
	}
}
